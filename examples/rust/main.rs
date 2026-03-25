//! INtime RTA: `AllocateRtMemory` + `CreateRtMemoryHandle` で確保した共有領域を、
//! **オブジェクトメールボックス**で RT メモリハンドルを往復させながら 2 スレッドが取引する例。
//!
//! INtime の FFI / RAII は [`intime`]（[`INtime.rs`](./INtime.rs)）に分離。
//!
//! ## 所有権（SDK の対応関係）
//!
//! | API | 解放 |
//! |-----|------|
//! | [`AllocateRtMemory`](https://support.tenasys.com/7-1/allocatertmemory.html) | [`FreeRtMemory`](https://support.tenasys.com/7-1/freertmemory.html)（`pAddress`） |
//! | [`CreateRtMemoryHandle`](https://support.tenasys.com/7-1/creatertmemoryhandle.html) | [`DeleteRtMemoryHandle`](https://support.tenasys.com/7-1/deletertmemoryhandle.html)（GDT スロットのみ解放。バイト領域は `FreeRtMemory`） |
//! | [`MapRtSharedMemory`](https://support.tenasys.com/7-1/maprtsharedmemory.html) が返すアドレス | 同じく [`FreeRtMemory`](https://support.tenasys.com/7-1/freertmemory.html) でマッピング解除（共有元の物理は別途 `Allocate` 側で `Free`） |
//! | [`CreateRtMailbox`](https://support.tenasys.com/7-1/creatertmailbox.html) | [`DeleteRtMailbox`](https://support.tenasys.com/7-1/deletertmailbox.html) |
//!
//! ### `AllocateRtMemory` と `CreateRtMemoryHandle`（任意）
//!
//! [`AllocateRtMemory`] だけでバッファを使うことは可能。**[`CreateRtMemoryHandle`] は必須ではない**
//! （メールボックスでハンドル渡しする・他コンテキストで [`MapRtSharedMemory`] するときなど、共有用
//! オブジェクトが要る場合だけ付与する）。
//!
//! [`intime::RtBuffer`] は **親**（確保ブロック）を常に持ち、**子**（セグメントハンドル）は
//! [`intime::RtBuffer::create_segment_handle`] を **必要な回数**（同一バッファに対して複数回可。都度別の
//! RTHANDLE）呼べる。解放は **1 つの `Drop` で全 `DeleteRtMemoryHandle` → `FreeRtMemory`**。

#![no_std]
#![no_main]

#[path = "INtime.rs"]
mod intime;

use core::ffi::{c_char, c_void};
use core::ptr::NonNull;
use core::sync::atomic::{AtomicI32, Ordering};

use intime::{
    create_rt_thread, is_memory_handle, printf_cstr, printf_summary, receive_rt_handle, rt_sleep,
    send_rt_handle, RtBuffer, RtHandle, RtMailbox,
};

// --- 共有レイアウト ---------------------------------------------------------------------------

#[repr(C)]
pub struct SharedMailboxData {
    pub seq: AtomicI32,
    pub value: AtomicI32,
    pub sum_seen: AtomicI32,
    pub done_bits: AtomicI32,
}

#[repr(C)]
pub struct ThreadCtx {
    pub p_mem: NonNull<SharedMailboxData>,
    pub mbx_to_a: u16,
    pub mbx_to_b: u16,
}

const RT_BUF_SIZE: usize = 4096;
const ITER: i32 = 5;
const WAIT_FOREVER: u32 = 0xFFFF_FFFF;
const MBX_FLAGS: u16 = 0;

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

// --- ThreadCtx --------------------------------------------------------------------------------

impl ThreadCtx {
    unsafe fn as_ref<'a>(lp_param: *mut c_void) -> Option<&'a Self> {
        if lp_param.is_null() {
            return None;
        }
        Some(&*(lp_param as *const ThreadCtx))
    }

    fn shared(&self) -> &SharedMailboxData {
        unsafe { self.p_mem.as_ref() }
    }
}

// --- スレッド ---------------------------------------------------------------------------------

#[derive(Clone, Copy)]
enum Role {
    Producer,
    Consumer,
}

fn run_mailbox_thread(role: Role, lp_param: *mut c_void) {
    let ctx = match unsafe { ThreadCtx::as_ref(lp_param) } {
        Some(c) => c,
        None => return,
    };
    let mem = ctx.shared();
    let (recv_mbx, send_mbx) = match role {
        Role::Producer => (RtHandle::new(ctx.mbx_to_a), RtHandle::new(ctx.mbx_to_b)),
        Role::Consumer => (RtHandle::new(ctx.mbx_to_b), RtHandle::new(ctx.mbx_to_a)),
    };
    let (Some(recv), Some(send)) = (recv_mbx, send_mbx) else {
        return;
    };

    for _ in 0..ITER {
        let Some(h) = receive_rt_handle(recv, WAIT_FOREVER) else {
            break;
        };
        if !is_memory_handle(h) {
            continue;
        }
        match role {
            Role::Producer => {
                let s = mem.seq.fetch_add(1, Ordering::SeqCst) + 1;
                mem.value.store(s * 10, Ordering::SeqCst);
            }
            Role::Consumer => {
                let v = mem.value.load(Ordering::SeqCst);
                mem.sum_seen.fetch_add(v, Ordering::SeqCst);
            }
        }
        let _ = send_rt_handle(send, h, RtHandle::RESPONSE_NONE);
    }

    match role {
        Role::Producer => {
            mem.done_bits.fetch_or(1, Ordering::SeqCst);
        }
        Role::Consumer => {
            mem.done_bits.fetch_or(2, Ordering::SeqCst);
        }
    }
}

// --- エントリ ---------------------------------------------------------------------------------

#[no_mangle]
pub extern "C" fn main(_argc: i32, _argv: *mut *mut c_char) -> i32 {
    match run() {
        Ok(()) => 0,
        Err(code) => code,
    }
}

fn run() -> Result<(), i32> {
    let Some(mut buf) = RtBuffer::allocate_zeroed(RT_BUF_SIZE) else {
        printf_cstr(b"AllocateRtMemory failed\n\0");
        return Err(1);
    };
    let kick = match buf.create_segment_handle() {
        Ok(h) => h,
        Err(()) => {
            printf_cstr(b"CreateRtMemoryHandle failed\n\0");
            return Err(1);
        }
    };

    let Some(mbx_a) = RtMailbox::create(MBX_FLAGS) else {
        printf_cstr(b"CreateRtMailbox failed\n\0");
        return Err(1);
    };
    let Some(mbx_b) = RtMailbox::create(MBX_FLAGS) else {
        printf_cstr(b"CreateRtMailbox failed\n\0");
        return Err(1);
    };

    let ctx = ThreadCtx {
        p_mem: buf.ptr_cast::<SharedMailboxData>(),
        mbx_to_a: mbx_a.handle().raw(),
        mbx_to_b: mbx_b.handle().raw(),
    };

    let ctx_ptr: *mut c_void = core::ptr::addr_of!(ctx).cast_mut().cast();

    if !create_rt_thread(0, rust_thread_a_entry, 4096, ctx_ptr) {
        printf_cstr(b"CreateRtThread(A) failed\n\0");
        return Err(1);
    }
    if !create_rt_thread(0, rust_thread_b_entry, 4096, ctx_ptr) {
        printf_cstr(b"CreateRtThread(B) failed\n\0");
        return Err(1);
    }

    if !send_rt_handle(mbx_a.handle(), kick, RtHandle::RESPONSE_NONE) {
        printf_cstr(b"SendRtHandle(kick) failed\n\0");
        return Err(1);
    }

    for _ in 0..5000 {
        let bits = ctx.shared().done_bits.load(Ordering::SeqCst);
        if (bits & 3) == 3 {
            break;
        }
        rt_sleep(10);
    }

    let sm = ctx.shared();
    let seq = sm.seq.load(Ordering::SeqCst);
    let value = sm.value.load(Ordering::SeqCst);
    let sum_seen = sm.sum_seen.load(Ordering::SeqCst);
    let done_bits = sm.done_bits.load(Ordering::SeqCst);
    let expect = 10 + 20 + 30 + 40 + 50;
    printf_summary(seq, value, sum_seen, done_bits, expect);
    Ok(())
}

#[no_mangle]
pub extern "C" fn rust_thread_a_entry(lp_param: *mut c_void) {
    run_mailbox_thread(Role::Producer, lp_param);
}

#[no_mangle]
pub extern "C" fn rust_thread_b_entry(lp_param: *mut c_void) {
    run_mailbox_thread(Role::Consumer, lp_param);
}
