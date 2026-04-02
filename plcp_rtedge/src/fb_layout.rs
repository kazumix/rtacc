//! FUNCTION セグメントのバイト長とメンバオフセット。
//! - TON: `examples/IL/plcp_ton_segment_layout.h`
//! - CTU: `examples/PLCPFB/Counter.c` `CTU_PIN`（#pragma pack 1）
//! - ADD/SUB/MUL/DIV/MOD: `examples/PLCPEN/*_EN.c` の EN/IN1/IN2/ENO/OUT（P_ANY=4B ポインタ相当）
//! - AND/OR/XOR/…: `examples/PLCPEN/LogicOpe_EN.c` の LOGIC_OPE_PIN（EN 付き BOOL 論理は ADD と同型）
//! - EQ/NE/GT/…: `examples/PLCPEN/EQ_EN.c` 等の EQ_PIN（2 入力比較も同型）
//! - NOT: `NOT_EN` / `NOT_BOOL_EN` — EN, IN, ENO, OUT（`not_en_offset`）
//! - TP: `examples/PLCPFB/Timer.c` `TP_PIN`（TON と同型の並び; IL は EN 付き TON と同じ整列モデル）

/// 2 入力 EN 付き FB（ADD_PIN / EQ_PIN / LOGIC_OPE_PIN / SHR_PIN 相当）のセグメント長
const SEGMENT_EN_IN1_IN2_ENO_OUT: u32 = 16;
/// MOVE_PIN / WORD_TO_* / LN（NUMERIC_PIN）等 1 入力＋OUT
const SEGMENT_MOVE_LIKE: u32 = 16;
/// R_TRIG / F_TRIG（llil: CLK, Q, _prev_clk）
const SEGMENT_TRIG_EDGE: u32 = 12;

fn family_is_type_conversion_en(family: &str) -> bool {
    let u = family.to_ascii_uppercase();
    u.starts_with("WORD_TO_")
        || u.starts_with("DWORD_TO_")
        || u.starts_with("UDINT_TO_")
        || u.starts_with("INT_TO_")
        || u.starts_with("REAL_TO_")
        || u.starts_with("LREAL_TO_")
        || u.starts_with("BOOL_TO_")
        || u.starts_with("BYTE_TO_")
        || u.starts_with("SINT_TO_")
        || u.starts_with("UINT_TO_")
        || u.starts_with("USINT_TO_")
}

/// Eg セグメント確保バイト（`il_fb_segment_size_bytes` / `EgTagCreateSegment` と一致）
pub fn fb_segment_bytes(family: &str) -> Option<u32> {
    let u = family.to_ascii_uppercase();
    if family_is_type_conversion_en(&u) {
        return Some(SEGMENT_MOVE_LIKE);
    }
    if u.starts_with("R_TRIG") || u.starts_with("F_TRIG") {
        return Some(SEGMENT_TRIG_EDGE);
    }
    Some(match u.as_str() {
        "TON" | "TOF" => 24,
        "TP" => 40,
        "CTU" | "CTD" => 32,
        "CTUD" => 48, // 実ピンは 12B だが Eg 側は従来どおり余裕を確保
        "ADD" | "SUB" | "MUL" | "DIV" | "MOD" => SEGMENT_EN_IN1_IN2_ENO_OUT,
        "AND" | "OR" | "XOR" | "ANDN" | "ORN" | "XORN" => SEGMENT_EN_IN1_IN2_ENO_OUT,
        "EQ" | "NE" | "GT" | "GE" | "LT" | "LE" => SEGMENT_EN_IN1_IN2_ENO_OUT,
        "NOT" => SEGMENT_MOVE_LIKE,
        "MOVE" | "LN" | "LOG" | "EXP" | "EXPT" => SEGMENT_MOVE_LIKE,
        "SHR" | "SHL" | "ROL" | "BIT_TEST" => SEGMENT_EN_IN1_IN2_ENO_OUT,
        _ => return None,
    })
}

fn trig_edge_offset(m: &str) -> Option<u32> {
    match m {
        "CLK" => Some(0),
        "Q" => Some(1),
        "_prev_clk" | "_PREV_CLK" => Some(2),
        _ => None,
    }
}

/// メンバ名 → 先頭からのバイトオフセット（なければ None）
pub fn fb_member_offset(family: &str, member: &str) -> Option<u32> {
    let fam = family.to_ascii_uppercase();
    let m = member;
    if family_is_type_conversion_en(&fam) {
        return not_en_offset(m);
    }
    if fam.starts_with("R_TRIG") || fam.starts_with("F_TRIG") {
        return trig_edge_offset(m);
    }
    match fam.as_str() {
        "MOVE" | "LN" | "LOG" | "EXP" => not_en_offset(m),
        "SHR" | "SHL" | "ROL" | "BIT_TEST" => arith_en_offset(m),
        "EXPT" => arith_en_offset(m),
        "TON" | "TOF" => ton_like_offset(m),
        "TP" => tp_like_offset(m),
        "CTU" => match m {
            "CU" => Some(0),
            "RESET" => Some(1),
            "PV" => Some(2),
            "Q" => Some(4),
            "CV" => Some(5),
            "_CU_" | "_prev_cu" => Some(7),
            _ => None,
        },
        "CTD" => match m {
            "CD" => Some(0),
            "LOAD" => Some(1),
            "PV" => Some(2),
            "Q" => Some(4),
            "CV" => Some(5),
            "_CD_" | "_prev_cd" => Some(7),
            _ => None,
        },
        "CTUD" => match m {
            "CU" => Some(0),
            "CD" => Some(1),
            "RESET" => Some(2),
            "LOAD" => Some(3),
            "PV" => Some(4),
            "QU" => Some(6),
            "QD" => Some(7),
            "CV" => Some(8),
            "_CU_" | "_prev_cu" => Some(10),
            "_CD_" | "_prev_cd" => Some(11),
            _ => None,
        },
        "ADD" | "SUB" | "MUL" | "DIV" | "MOD" => arith_en_offset(m),
        "AND" | "OR" | "XOR" | "ANDN" | "ORN" | "XORN" => arith_en_offset(m),
        "EQ" | "NE" | "GT" | "GE" | "LT" | "LE" => arith_en_offset(m),
        "NOT" => not_en_offset(m),
        _ => None,
    }
}

fn ton_like_offset(m: &str) -> Option<u32> {
    Some(match m {
        "EN" => 0,
        "IN" => 1,
        "PT" => 4,
        "ET" => 8,
        "Q" => 12,
        "_IN_" => 13,
        "_STTIME_" => 16,
        _ => return None,
    })
}

/// TP: PLCPFB TP_PIN 相当 + IL 用 EN（TON と同じ整列: EN, IN, PT, ET, Q, _IN_, _STTIME_）
fn tp_like_offset(m: &str) -> Option<u32> {
    ton_like_offset(m)
}

/// PLCPEN ADD_PIN pack(1): EN@0, IN1@1..4, IN2@5..8, ENO@9, OUT@10..13 → 14B 使用、セグメントは 16B
fn arith_en_offset(m: &str) -> Option<u32> {
    match m {
        "EN" => Some(0),
        "IN1" => Some(1),
        "IN2" => Some(5),
        "ENO" => Some(9),
        "OUT" => Some(10),
        _ => None,
    }
}

/// NOT_PIN（`LogicOpe_EN.c` NOT_EN）: EN@0, IN@1, ENO@5, OUT@6（pack(1)、P_ANY 4B）
fn not_en_offset(m: &str) -> Option<u32> {
    match m {
        "EN" => Some(0),
        "IN" => Some(1),
        "ENO" => Some(5),
        "OUT" => Some(6),
        _ => None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ctu_fits_32() {
        assert!(fb_member_offset("CTU", "_prev_cu").unwrap() < fb_segment_bytes("CTU").unwrap());
    }

    #[test]
    fn add_fits_16() {
        assert!(fb_member_offset("ADD", "OUT").unwrap() + 4 <= fb_segment_bytes("ADD").unwrap());
    }

    #[test]
    fn and_xor_same_as_add_segment() {
        assert_eq!(fb_segment_bytes("AND"), fb_segment_bytes("ADD"));
        assert_eq!(fb_member_offset("XOR", "IN2"), fb_member_offset("ADD", "IN2"));
    }

    #[test]
    fn not_fits_16() {
        assert!(fb_member_offset("NOT", "OUT").unwrap() + 4 <= fb_segment_bytes("NOT").unwrap());
    }

    #[test]
    fn word_to_int_move_like_16() {
        assert_eq!(fb_segment_bytes("WORD_TO_INT"), Some(16));
        assert_eq!(fb_member_offset("WORD_TO_INT", "IN"), Some(1));
    }

    #[test]
    fn r_trig_fits_12() {
        assert!(fb_member_offset("R_TRIG", "_prev_clk").unwrap() < fb_segment_bytes("R_TRIG").unwrap());
    }
}
