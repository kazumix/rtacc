use std::collections::HashMap;
use std::env;
use std::fs;
use std::path::Path;

/// IL のトークン種別（最小サブセット）
#[derive(Debug, Clone, PartialEq)]
enum TokenKind {
    Ident(String),
    Int(i64),
    Var,      // VAR
    BoolTy,   // BOOL#
    IntTy,    // INT#
    UintTy,   // UINT#
    Ld,       // LD
    Ldn,      // LDN
    And,      // AND
    Andn,     // ANDN
    Or,       // OR
    St,       // ST
    Add,      // ADD
    Gt,       // GT
    Cal,      // CAL
    Newline,  // 行区切り（; の代わり）
}

#[derive(Debug, Clone)]
struct Token {
    kind: TokenKind,
    pos: usize,
}

fn is_ident_start(c: char) -> bool {
    c.is_ascii_alphabetic() || c == '_'
}

fn is_ident_char(c: char) -> bool {
    // IL の型付き即値や VAR 宣言で使われる `INT#Xxx` 形式、
    // フィールドアクセス `CTU_1.CU` などを扱うため、`#` や `.` も含める
    c.is_ascii_alphanumeric() || c == '_' || c == '#' || c == '.'
}

/// ごく簡易な IL 用レキサ
fn lex(input: &str) -> Result<Vec<Token>, String> {
    let mut tokens = Vec::new();
    let mut i = 0;
    let bytes = input.as_bytes();

    while i < bytes.len() {
        let c = bytes[i] as char;

        // コメント (* ... *) をスキップ
        if c == '(' && i + 1 < bytes.len() && bytes[i + 1] as char == '*' {
            i += 2;
            while i + 1 < bytes.len() {
                if bytes[i] as char == '*' && bytes[i + 1] as char == ')' {
                    i += 2;
                    break;
                }
                i += 1;
            }
            continue;
        }
        if c == '\r' {
            i += 1;
            continue;
        }
        if c == '\n' {
            tokens.push(Token {
                kind: TokenKind::Newline,
                pos: i,
            });
            i += 1;
            continue;
        }
        if c.is_whitespace() {
            i += 1;
            continue;
        }
        let pos = i;

        // 数値（とりあえず 10 進のみ）
        if c.is_ascii_digit() {
            let start = i;
            i += 1;
            while i < bytes.len() && (bytes[i] as char).is_ascii_digit() {
                i += 1;
            }
            let s = &input[start..i];
            let v: i64 = s
                .parse()
                .map_err(|e| format!("整数リテラルのパースに失敗しました: {e}"))?;
            tokens.push(Token {
                kind: TokenKind::Int(v),
                pos,
            });
            continue;
        }

        // 英字開始トークン（命令/識別子/型）
        if is_ident_start(c) {
            let start = i;
            i += 1;
            while i < bytes.len() && is_ident_char(bytes[i] as char) {
                i += 1;
            }
            let ident = &input[start..i];
            let upper = ident.to_ascii_uppercase();
            let kind = match upper.as_str() {
                "VAR" => TokenKind::Var,
                "LD" => TokenKind::Ld,
                "LDN" => TokenKind::Ldn,
                "AND" => TokenKind::And,
                "ANDN" => TokenKind::Andn,
                "OR" => TokenKind::Or,
                "ST" => TokenKind::St,
                "ADD" => TokenKind::Add,
                "GT" => TokenKind::Gt,
                "CAL" => TokenKind::Cal,
                // 型接頭辞（INT#, UINT#, BOOL#）だけをトークンにする
                "INT" => TokenKind::IntTy,
                "UINT" => TokenKind::UintTy,
                "BOOL" => TokenKind::BoolTy,
                _ => TokenKind::Ident(ident.to_string()),
            };
            tokens.push(Token { kind, pos });
            continue;
        }

        return Err(format!("未知の文字 '{}' (バイト位置 {pos})", c));
    }

    Ok(tokens)
}

#[derive(Debug, Clone, Copy, PartialEq)]
enum VarType {
    Bool,
    Int,
    Uint,
    Time, // IEC TIME → IR では i32（ミリ秒等）
}

#[derive(Debug, Clone)]
struct VarDecl {
    name: String,
    ty: VarType,
}

#[derive(Debug, Clone)]
enum Instr {
    Ld(String),
    Ldn(String),
    And(String),
    Andn(String),
    Or(String),
    St(String),
    Add(String),  // ADD の右辺（即値または変数）
    Gt(String),   // GT の右辺
    Cal(String),  // CAL のインスタンス名（例: CTU_1）
}

#[derive(Debug, Clone)]
struct IlProgram {
    vars: Vec<VarDecl>,
    instrs: Vec<Instr>,
}

struct Parser {
    tokens: Vec<Token>,
    pos: usize,
}

impl Parser {
    fn new(tokens: Vec<Token>) -> Self {
        Self { tokens, pos: 0 }
    }

    fn peek(&self) -> Option<&Token> {
        self.tokens.get(self.pos)
    }

    fn bump(&mut self) -> Option<Token> {
        if self.pos < self.tokens.len() {
            let t = self.tokens[self.pos].clone();
            self.pos += 1;
            Some(t)
        } else {
            None
        }
    }

    fn eat_newlines(&mut self) {
        while let Some(Token {
            kind: TokenKind::Newline,
            ..
        }) = self.peek()
        {
            self.pos += 1;
        }
    }

    fn parse_program(&mut self) -> Result<IlProgram, String> {
        let mut vars = Vec::new();
        let mut instrs = Vec::new();

        while let Some(tok) = self.peek() {
            match &tok.kind {
                TokenKind::Var => {
                    self.bump();
                    self.parse_var_line(&mut vars)?;
                }
                TokenKind::Ld
                | TokenKind::Ldn
                | TokenKind::And
                | TokenKind::Andn
                | TokenKind::Or
                | TokenKind::St
                | TokenKind::Add
                | TokenKind::Gt
                | TokenKind::Cal => {
                    let instr = self.parse_instr()?;
                    instrs.push(instr);
                }
                TokenKind::Newline => {
                    self.eat_newlines();
                }
                // 未対応命令やその他のトークンで始まる行は、とりあえず読み飛ばす
                _ => {
                    self.skip_line();
                }
            }
        }

        Ok(IlProgram { vars, instrs })
    }

    fn skip_line(&mut self) {
        while let Some(tok) = self.peek() {
            if matches!(tok.kind, TokenKind::Newline) {
                self.bump();
                break;
            }
            self.bump();
        }
    }

    fn parse_var_line(&mut self, out: &mut Vec<VarDecl>) -> Result<(), String> {
        // 形式: VAR INT#LimitOverCount / VAR BOOL#Start などを想定。
        // IDENT の中に `TYPE#Name` が入っている前提で、`#` で分割する。
        let tok = self
            .bump()
            .ok_or_else(|| "VAR 行で型/変数名トークンを期待しましたが入力が終わっています".to_string())?;

        let ident = match tok.kind {
            TokenKind::Ident(s) => s,
            _ => {
                // 未対応形式の VAR 行（例: VAR FUNCTION#...）はスキップ
                // 行末まで読み飛ばす
                while let Some(tok) = self.peek() {
                    if matches!(tok.kind, TokenKind::Newline) {
                        self.bump();
                        break;
                    }
                    self.bump();
                }
                return Ok(());
            }
        };

        let mut parts = ident.splitn(2, '#');
        let ty_str = parts.next().unwrap_or("").to_ascii_uppercase();
        let name_str = parts.next().unwrap_or("").to_string();

        let ty = match ty_str.as_str() {
            "BOOL" => VarType::Bool,
            "INT" => VarType::Int,
            "UINT" => VarType::Uint,
            // FUNCTION など未対応の型は宣言ごとスキップ
            _ => {
                while let Some(tok) = self.peek() {
                    if matches!(tok.kind, TokenKind::Newline) {
                        self.bump();
                        break;
                    }
                    self.bump();
                }
                return Ok(());
            }
        };

        if name_str.is_empty() {
            return Err("VAR 行の型の後に変数名がありません".to_string());
        }

        out.push(VarDecl {
            name: name_str,
            ty,
        });
        // 行末まで読み飛ばす
        while let Some(tok) = self.peek() {
            if matches!(tok.kind, TokenKind::Newline) {
                self.bump();
                break;
            }
            self.bump();
        }
        Ok(())
    }

    fn parse_instr(&mut self) -> Result<Instr, String> {
        let op_tok = self
            .bump()
            .ok_or_else(|| "命令を期待しましたが入力が終わっています".to_string())?;

        let op_pos = op_tok.pos;

        let op = match op_tok.kind {
            TokenKind::Ld => "LD",
            TokenKind::Ldn => "LDN",
            TokenKind::And => "AND",
            TokenKind::Andn => "ANDN",
            TokenKind::Or => "OR",
            TokenKind::St => "ST",
            TokenKind::Add => "ADD",
            TokenKind::Gt => "GT",
            TokenKind::Cal => "CAL",
            _ => {
                return Err(format!(
                    "命令として不正なトークン {:?} (位置 {})",
                    op_tok.kind, op_pos
                ));
            }
        };

        // オペランド（とりあえず識別子のみ）
        let operand_tok = self
            .bump()
            .ok_or_else(|| "命令オペランドを期待しましたが入力が終わっています".to_string())?;

        let name = match operand_tok.kind {
            TokenKind::Ident(s) => s,
            _ => {
                return Err("命令オペランドとして識別子を期待しました".to_string());
            }
        };

        // 行末まで読み飛ばす
        while let Some(tok) = self.peek() {
            if matches!(tok.kind, TokenKind::Newline) {
                self.bump();
                break;
            }
            self.bump();
        }

        Ok(match op {
            "LD" => Instr::Ld(name),
            "LDN" => Instr::Ldn(name),
            "AND" => Instr::And(name),
            "ANDN" => Instr::Andn(name),
            "OR" => Instr::Or(name),
            "ST" => Instr::St(name),
            "ADD" => Instr::Add(name),
            "GT" => Instr::Gt(name),
            "CAL" => Instr::Cal(name),
            _ => unreachable!(),
        })
    }
}

/// LLVM IR の識別子では # や . が使えないので、_ に置換する
fn sanitize_llvm_name(name: &str) -> String {
    name.replace('#', "_").replace('.', "_")
}

/// IL の即値かどうか判定し、整数ならその値を返す。例: INT#5 -> Some(5), UINT#100 -> Some(100)
fn parse_int_literal(operand: &str) -> Option<i64> {
    let s = operand.trim();
    let (prefix, rest) = s.split_once('#')?;
    let prefix = prefix.to_ascii_uppercase();
    if prefix != "INT" && prefix != "UINT" {
        return None;
    }
    rest.parse::<i64>().ok()
}

/// 即値（INT#5 など）なら true。変数として扱うべきでない。
fn is_int_literal(operand: &str) -> bool {
    parse_int_literal(operand).is_some()
}

/// TIME#1s など TIME 即値。返す値はミリ秒（1s → 1000）。
fn parse_time_literal(operand: &str) -> Option<u32> {
    let s = operand.trim();
    let (prefix, rest) = s.split_once('#')?;
    if prefix.to_ascii_uppercase() != "TIME" {
        return None;
    }
    let rest_upper = rest.to_ascii_uppercase();
    if rest_upper.ends_with("MS") {
        let n: u32 = rest_upper.trim_end_matches("MS").trim().parse().ok()?;
        return Some(n);
    }
    if rest_upper.ends_with('S') {
        let n: u32 = rest_upper.trim_end_matches('S').trim().parse().ok()?;
        return Some(n * 1000);
    }
    rest.parse::<u32>().ok()
}

fn is_time_literal(operand: &str) -> bool {
    parse_time_literal(operand).is_some()
}

/// LLVM IR を行ベースで溜めていくヘルパ
struct LlvmModule {
    lines: Vec<String>,
}

impl LlvmModule {
    fn new() -> Self {
        Self { lines: Vec::new() }
    }

    fn emit<S: Into<String>>(&mut self, s: S) {
        self.lines.push(s.into());
    }

    fn to_string(self) -> String {
        self.lines.join("\n")
    }
}

/// メンバ名から型を推測（.PV, .CV, .PT → Int/Time、.Q, .IN, .CU, .RESET → Bool）
fn infer_type_from_member(name: &str) -> VarType {
    if name.contains(".PV") || name.contains(".CV") {
        VarType::Int
    } else if name.contains(".PT") {
        VarType::Time
    } else {
        VarType::Bool
    }
}

/// 命令列から acc の型を追跡しつつ、未宣言変数の型を推論する
fn infer_var_types(prog: &IlProgram) -> HashMap<String, VarType> {
    let mut var_types: HashMap<String, VarType> =
        prog.vars.iter().map(|v| (v.name.clone(), v.ty)).collect();
    let mut acc_type: Option<VarType> = None;
    let instrs = &prog.instrs;

    for (i, instr) in instrs.iter().enumerate() {
        let next = instrs.get(i + 1);
        match instr {
            Instr::Ld(name) | Instr::Ldn(name) => {
                if is_int_literal(name) || is_time_literal(name) {
                    acc_type = Some(VarType::Int);
                    continue;
                }
                if let Some(ty) = var_types.get(name) {
                    acc_type = Some(*ty);
                    continue;
                }
                // 未登録の変数: 次の命令で型を推測
                let ty = match next {
                    Some(Instr::Add(_)) | Some(Instr::Gt(_)) => VarType::Int,
                    Some(Instr::And(_)) | Some(Instr::Or(_)) | Some(Instr::Ldn(_)) => VarType::Bool,
                    _ => infer_type_from_member(name),
                };
                var_types.insert(name.clone(), ty);
                acc_type = Some(ty);
            }
            Instr::Add(_) => {
                acc_type = Some(VarType::Int);
            }
            Instr::Gt(_) => {
                acc_type = Some(VarType::Bool);
            }
            Instr::And(_) | Instr::Andn(_) | Instr::Or(_) => {
                acc_type = Some(VarType::Bool);
            }
            Instr::St(name) => {
                if let Some(aty) = acc_type {
                    var_types.insert(name.clone(), aty);
                }
            }
            Instr::Cal(_) => {}
        }
    }

    // ADD/GT のオペランド（変数）は Int
    for instr in instrs {
        let name = match instr {
            Instr::Add(n) | Instr::Gt(n) => n,
            _ => continue,
        };
        if !is_int_literal(name) && !is_time_literal(name) {
            var_types.entry(name.clone()).or_insert(VarType::Int);
        }
    }

    var_types
}

/// ごく簡単な IL (BOOL 論理ネットワーク) を LLVM IR に変換
fn compile_il_to_llvm_ir(prog: &IlProgram) -> Result<String, String> {
    let var_types = infer_var_types(prog);

    // 即値以外の名前を変数リストに（型は推論結果またはメンバから）
    let mut vars: Vec<VarDecl> = prog.vars.clone();
    let mut declared: HashMap<String, VarType> = vars.iter().map(|v| (v.name.clone(), v.ty)).collect();

    for instr in &prog.instrs {
        let name = match instr {
            Instr::Ld(n)
            | Instr::Ldn(n)
            | Instr::And(n)
            | Instr::Andn(n)
            | Instr::Or(n)
            | Instr::St(n)
            | Instr::Add(n)
            | Instr::Gt(n) => n,
            Instr::Cal(inst) => {
                if inst.starts_with("CTU") {
                    let prev_cu = format!("{}._prev_cu", inst);
                    if !declared.contains_key(&prev_cu) {
                        declared.insert(prev_cu.clone(), VarType::Bool);
                        vars.push(VarDecl {
                            name: prev_cu,
                            ty: VarType::Bool,
                        });
                    }
                }
                if inst.starts_with("TP") {
                    let elapsed = format!("{}._elapsed", inst);
                    let running = format!("{}._running", inst);
                    for (name, ty) in [(&elapsed, VarType::Int), (&running, VarType::Bool)] {
                        if !declared.contains_key(name) {
                            declared.insert(name.clone(), ty);
                            vars.push(VarDecl {
                                name: name.clone(),
                                ty,
                            });
                        }
                    }
                }
                continue;
            }
        };
        if is_int_literal(name) || is_time_literal(name) {
            continue;
        }
        if !declared.contains_key(name) {
            let ty = var_types
                .get(name)
                .copied()
                .unwrap_or_else(|| infer_type_from_member(name));
            declared.insert(name.clone(), ty);
            vars.push(VarDecl {
                name: name.clone(),
                ty,
            });
        }
    }

    let mut m = LlvmModule::new();

    m.emit("; llil: IL -> LLVM IR (BOOL/INT/UINT/TIME, ADD/GT, CTU/TP)");
    emit_ctu_step(&mut m);
    emit_tp_step(&mut m);
    m.emit("define i32 @main() {");
    m.emit("entry:");

    // 変数ごとに alloca（IR 用に # . を _ にした名前を使用）
    // BOOL→i1, INT/UINT/TIME→i32
    for v in &vars {
        let ir_name = sanitize_llvm_name(&v.name);
        let ty_str = match v.ty {
            VarType::Bool => "i1",
            VarType::Int | VarType::Uint | VarType::Time => "i32",
        };
        m.emit(format!("  %ptr_{} = alloca {}", ir_name, ty_str));
        let init_val = match v.ty {
            VarType::Bool => "false".to_string(),
            VarType::Int | VarType::Uint | VarType::Time => "0".to_string(),
        };
        m.emit(format!(
            "  store {} {}, ptr %ptr_{}",
            ty_str, init_val, ir_name
        ));
    }

    // アキュムレータ（BOOL 用 / INT 用）
    m.emit("  %acc = alloca i1");
    m.emit("  store i1 false, ptr %acc");
    m.emit("  %int_acc = alloca i32");
    m.emit("  store i32 0, ptr %int_acc");

    // 命令列を順に解釈
    let mut tmp_idx: u32 = 1;
    let mut fresh_tmp = || -> String {
        let name = format!("%t{}", tmp_idx);
        tmp_idx += 1;
        name
    };

    for instr in &prog.instrs {
        match instr {
            Instr::Ld(name) | Instr::Ldn(name) => {
                // INT#5 / UINT#100 即値: int アキュムレータに格納
                if let Some(n) = parse_int_literal(name) {
                    m.emit(format!("  store i32 {}, ptr %int_acc", n));
                    continue;
                }
                // TIME#1s 即値: ミリ秒で int_acc に格納
                if let Some(ms) = parse_time_literal(name) {
                    m.emit(format!("  store i32 {}, ptr %int_acc", ms));
                    continue;
                }
                let ty = lookup_var(&vars, name)?;
                if matches!(ty, VarType::Int | VarType::Uint | VarType::Time) {
                    // LD <int/time変数>: int_acc にロード
                    let ir_name = sanitize_llvm_name(name);
                    let tmp = fresh_tmp();
                    m.emit(format!("  {tmp} = load i32, ptr %ptr_{ir_name}"));
                    m.emit(format!("  store i32 {tmp}, ptr %int_acc"));
                    continue;
                }
                // BOOL 変数
                let ir_name = sanitize_llvm_name(name);
                let tmp = fresh_tmp();
                m.emit(format!("  {tmp} = load i1, ptr %ptr_{ir_name}"));
                let val = match instr {
                    Instr::Ld(_) => tmp,
                    Instr::Ldn(_) => {
                        let not_tmp = fresh_tmp();
                        m.emit(format!("  {not_tmp} = xor i1 {tmp}, true"));
                        not_tmp
                    }
                    _ => unreachable!(),
                };
                m.emit(format!("  store i1 {val}, ptr %acc"));
            }
            Instr::And(name) | Instr::Andn(name) | Instr::Or(name) => {
                let ty = lookup_var(&vars, name)?;
                if !matches!(ty, VarType::Bool) {
                    return Err(format!(
                        "AND/ANDN/OR は BOOL 変数にしか対応していません: {}",
                        name
                    ));
                }
                let ir_name = sanitize_llvm_name(name);
                let cur = fresh_tmp();
                m.emit(format!("  {cur} = load i1, ptr %acc"));

                let src = fresh_tmp();
                m.emit(format!("  {src} = load i1, ptr %ptr_{ir_name}"));
                let rhs = match instr {
                    Instr::Andn(_) => {
                        let not_tmp = fresh_tmp();
                        m.emit(format!("  {not_tmp} = xor i1 {src}, true"));
                        not_tmp
                    }
                    _ => src.clone(),
                };

                let op = match instr {
                    Instr::And(_) | Instr::Andn(_) => "and",
                    Instr::Or(_) => "or",
                    _ => unreachable!(),
                };
                let res = fresh_tmp();
                m.emit(format!("  {res} = {op} i1 {cur}, {rhs}"));
                m.emit(format!("  store i1 {res}, ptr %acc"));
            }
            Instr::Add(rhs) => {
                // int_acc = int_acc + rhs（即値または変数）
                let lhs_tmp = fresh_tmp();
                m.emit(format!("  {lhs_tmp} = load i32, ptr %int_acc"));
                let rhs_val = if let Some(n) = parse_int_literal(rhs) {
                    format!("{}", n)
                } else if let Some(ms) = parse_time_literal(rhs) {
                    format!("{}", ms)
                } else {
                    let ir_name = sanitize_llvm_name(rhs);
                    let t = fresh_tmp();
                    m.emit(format!("  {t} = load i32, ptr %ptr_{ir_name}"));
                    t
                };
                let res = fresh_tmp();
                m.emit(format!("  {res} = add i32 {lhs_tmp}, {rhs_val}"));
                m.emit(format!("  store i32 {res}, ptr %int_acc"));
            }
            Instr::Gt(rhs) => {
                // bool_acc = (int_acc > rhs)。符号なし比較 ugt
                let lhs_tmp = fresh_tmp();
                m.emit(format!("  {lhs_tmp} = load i32, ptr %int_acc"));
                let rhs_val = if let Some(n) = parse_int_literal(rhs) {
                    format!("{}", n)
                } else if let Some(ms) = parse_time_literal(rhs) {
                    format!("{}", ms)
                } else {
                    let ir_name = sanitize_llvm_name(rhs);
                    let t = fresh_tmp();
                    m.emit(format!("  {t} = load i32, ptr %ptr_{ir_name}"));
                    t
                };
                let res = fresh_tmp();
                m.emit(format!("  {res} = icmp ugt i32 {lhs_tmp}, {rhs_val}"));
                m.emit(format!("  store i1 {res}, ptr %acc"));
            }
            Instr::Cal(inst_name) => {
                emit_fb_call(&mut m, inst_name, &vars)?;
            }
            Instr::St(name) => {
                let ty = lookup_var(&vars, name)?;
                let ir_name = sanitize_llvm_name(name);
                match ty {
                    VarType::Bool => {
                        let cur = fresh_tmp();
                        m.emit(format!("  {cur} = load i1, ptr %acc"));
                        m.emit(format!("  store i1 {cur}, ptr %ptr_{ir_name}"));
                    }
                    VarType::Int | VarType::Uint | VarType::Time => {
                        // int アキュムレータの値を格納
                        let cur = fresh_tmp();
                        m.emit(format!("  {cur} = load i32, ptr %int_acc"));
                        m.emit(format!("  store i32 {cur}, ptr %ptr_{ir_name}"));
                    }
                }
            }
        }
    }

    // いったん常に 0 を返す
    m.emit("  ret i32 0");
    m.emit("}");

    Ok(m.to_string())
}

/// CTU (Count Up) の 1 サイクル: CU の立ち上がりで CV をインクリメント、CV>=PV で Q=1。RESET で CV=0。
fn emit_ctu_step(m: &mut LlvmModule) {
    m.emit("define void @ctu_step(ptr %cu, ptr %reset, ptr %pv, ptr %q, ptr %cv, ptr %prev_cu) {");
    m.emit("entry:");
    m.emit("  %cu_val = load i1, ptr %cu");
    m.emit("  %reset_val = load i1, ptr %reset");
    m.emit("  %pv_val = load i32, ptr %pv");
    m.emit("  %cv_old = load i32, ptr %cv");
    m.emit("  %prev = load i1, ptr %prev_cu");
    m.emit("  ; if reset then cv_new = 0");
    m.emit("  %cv_after_reset = select i1 %reset_val, i32 0, i32 %cv_old");
    m.emit("  ; rising edge: cu and !prev");
    m.emit("  %prev_not = xor i1 %prev, true");
    m.emit("  %rise = and i1 %cu_val, %prev_not");
    m.emit("  %cv_inc = add i32 %cv_after_reset, 1");
    m.emit("  %cv_new = select i1 %rise, i32 %cv_inc, i32 %cv_after_reset");
    m.emit("  store i32 %cv_new, ptr %cv");
    m.emit("  store i1 %cu_val, ptr %prev_cu");
    m.emit("  ; Q = (CV >= PV)");
    m.emit("  %q_val = icmp sge i32 %cv_new, %pv_val");
    m.emit("  store i1 %q_val, ptr %q");
    m.emit("  ret void");
    m.emit("}");
}

/// TP (Pulse) の 1 サイクル: IN の立ち上がりで PT 間 Q=1。簡易実装で IN が true の間だけ経過カウント。
fn emit_tp_step(m: &mut LlvmModule) {
    m.emit("define void @tp_step(ptr %in, ptr %pt, ptr %q, ptr %elapsed, ptr %running) {");
    m.emit("entry:");
    m.emit("  %in_val = load i1, ptr %in");
    m.emit("  %pt_val = load i32, ptr %pt");
    m.emit("  %elapsed_val = load i32, ptr %elapsed");
    m.emit("  %running_val = load i1, ptr %running");
    m.emit("  ; running and in: elapsed++");
    m.emit("  %el_inc = add i32 %elapsed_val, 1");
    m.emit("  %el_new = select i1 %in_val, i32 %el_inc, i32 %elapsed_val");
    m.emit("  ; Q = (elapsed >= pt) while running");
    m.emit("  %done = icmp sge i32 %el_new, %pt_val");
    m.emit("  %q_val = and i1 %in_val, %done");
    m.emit("  store i32 %el_new, ptr %elapsed");
    m.emit("  store i1 %q_val, ptr %q");
    m.emit("  ; running = in (簡易: 毎周期 in が true ならカウント続行)");
    m.emit("  store i1 %in_val, ptr %running");
    m.emit("  ret void");
    m.emit("}");
}

fn ptr_for_var(vars: &[VarDecl], name: &str) -> Option<String> {
    vars.iter()
        .find(|v| v.name == name)
        .map(|v| format!("%ptr_{}", sanitize_llvm_name(&v.name)))
}

fn emit_fb_call(m: &mut LlvmModule, inst_name: &str, vars: &[VarDecl]) -> Result<(), String> {
    let base = inst_name;

    if base.starts_with("CTU") {
        let cu = format!("{}.CU", base);
        let reset = format!("{}.RESET", base);
        let pv = format!("{}.PV", base);
        let q = format!("{}.Q", base);
        let cv = format!("{}.CV", base);
        let prev_cu = format!("{}._prev_cu", base);

        let cu_ptr = ptr_for_var(vars, &cu).ok_or_else(|| format!("CTU 入力 {} が見つかりません", cu))?;
        let reset_ptr =
            ptr_for_var(vars, &reset).ok_or_else(|| format!("CTU 入力 {} が見つかりません", reset))?;
        let pv_ptr = ptr_for_var(vars, &pv).ok_or_else(|| format!("CTU 入力 {} が見つかりません", pv))?;
        let q_ptr = ptr_for_var(vars, &q).ok_or_else(|| format!("CTU 出力 {} が見つかりません", q))?;
        let cv_ptr = ptr_for_var(vars, &cv).ok_or_else(|| format!("CTU 出力 {} が見つかりません", cv))?;
        let prev_cu_ptr =
            ptr_for_var(vars, &prev_cu).ok_or_else(|| format!("CTU 内部 {} が見つかりません", prev_cu))?;

        m.emit(format!(
            "  call void @ctu_step(ptr {}, ptr {}, ptr {}, ptr {}, ptr {}, ptr {})",
            cu_ptr, reset_ptr, pv_ptr, q_ptr, cv_ptr, prev_cu_ptr
        ));
        return Ok(());
    }

    if base.starts_with("TP") {
        let in_ = format!("{}.IN", base);
        let pt = format!("{}.PT", base);
        let q = format!("{}.Q", base);
        let elapsed = format!("{}._elapsed", base);
        let running = format!("{}._running", base);

        let in_ptr = ptr_for_var(vars, &in_).ok_or_else(|| format!("TP 入力 {} が見つかりません", in_))?;
        let pt_ptr = ptr_for_var(vars, &pt).ok_or_else(|| format!("TP 入力 {} が見つかりません", pt))?;
        let q_ptr = ptr_for_var(vars, &q).ok_or_else(|| format!("TP 出力 {} が見つかりません", q))?;
        let elapsed_ptr =
            ptr_for_var(vars, &elapsed).ok_or_else(|| format!("TP 内部 {} が見つかりません", elapsed))?;
        let running_ptr =
            ptr_for_var(vars, &running).ok_or_else(|| format!("TP 内部 {} が見つかりません", running))?;

        m.emit(format!(
            "  call void @tp_step(ptr {}, ptr {}, ptr {}, ptr {}, ptr {})",
            in_ptr, pt_ptr, q_ptr, elapsed_ptr, running_ptr
        ));
        return Ok(());
    }

    Err(format!("未対応の FB: {}", base))
}

fn lookup_var(vars: &[VarDecl], name: &str) -> Result<VarType, String> {
    for v in vars.iter().rev() {
        if v.name == name {
            return Ok(v.ty);
        }
    }
    Err(format!("未定義の変数 {}", name))
}

fn usage(program: &str) {
    eprintln!("使い方:");
    eprintln!("  {} <input.il>", program);
    eprintln!("  {} <input.il> -o <output.ll>", program);
    eprintln!();
    eprintln!("IL (簡易サブセット) を LLVM IR (.ll) に変換します。");
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let program = args.get(0).cloned().unwrap_or_else(|| "llil".into());
    if args.len() < 2 {
        usage(&program);
        std::process::exit(1);
    }

    let input_path = &args[1];
    // 日本語コメントなどで Shift-JIS 等になっていても読めるように、バイトとして読み込み
    // UTF-8 でない部分は loss y に置き換えて文字列化する。
    let input = match fs::read(input_path) {
        Ok(bytes) => String::from_utf8_lossy(&bytes).into_owned(),
        Err(e) => {
            eprintln!("入力ファイルを読み込めませんでした: {e}");
            std::process::exit(1);
        }
    };

    let tokens = match lex(&input) {
        Ok(t) => t,
        Err(e) => {
            eprintln!("字句解析エラー: {e}");
            std::process::exit(1);
        }
    };

    let mut parser = Parser::new(tokens);
    let prog = match parser.parse_program() {
        Ok(p) => p,
        Err(e) => {
            eprintln!("構文解析エラー: {e}");
            std::process::exit(1);
        }
    };

    let ir = match compile_il_to_llvm_ir(&prog) {
        Ok(ir) => ir,
        Err(e) => {
            eprintln!("コンパイルエラー: {e}");
            std::process::exit(1);
        }
    };

    // 出力先:
    //   llil input.il              -> stdout
    //   llil input.il -o output.ll -> output.ll
    let mut out_path: Option<String> = None;
    if args.len() == 4 && args[2] == "-o" {
        out_path = Some(args[3].clone());
    } else if args.len() > 2 {
        eprintln!("引数の形式が正しくありません。");
        usage(&program);
        std::process::exit(1);
    }

    if let Some(out_path) = out_path {
        if let Some(parent) = Path::new(out_path.as_str()).parent() {
            if !parent.as_os_str().is_empty() {
                if let Err(e) = fs::create_dir_all(parent) {
                    eprintln!("出力ディレクトリを作成できませんでした: {e}");
                    std::process::exit(1);
                }
            }
        }
        if let Err(e) = fs::write(out_path, ir) {
            eprintln!("出力ファイルに書き込めませんでした: {e}");
            std::process::exit(1);
        }
    } else {
        println!("{}", ir);
    }
}

