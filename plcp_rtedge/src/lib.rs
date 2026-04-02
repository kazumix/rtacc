//! PLCP の `Functionblock_Register` / `Structure_CreateCatalog` に相当する FB インスタンス登録と
//! セグメント・ピンオフセット（C ランタイム FFI）。
//!
//! レイアウト数値は `fb_layout` と `examples/IL/plcp_ton_segment_layout.h`（TON）と整合。

mod fb_layout;

use std::ffi::CStr;
use std::os::raw::c_char;
use std::sync::Mutex;

use fb_layout::{fb_member_offset as layout_member_offset, fb_segment_bytes as layout_segment_bytes};

static FB_REGISTRY: Mutex<Vec<(String, String)>> = Mutex::new(Vec::new());

/// `EgTagCreateSegment` 成功後に呼ぶ（全 FUNCTION ファミリで inst を登録）。
#[no_mangle]
pub extern "C" fn plcp_rtedge_after_segment(inst: *const c_char, fb: *const c_char) {
    if inst.is_null() || fb.is_null() {
        return;
    }
    let inst = unsafe { CStr::from_ptr(inst) };
    let fb = unsafe { CStr::from_ptr(fb) };
    let Ok(is) = inst.to_str() else {
        return;
    };
    let Ok(f) = fb.to_str() else {
        return;
    };
    let fam = f.to_string();
    let mut g = FB_REGISTRY.lock().unwrap();
    if !g.iter().any(|(i, _)| i == is) {
        g.push((is.to_string(), fam));
    }
}

#[no_mangle]
pub extern "C" fn plcp_rtedge_clear_instances() {
    let mut g = FB_REGISTRY.lock().unwrap();
    g.clear();
}

fn registry_family_for_inst(inst: &str) -> Option<String> {
    let g = FB_REGISTRY.lock().unwrap();
    g.iter()
        .find(|(i, _)| i == inst)
        .map(|(_, f)| f.clone())
}

/// ファミリ名（例: `TON`, `ADD`）→ セグメントバイト数。未対応は 0。
#[no_mangle]
pub extern "C" fn plcp_rtedge_fb_segment_bytes_by_name(fb: *const c_char) -> u32 {
    if fb.is_null() {
        return 0;
    }
    let s = unsafe { CStr::from_ptr(fb) };
    let Ok(f) = s.to_str() else {
        return 0;
    };
    layout_segment_bytes(f).unwrap_or(0)
}

/// `fb`（ファミリ）とメンバ名からオフセット。未解決は -1。
#[no_mangle]
pub extern "C" fn plcp_rtedge_fb_member_offset(fb: *const c_char, member: *const c_char) -> i32 {
    if fb.is_null() || member.is_null() {
        return -1;
    }
    let f = unsafe { CStr::from_ptr(fb) };
    let m = unsafe { CStr::from_ptr(member) };
    let (Ok(fa), Ok(me)) = (f.to_str(), m.to_str()) else {
        return -1;
    };
    layout_member_offset(fa, me)
        .map(|u| u as i32)
        .unwrap_or(-1)
}

/// フルタグ `INST.member` が登録済み FB のピンなら 1。
#[no_mangle]
pub extern "C" fn plcp_rtedge_parse_fb_pin(
    full: *const c_char,
    inst_out: *mut c_char,
    inst_out_sz: usize,
    member_out: *mut c_char,
    member_out_sz: usize,
) -> i32 {
    if full.is_null() || inst_out.is_null() || member_out.is_null() || inst_out_sz == 0 || member_out_sz == 0
    {
        return 0;
    }
    let s = unsafe { CStr::from_ptr(full) };
    let Ok(full) = s.to_str() else {
        return 0;
    };
    let Some(dot) = full.rfind('.') else {
        return 0;
    };
    let (inst, mem) = full.split_at(dot);
    let mem = &mem[1..];
    let Some(fam) = registry_family_for_inst(inst) else {
        return 0;
    };
    if layout_member_offset(&fam, mem).is_none() {
        return 0;
    }
    unsafe {
        write_c_str(inst_out, inst_out_sz, inst);
        write_c_str(member_out, member_out_sz, mem);
    }
    1
}

unsafe fn write_c_str(dst: *mut c_char, sz: usize, s: &str) {
    let b = s.as_bytes();
    let n = b.len().min(sz.saturating_sub(1));
    std::ptr::copy_nonoverlapping(b.as_ptr(), dst as *mut u8, n);
    *dst.add(n) = 0;
}

// --- TON 互換 FFI（既存シンボル）---

pub const TON_SEGMENT_BYTES: u32 = 24;

pub fn ton_member_offset(member: &str) -> Option<u32> {
    layout_member_offset("TON", member)
}

#[no_mangle]
pub extern "C" fn plcp_rtedge_parse_ton_pin(
    full: *const c_char,
    inst_out: *mut c_char,
    inst_out_sz: usize,
    member_out: *mut c_char,
    member_out_sz: usize,
) -> i32 {
    plcp_rtedge_parse_fb_pin(full, inst_out, inst_out_sz, member_out, member_out_sz)
}

#[no_mangle]
pub extern "C" fn plcp_rtedge_ton_member_offset(member: *const c_char) -> i32 {
    if member.is_null() {
        return -1;
    }
    let s = unsafe { CStr::from_ptr(member) };
    let Ok(m) = s.to_str() else {
        return -1;
    };
    ton_member_offset(m).map(|u| u as i32).unwrap_or(-1)
}

#[no_mangle]
pub extern "C" fn plcp_rtedge_ton_segment_bytes() -> u32 {
    layout_segment_bytes("TON").unwrap_or(24)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn offsets_fit_segment() {
        assert!(ton_member_offset("_IN_").unwrap() < TON_SEGMENT_BYTES);
        assert!(ton_member_offset("_STTIME_").unwrap() + 8 <= TON_SEGMENT_BYTES);
    }
}
