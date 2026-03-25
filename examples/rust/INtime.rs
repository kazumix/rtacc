//! INtime RT オブジェクトの Rust ラッパ（`no_std`）。
//! `rt.h` / `rt.lib` の FFI と、RAII による解放順の整理。

use core::ffi::{c_char, c_void};
use core::ptr::NonNull;

mod ffi {
    use super::c_char;
    use super::c_void;

    extern "C" {
        pub fn AllocateRtMemory(size: u32) -> *mut c_void;
        pub fn FreeRtMemory(p: *mut c_void) -> u32;
        pub fn CreateRtMemoryHandle(p: *mut c_void, size: u32) -> u16;
        pub fn DeleteRtMemoryHandle(h_seg: u16) -> u8;
        pub fn MapRtSharedMemory(h_seg: u16) -> *mut c_void;
        pub fn CreateRtMailbox(flags: u16) -> u16;
        pub fn DeleteRtMailbox(h_mailbox: u16) -> u8;
        pub fn CreateRtThread(
            prio: u8,
            entry: unsafe extern "C" fn(*mut c_void),
            stack: u32,
            param: *mut c_void,
        ) -> u16;
        pub fn SendRtHandle(h_mailbox: u16, h_object: u16, h_response: u16) -> u8;
        pub fn RtSleep(ms: u32);
        pub fn ReceiveRtHandle(
            h_mailbox: u16,
            dw_milliseconds: u32,
            lph_response: *mut u16,
        ) -> u16;
        pub fn GetRtHandleType(h_object: u16) -> u16;
        pub fn printf(format: *const c_char, ...) -> i32;
    }
}

pub const BAD_RTHANDLE_U16: u16 = 0xFFFF;
pub const TYPE_MEMORY: u16 = 6;
/// 同一 [`AllocateRtMemory`] に付けられる [`CreateRtMemoryHandle`] の保持上限（`no_std` のため固定長）。
pub const MAX_SEGMENT_HANDLES: usize = 16;

// --- ハンドル値 -----------------------------------------------------------------------------

#[derive(Clone, Copy)]
pub struct RtHandle(u16);

impl RtHandle {
    pub const RESPONSE_NONE: Self = Self(0);

    pub fn new(raw: u16) -> Option<Self> {
        if raw == BAD_RTHANDLE_U16 {
            None
        } else {
            Some(Self(raw))
        }
    }

    pub fn raw(self) -> u16 {
        self.0
    }
}

// --- AllocateRtMemory + CreateRtMemoryHandle（任意・複数可） --------------------------------

/// [`AllocateRtMemory`] したブロック。[`CreateRtMemoryHandle`] は **必須ではない**。
///
/// - 同一バッファに対して [`CreateRtMemoryHandle`] を **複数回**呼べ、都度別の RTHANDLE。
/// - [`Drop`] で **すべて** `DeleteRtMemoryHandle` → `FreeRtMemory`。
pub struct RtBuffer {
    ptr: NonNull<c_void>,
    size: usize,
    segment_handles: [Option<RtHandle>; MAX_SEGMENT_HANDLES],
    segment_len: usize,
}

impl RtBuffer {
    /// [`AllocateRtMemory`] のみ。内容は **未初期化**（SDK がゼロを保証しない限り不定）。
    pub fn allocate(size: usize) -> Option<Self> {
        let p = unsafe { ffi::AllocateRtMemory(size as u32) };
        Some(Self {
            ptr: NonNull::new(p)?,
            size,
            segment_handles: [None; MAX_SEGMENT_HANDLES],
            segment_len: 0,
        })
    }

    /// [`AllocateRtMemory`] 後、[`zero_memory`] で `vec![0u8; n]` や `&mut [u8]::fill(0)` に相当するゼロ初期化まで行う。
    pub fn allocate_zeroed(size: usize) -> Option<Self> {
        let b = Self::allocate(size)?;
        zero_memory(b.ptr_void(), size);
        Some(b)
    }

    pub fn create_segment_handle(&mut self) -> Result<RtHandle, ()> {
        if self.segment_len >= MAX_SEGMENT_HANDLES {
            return Err(());
        }
        let raw = unsafe { ffi::CreateRtMemoryHandle(self.ptr.as_ptr(), self.size as u32) };
        let h = RtHandle::new(raw).ok_or(())?;
        self.segment_handles[self.segment_len] = Some(h);
        self.segment_len += 1;
        Ok(h)
    }

    pub fn ptr_void(&self) -> NonNull<c_void> {
        self.ptr
    }

    pub fn ptr_cast<T>(&self) -> NonNull<T> {
        self.ptr.cast()
    }

    /// 最後に [`create_segment_handle`] したハンドル（なければ `None`）。
    #[allow(dead_code)]
    pub fn last_segment_handle(&self) -> Option<RtHandle> {
        if self.segment_len == 0 {
            None
        } else {
            self.segment_handles[self.segment_len - 1]
        }
    }
}

impl Drop for RtBuffer {
    fn drop(&mut self) {
        unsafe {
            while self.segment_len > 0 {
                self.segment_len -= 1;
                // `slice::get_mut` は境界外で `None` のみ（`[]` のパニック境界チェックを避ける）
                if let Some(slot) = self.segment_handles.get_mut(self.segment_len) {
                    if let Some(h) = slot.take() {
                        let _ = ffi::DeleteRtMemoryHandle(h.raw());
                    }
                }
            }
            let _ = ffi::FreeRtMemory(self.ptr.as_ptr());
        }
    }
}

// --- MapRtSharedMemory ----------------------------------------------------------------------

/// [`MapRtSharedMemory`] のビュー。マッピング解除は [`FreeRtMemory`]。
#[allow(dead_code)]
pub struct RtMappedSharedView {
    ptr: NonNull<c_void>,
}

#[allow(dead_code)]
impl RtMappedSharedView {
    pub fn map(h_seg: RtHandle) -> Option<Self> {
        let p = unsafe { ffi::MapRtSharedMemory(h_seg.raw()) };
        Some(Self {
            ptr: NonNull::new(p)?,
        })
    }

    pub fn ptr(&self) -> NonNull<c_void> {
        self.ptr
    }
}

#[allow(dead_code)]
impl Drop for RtMappedSharedView {
    fn drop(&mut self) {
        unsafe {
            let _ = ffi::FreeRtMemory(self.ptr.as_ptr());
        }
    }
}

// --- CreateRtMailbox --------------------------------------------------------------------------

/// [`CreateRtMailbox`]。`Drop` で [`DeleteRtMailbox`]。
pub struct RtMailbox {
    h: RtHandle,
}

impl RtMailbox {
    pub fn create(flags: u16) -> Option<Self> {
        let raw = unsafe { ffi::CreateRtMailbox(flags) };
        Some(Self {
            h: RtHandle::new(raw)?,
        })
    }

    pub fn handle(&self) -> RtHandle {
        self.h
    }
}

impl Drop for RtMailbox {
    fn drop(&mut self) {
        unsafe {
            let _ = ffi::DeleteRtMailbox(self.h.raw());
        }
    }
}

// --- ヘルパ ----------------------------------------------------------------------------------

/// [`AllocateRtMemory`] などで得た生領域を `&mut [u8]` 相当として [`slice::fill`](https://doc.rust-lang.org/core/primitive.slice.html#method.fill)(0) でゼロ埋めする。
pub fn zero_memory(p: NonNull<c_void>, len: usize) {
    if len == 0 {
        return;
    }
    unsafe {
        core::slice::from_raw_parts_mut(p.as_ptr().cast::<u8>(), len).fill(0);
    }
}

pub fn create_rt_thread(
    prio: u8,
    entry: unsafe extern "C" fn(*mut c_void),
    stack: u32,
    param: *mut c_void,
) -> bool {
    let h = unsafe { ffi::CreateRtThread(prio, entry, stack, param) };
    RtHandle::new(h).is_some()
}

pub fn send_rt_handle(mailbox: RtHandle, object: RtHandle, response: RtHandle) -> bool {
    unsafe { ffi::SendRtHandle(mailbox.raw(), object.raw(), response.raw()) != 0 }
}

pub fn receive_rt_handle(mailbox: RtHandle, timeout_ms: u32) -> Option<RtHandle> {
    let h = unsafe { ffi::ReceiveRtHandle(mailbox.raw(), timeout_ms, core::ptr::null_mut()) };
    RtHandle::new(h)
}

pub fn is_memory_handle(h: RtHandle) -> bool {
    unsafe { ffi::GetRtHandleType(h.raw()) == TYPE_MEMORY }
}

pub fn rt_sleep(ms: u32) {
    unsafe {
        ffi::RtSleep(ms);
    }
}

pub fn printf_cstr(msg: &'static [u8]) {
    unsafe {
        ffi::printf(msg.as_ptr().cast());
    }
}

pub fn printf_summary(seq: i32, value: i32, sum_seen: i32, done_bits: i32, expect: i32) {
    unsafe {
        ffi::printf(
            b"rust_rt_mailbox: seq=%d value=%d sum_seen=%d done_bits=%d (expect sum_seen=%d)\n\0"
                .as_ptr()
                .cast(),
            seq,
            value,
            sum_seen,
            done_bits,
            expect,
        );
    }
}
