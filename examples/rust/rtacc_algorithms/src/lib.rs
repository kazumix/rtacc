//! INtime RTA: **外部クレート**で代表的アルゴリズムを試す最小サンプル（`no_std`）。
//!
//! - [`heapless`](https://docs.rs/heapless): 固定容量 **BinaryHeap**（優先度付きキュー／ヒープソート相当の取り出し順）
//! - [`micromath`](https://docs.rs/micromath): `F32Ext::sqrt` は **高速近似**（平均 ~5% 誤差。`2.0.sqrt()`≈1.5 等）。
//!   `no_std` では `f32::sqrt` が無い環境があるため、検証には [`libm::sqrtf`] を使う。
//!
//! INtime の FFI は [`intime`](../../INtime.rs)（このサンプルでは `printf` のみ使用）。

#![no_std]
#![no_main]

#[allow(dead_code)]
#[path = "../../INtime.rs"]
mod intime;

use core::ffi::c_char;

use heapless::binary_heap::{BinaryHeap, Max};
use intime::printf_cstr;

mod ffi {
    use core::ffi::c_char;
    extern "C" {
        pub fn printf(format: *const c_char, ...) -> i32;
    }
}

fn printf_i32(msg: &'static [u8], v: i32) {
    unsafe {
        ffi::printf(msg.as_ptr().cast(), v);
    }
}

fn printf_i32_pair(msg: &'static [u8], a: i32, b: i32) {
    unsafe {
        ffi::printf(msg.as_ptr().cast(), a, b);
    }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

/// `heapless::BinaryHeap` で最大値から順に取り出し、期待列と一致するか検証する。
fn run_heap_demo() -> bool {
    const CAP: usize = 16;
    let mut heap: BinaryHeap<i32, Max, CAP> = BinaryHeap::new();
    let input: [i32; 8] = [3, 1, 4, 1, 5, 9, 2, 6];
    for &x in &input {
        if heap.push(x).is_err() {
            printf_cstr(b"heapless BinaryHeap push overflow\n\0");
            return false;
        }
    }
    let expected: [i32; 8] = [9, 6, 5, 4, 3, 2, 1, 1];
    for (i, &exp) in expected.iter().enumerate() {
        let Some(v) = heap.pop() else {
            printf_cstr(b"heapless BinaryHeap pop underflow\n\0");
            return false;
        };
        printf_i32_pair(b"heap pop[%d] = %d\n\0", i as i32, v);
        if v != exp {
            printf_i32_pair(b"heap mismatch at step: got %d expect %d\n\0", v, exp);
            return false;
        }
    }
    heap.pop().is_none()
}

/// `libm::sqrtf` で \(\sqrt{2}\) を検証。micromath の `F32Ext::sqrt` は参考表示（高速近似）。
fn run_sqrt_demo() -> bool {
    let x = libm::sqrtf(2.0f32);
    let err = (x - core::f32::consts::SQRT_2).abs();
    printf_i32(b"sqrt(2)*1e6 (libm): %d\n\0", (x * 1_000_000.0) as i32);
    let mm = <f32 as micromath::F32Ext>::sqrt(2.0f32);
    printf_i32(b"micromath sqrt(2)*1e6: %d\n\0", (mm * 1_000_000.0) as i32);
    err < 1.0e-4
}

#[no_mangle]
pub extern "C" fn main(_argc: i32, _argv: *mut *mut c_char) -> i32 {
    let heap_ok = run_heap_demo();
    let sqrt_ok = run_sqrt_demo();
    if heap_ok && sqrt_ok {
        printf_cstr(b"rust_rt_algorithms: PASS (heapless + libm + micromath approx)\n\0");
        0
    } else {
        printf_cstr(b"rust_rt_algorithms: FAIL\n\0");
        1
    }
}
