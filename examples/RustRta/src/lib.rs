//! INtime RTA: 2 スレッドで共有メモリを扱う Rust ライブラリ
//! C の main から CreateRtThread でこのエントリが呼ばれる。

#![no_std]

use core::ffi::c_void;
use core::sync::atomic::{AtomicI32, Ordering};

/// C の shared_t と同じレイアウト（rt.h の CreateRtThread に渡す lpParam 用）
#[repr(C)]
pub struct Shared {
    pub counter: AtomicI32,
    /// 0=実行中, 1=スレッド1完了, 2=両方完了
    pub done: AtomicI32,
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

// INtime RT API (rt.h) の宣言
extern "C" {
    fn RtSleep(ms: u32);
}

/// スレッド1のエントリ。CreateRtThread の lpEntry に渡す。
/// lpParam は Shared*（C の shared_t*）を指す。
#[no_mangle]
pub extern "C" fn rust_thread1_entry(lp_param: *mut c_void) {
    if lp_param.is_null() {
        return;
    }
    let shared = unsafe { &*(lp_param as *const Shared) };
    for _ in 0..5 {
        shared.counter.fetch_add(1, Ordering::SeqCst);
        unsafe { RtSleep(50); }
    }
    shared.done.fetch_add(1, Ordering::SeqCst);
}

/// スレッド2のエントリ。CreateRtThread の lpEntry に渡す。
#[no_mangle]
pub extern "C" fn rust_thread2_entry(lp_param: *mut c_void) {
    if lp_param.is_null() {
        return;
    }
    let shared = unsafe { &*(lp_param as *const Shared) };
    for _ in 0..5 {
        shared.counter.fetch_add(1, Ordering::SeqCst);
        unsafe { RtSleep(30); }
    }
    shared.done.fetch_add(1, Ordering::SeqCst);
}
