use std::collections::{HashMap, HashSet};
use std::env;
use std::fs;
use std::path::Path;

/// LLVM 生成時の変数メモリモデル（`--memory`。未指定時は Stack）。
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
enum MemoryKind {
    /// ローカル `alloca`（従来どおり）
    #[default]
    Stack,
    /// RTedge タグにマップ（未実装）
    Rtedge,
}

impl MemoryKind {
    fn parse_str(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "stack" => Ok(Self::Stack),
            "rtedge" => Ok(Self::Rtedge),
            _ => Err(format!(
                "--memory は stack または rtedge です（得られた値: {:?}）",
                s.trim()
            )),
        }
    }

    fn as_cli_label(self) -> &'static str {
        match self {
            MemoryKind::Stack => "stack",
            MemoryKind::Rtedge => "rtedge",
        }
    }
}

/// `args[1]` を入力パスとし、`args[2..]` から `-o` と `--memory` を解釈する。
fn parse_cli_args(args: &[String]) -> Result<(String, Option<String>, MemoryKind), String> {
    if args.len() < 2 {
        return Err("入力ファイルを指定してください".to_string());
    }
    let input_path = args[1].clone();
    let mut out_path: Option<String> = None;
    let mut memory = MemoryKind::default();
    let mut i = 2usize;
    while i < args.len() {
        let a = &args[i];
        if a == "-o" {
            let p = args
                .get(i + 1)
                .ok_or_else(|| "-o の後に出力ファイルパスが必要です".to_string())?;
            out_path = Some(p.clone());
            i += 2;
            continue;
        }
        if let Some(rest) = a.strip_prefix("--memory=") {
            memory = MemoryKind::parse_str(rest)?;
            i += 1;
            continue;
        }
        if a == "--memory" {
            let v = args
                .get(i + 1)
                .ok_or_else(|| "--memory の後に stack または rtedge が必要です".to_string())?;
            memory = MemoryKind::parse_str(v)?;
            i += 2;
            continue;
        }
        return Err(format!(
            "不明な引数: {}（想定: -o <path>, --memory=stack|rtedge）",
            a
        ));
    }
    Ok((input_path, out_path, memory))
}

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
    Stn,      // STN（否定ストア）
    Orn,      // ORN（否定 OR）
    Set,      // S（セット）
    Reset,    // R（リセット）
    Add,      // ADD
    Gt,       // GT
    Ge,       // GE
    Eq,       // EQ
    Sel,      // SEL cond a b dst（i32 選択）
    Cal,      // CAL
    Newline,  // 行区切り（; の代わり）
}

#[derive(Debug, Clone)]
struct Token {
    kind: TokenKind,
    pos: usize,
}

fn is_ident_start(c: char) -> bool {
    // IEC 識別子は非 ASCII（例: 日本語変数名）もあり得る。ASCII のみだと UTF-8 先頭バイトを
    // 1 バイトずつ `as char` して誤解釈するため、Unicode の字種で判定する。
    c == '_' || c.is_alphabetic()
}

fn is_ident_char(c: char) -> bool {
    // IL の型付き即値や VAR 宣言で使われる `INT#Xxx` 形式、
    // フィールドアクセス `CTU_1.CU` などを扱うため、`#` や `.` も含める
    c.is_alphanumeric() || c == '_' || c == '#' || c == '.'
}

/// ごく簡易な IL 用レキサ（入力は UTF-8。コメント・識別子に非 ASCII を許可）
fn lex(input: &str) -> Result<Vec<Token>, String> {
    let mut tokens = Vec::new();
    let idx: Vec<(usize, char)> = input.char_indices().collect();
    let mut i = 0;

    while i < idx.len() {
        let (pos, c) = idx[i];

        // コメント (* ... *) をスキップ（中身は UTF-8 安全に 1 文字ずつ進める）
        if c == '(' && i + 1 < idx.len() && idx[i + 1].1 == '*' {
            i += 2;
            while i + 1 < idx.len() {
                if idx[i].1 == '*' && idx[i + 1].1 == ')' {
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
                pos,
            });
            i += 1;
            continue;
        }
        if c.is_whitespace() {
            i += 1;
            continue;
        }

        // 数値（とりあえず 10 進のみ）
        if c.is_ascii_digit() {
            let start = pos;
            i += 1;
            while i < idx.len() && idx[i].1.is_ascii_digit() {
                i += 1;
            }
            let end = if i < idx.len() { idx[i].0 } else { input.len() };
            let s = &input[start..end];
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
            let start = pos;
            i += 1;
            while i < idx.len() && is_ident_char(idx[i].1) {
                i += 1;
            }
            let end = if i < idx.len() { idx[i].0 } else { input.len() };
            let ident = &input[start..end];
            let upper = ident.to_ascii_uppercase();
            let kind = match upper.as_str() {
                "VAR" => TokenKind::Var,
                "LD" => TokenKind::Ld,
                "LDN" => TokenKind::Ldn,
                "AND" => TokenKind::And,
                "ANDN" => TokenKind::Andn,
                "OR" => TokenKind::Or,
                "ST" => TokenKind::St,
                "STN" => TokenKind::Stn,
                "ORN" => TokenKind::Orn,
                "S" => TokenKind::Set,
                "R" => TokenKind::Reset,
                "ADD" => TokenKind::Add,
                "GT" => TokenKind::Gt,
                "GE" => TokenKind::Ge,
                "EQ" => TokenKind::Eq,
                "SEL" => TokenKind::Sel,
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

        return Err(format!("未知の文字 '{c}' (バイト位置 {pos})"));
    }

    Ok(tokens)
}

#[derive(Debug, Clone, Copy, PartialEq)]
enum VarType {
    Bool,
    Byte,  // 8 ビット（LLVM i8）。ビット指定子 .X0..X7
    Word,  // 16 ビット（LLVM i16）。ビット指定子 .X0..X15
    Int,
    Uint,
    Dword, // 32 ビット（LLVM i32）。ビット指定子 .X0..X31
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
    Orn(String), // ORN: acc | !op
    St(String),
    Stn(String), // STN: !acc をストア（BOOL / ビット）
    Set(String), // S: オペランドを TRUE（BOOL / ビット 1）
    Reset(String), // R: オペランドを FALSE（BOOL / ビット 0）
    Add(String),  // ADD の右辺（即値または変数）
    Gt(String),   // GT の右辺
    Ge(String),   // GE の右辺
    Eq(String),   // EQ の右辺（int_acc == rhs）
    Sel {
        cond: String,
        a: String,
        b: String,
        dst: String,
    },
    Cal(String),  // CAL のインスタンス名（例: CTU_1）
}

/// `VAR FUNCTION#TON#TON_1` のような FB インスタンス宣言（IL ソースに書く）。
#[derive(Debug, Clone)]
struct FbInstanceDecl {
    family: String,
    inst: String,
}

#[derive(Debug, Clone)]
struct IlProgram {
    vars: Vec<VarDecl>,
    instrs: Vec<Instr>,
    fb_instances: Vec<FbInstanceDecl>,
}

/// FUNCTION 宣言からピン＋内部変数を生成（rtedge のスカラータグ・il_mem と一致させる）。
fn expand_fb_instance_to_pins(fb: &FbInstanceDecl) -> Result<Vec<VarDecl>, String> {
    let fam = fb.family.to_ascii_uppercase();
    let i = &fb.inst;
    match fam.as_str() {
        "TON" | "TOF" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.PT"),
                ty: VarType::Time,
            },
            VarDecl {
                name: format!("{i}.ET"),
                ty: VarType::Time,
            },
            VarDecl {
                name: format!("{i}.Q"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}._IN_"),
                ty: VarType::Bool,
            },
        ]),
        "TP" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.PT"),
                ty: VarType::Time,
            },
            VarDecl {
                name: format!("{i}.ET"),
                ty: VarType::Time,
            },
            VarDecl {
                name: format!("{i}.Q"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}._IN_"),
                ty: VarType::Bool,
            },
        ]),
        "CTU" => Ok(vec![
            VarDecl {
                name: format!("{i}.CU"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.RESET"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.PV"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.Q"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.CV"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}._prev_cu"),
                ty: VarType::Bool,
            },
        ]),
        "ADD" | "SUB" | "MUL" | "DIV" | "MOD" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN1"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.IN2"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Int,
            },
        ]),
        "AND" | "OR" | "XOR" | "ANDN" | "ORN" | "XORN" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN1"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN2"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Bool,
            },
        ]),
        "EQ" | "NE" | "GT" | "GE" | "LT" | "LE" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN1"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.IN2"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Bool,
            },
        ]),
        "NOT" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Bool,
            },
        ]),
        "MOVE" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Int,
            },
        ]),
        "LN" | "LOG" | "EXP" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Bool,
            },
        ]),
        "EXPT" | "SHR" | "SHL" | "ROL" | "BIT_TEST" => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN1"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.IN2"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Int,
            },
        ]),
        "R_TRIG" | "F_TRIG" => Ok(vec![
            VarDecl {
                name: format!("{i}.CLK"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.Q"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}._prev_clk"),
                ty: VarType::Bool,
            },
        ]),
        /* 型変換 WORD_TO_* 等はプレフィックス一致で fb_member_byte_offset のみ展開。ピンは IL から推論。 */
        _ if family_is_type_conversion_en_llil(&fam) => Ok(vec![
            VarDecl {
                name: format!("{i}.EN"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.IN"),
                ty: VarType::Int,
            },
            VarDecl {
                name: format!("{i}.ENO"),
                ty: VarType::Bool,
            },
            VarDecl {
                name: format!("{i}.OUT"),
                ty: VarType::Int,
            },
        ]),
        /* 上記以外でレイアウト未登録のファミリは空（スカラータグのみ）。 */
        _ => Ok(vec![]),
    }
}

fn merge_fb_pins_into_program(prog: &IlProgram) -> Result<IlProgram, String> {
    use std::collections::HashSet;
    let mut vars = prog.vars.clone();
    let mut seen: HashSet<String> = vars.iter().map(|v| v.name.clone()).collect();
    for fb in &prog.fb_instances {
        for pin in expand_fb_instance_to_pins(fb)? {
            if seen.insert(pin.name.clone()) {
                vars.push(pin);
            }
        }
    }
    Ok(IlProgram {
        vars,
        instrs: prog.instrs.clone(),
        fb_instances: prog.fb_instances.clone(),
    })
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
        let mut fb_instances = Vec::new();
        let mut instrs = Vec::new();

        while let Some(tok) = self.peek() {
            match &tok.kind {
                TokenKind::Var => {
                    self.bump();
                    self.parse_var_line(&mut vars, &mut fb_instances)?;
                }
                TokenKind::Ld
                | TokenKind::Ldn
                | TokenKind::And
                | TokenKind::Andn
                | TokenKind::Or
                | TokenKind::Orn
                | TokenKind::St
                | TokenKind::Stn
                | TokenKind::Set
                | TokenKind::Reset
                | TokenKind::Add
                | TokenKind::Gt
                | TokenKind::Ge
                | TokenKind::Eq
                | TokenKind::Sel
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

        Ok(IlProgram {
            vars,
            instrs,
            fb_instances,
        })
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

    fn parse_var_line(
        &mut self,
        out: &mut Vec<VarDecl>,
        out_fb: &mut Vec<FbInstanceDecl>,
    ) -> Result<(), String> {
        // 形式: VAR INT#LimitOverCount / VAR BOOL#Start / VAR FUNCTION#TON#TON_1 など。
        let tok = self
            .bump()
            .ok_or_else(|| "VAR 行で型/変数名トークンを期待しましたが入力が終わっています".to_string())?;

        let ident = match tok.kind {
            TokenKind::Ident(s) => s,
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

        let sharp: Vec<&str> = ident.split('#').collect();
        if sharp.len() >= 3 && sharp[0].eq_ignore_ascii_case("FUNCTION") {
            let family = sharp[1].to_string();
            let inst = sharp[2..].join("#");
            if family.is_empty() || inst.is_empty() {
                return Err(format!(
                    "VAR FUNCTION の形式が不正です（FUNCTION#ファミリ#インスタンス名）: {}",
                    ident
                ));
            }
            out_fb.push(FbInstanceDecl { family, inst });
            while let Some(tok) = self.peek() {
                if matches!(tok.kind, TokenKind::Newline) {
                    self.bump();
                    break;
                }
                self.bump();
            }
            return Ok(());
        }

        let mut parts = ident.splitn(2, '#');
        let ty_str = parts.next().unwrap_or("").to_ascii_uppercase();
        let name_str = parts.next().unwrap_or("").to_string();

        let ty = match ty_str.as_str() {
            "BOOL" => VarType::Bool,
            "BYTE" => VarType::Byte,
            "WORD" => VarType::Word,
            "INT" => VarType::Int,
            "UINT" => VarType::Uint,
            "DWORD" => VarType::Dword,
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

        if matches!(op_tok.kind, TokenKind::Sel) {
            // SEL cond a b dst（同一行に 4 オペランド）
            let cond = self.parse_operand_ident()?;
            let a = self.parse_operand_ident()?;
            let b = self.parse_operand_ident()?;
            let dst = self.parse_operand_ident()?;
            self.skip_to_newline();
            return Ok(Instr::Sel { cond, a, b, dst });
        }

        let op = match op_tok.kind {
            TokenKind::Ld => "LD",
            TokenKind::Ldn => "LDN",
            TokenKind::And => "AND",
            TokenKind::Andn => "ANDN",
            TokenKind::Or => "OR",
            TokenKind::Orn => "ORN",
            TokenKind::St => "ST",
            TokenKind::Stn => "STN",
            TokenKind::Set => "S",
            TokenKind::Reset => "R",
            TokenKind::Add => "ADD",
            TokenKind::Gt => "GT",
            TokenKind::Ge => "GE",
            TokenKind::Eq => "EQ",
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
        self.skip_to_newline();

        Ok(match op {
            "LD" => Instr::Ld(name),
            "LDN" => Instr::Ldn(name),
            "AND" => Instr::And(name),
            "ANDN" => Instr::Andn(name),
            "OR" => Instr::Or(name),
            "ORN" => Instr::Orn(name),
            "ST" => Instr::St(name),
            "STN" => Instr::Stn(name),
            "S" => Instr::Set(name),
            "R" => Instr::Reset(name),
            "ADD" => Instr::Add(name),
            "GT" => Instr::Gt(name),
            "GE" => Instr::Ge(name),
            "EQ" => Instr::Eq(name),
            "CAL" => Instr::Cal(name),
            _ => unreachable!(),
        })
    }

    fn parse_operand_ident(&mut self) -> Result<String, String> {
        let t = self
            .bump()
            .ok_or_else(|| "SEL のオペランドを期待しましたが入力が終わっています".to_string())?;
        match t.kind {
            TokenKind::Ident(s) => Ok(s),
            _ => Err("SEL のオペランドは識別子（INT# 等）を期待しました".to_string()),
        }
    }

    fn skip_to_newline(&mut self) {
        while let Some(tok) = self.peek() {
            if matches!(tok.kind, TokenKind::Newline) {
                self.bump();
                break;
            }
            self.bump();
        }
    }
}

/// LLVM IR の未引用識別子は `[a-zA-Z_$][a-zA-Z0-9_$]*` のみ。`#` / `.` を `_` にし、
/// 非 ASCII（例: 日本語変数名）は `_u` + 16 進コードポイントにエスケープする。
fn sanitize_llvm_name(name: &str) -> String {
    let mut out = String::new();
    let s = name.replace('#', "_").replace('.', "_");
    for c in s.chars() {
        if c.is_ascii_alphanumeric() || c == '_' || c == '$' {
            out.push(c);
        } else {
            out.push('_');
            out.push('u');
            out.push_str(&format!("{:x}", c as u32));
        }
    }
    if out.is_empty() {
        return "_empty".to_string();
    }
    if out
        .chars()
        .next()
        .is_some_and(|c| c.is_ascii_digit())
    {
        out.insert(0, '_');
    }
    out
}

/// `名前.Xn` 形式（最後の `.` の直後が `X`/`x` + 10 進桁）。PLCP の Bitfield（`.X0`〜`.X63`）に合わせる。
/// `CTU_1.CU` のようなメンバは `.X` で始まらないため None。
fn parse_bit_suffix(name: &str) -> Option<(&str, u32)> {
    let dot = name.rfind('.')?;
    let rest = &name[dot + 1..];
    if rest.len() < 2 {
        return None;
    }
    let first = rest.as_bytes()[0] as char;
    if first != 'X' && first != 'x' {
        return None;
    }
    let num_str = &rest[1..];
    if num_str.is_empty() || !num_str.chars().all(|c| c.is_ascii_digit()) {
        return None;
    }
    let bit: u32 = num_str.parse().ok()?;
    let base = &name[..dot];
    if base.is_empty() {
        return None;
    }
    Some((base, bit))
}

fn operand_base(name: &str) -> &str {
    parse_bit_suffix(name)
        .map(|(b, _)| b)
        .unwrap_or(name)
}

fn max_bit_for_type(ty: VarType) -> u32 {
    match ty {
        VarType::Bool => 0,
        VarType::Byte => 7,
        VarType::Word => 15,
        VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => 31,
    }
}

fn validate_bit_index(ty: VarType, bit: u32, operand: &str) -> Result<(), String> {
    let max = max_bit_for_type(ty);
    if bit > max {
        return Err(format!(
            "ビット位置 {} は型の範囲外です（0..={}）: {}",
            bit, max, operand
        ));
    }
    Ok(())
}

/// ビット指定子 `.Xn` を付けられる整数型（BOOL 以外）
fn supports_bit_access(ty: VarType) -> bool {
    matches!(
        ty,
        VarType::Byte
            | VarType::Word
            | VarType::Int
            | VarType::Uint
            | VarType::Dword
            | VarType::Time
    )
}

fn llvm_elem_ty(ty: VarType) -> Option<&'static str> {
    match ty {
        VarType::Bool => None,
        VarType::Byte => Some("i8"),
        VarType::Word => Some("i16"),
        VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => Some("i32"),
    }
}

fn rtedge_instruction_spec(v: &VarDecl) -> Option<String> {
    let prefix = match v.ty {
        VarType::Bool => "BOOL",
        VarType::Byte => "BYTE",
        VarType::Word => "WORD",
        VarType::Int => "INT",
        VarType::Uint => "UINT",
        VarType::Dword => "DWORD",
        VarType::Time => "TIME",
    };
    Some(format!("{}#{}", prefix, v.name))
}

fn family_is_type_conversion_en_llil(family: &str) -> bool {
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

/// `plcp_rtedge` の `fb_layout::fb_member_offset` / `plcp_rtedge_fb_member_offset` と一致。
fn fb_member_byte_offset(family: &str, member: &str) -> Option<i32> {
    let fam = family.to_ascii_uppercase();
    let m = member;
    if family_is_type_conversion_en_llil(&fam) {
        return not_pin_byte_offset(m);
    }
    if fam.starts_with("R_TRIG") || fam.starts_with("F_TRIG") {
        return Some(match m {
            "CLK" => 0,
            "Q" => 1,
            "_prev_clk" | "_PREV_CLK" => 2,
            _ => return None,
        });
    }
    match fam.as_str() {
        "TON" | "TOF" | "TP" => Some(match m {
            "EN" => 0,
            "IN" => 1,
            "PT" => 4,
            "ET" => 8,
            "Q" => 12,
            "_IN_" => 13,
            "_STTIME_" => 16,
            _ => return None,
        }),
        "CTU" => Some(match m {
            "CU" => 0,
            "RESET" => 1,
            "PV" => 2,
            "Q" => 4,
            "CV" => 5,
            "_prev_cu" | "_CU_" => 7,
            _ => return None,
        }),
        "CTD" => Some(match m {
            "CD" => 0,
            "LOAD" => 1,
            "PV" => 2,
            "Q" => 4,
            "CV" => 5,
            "_prev_cd" | "_CD_" => 7,
            _ => return None,
        }),
        "CTUD" => Some(match m {
            "CU" => 0,
            "CD" => 1,
            "RESET" => 2,
            "LOAD" => 3,
            "PV" => 4,
            "QU" => 6,
            "QD" => 7,
            "CV" => 8,
            "_prev_cu" | "_CU_" => 10,
            "_prev_cd" | "_CD_" => 11,
            _ => return None,
        }),
        "ADD" | "SUB" | "MUL" | "DIV" | "MOD" => arith_pin_byte_offset(m),
        "AND" | "OR" | "XOR" | "ANDN" | "ORN" | "XORN" | "EQ" | "NE" | "GT" | "GE" | "LT" | "LE" => {
            arith_pin_byte_offset(m)
        }
        "NOT" | "MOVE" | "LN" | "LOG" | "EXP" => not_pin_byte_offset(m),
        "EXPT" | "SHR" | "SHL" | "ROL" | "BIT_TEST" => arith_pin_byte_offset(m),
        _ => None,
    }
}

fn arith_pin_byte_offset(m: &str) -> Option<i32> {
    Some(match m {
        "EN" => 0,
        "IN1" => 1,
        "IN2" => 5,
        "ENO" => 9,
        "OUT" => 10,
        _ => return None,
    })
}

fn not_pin_byte_offset(m: &str) -> Option<i32> {
    Some(match m {
        "EN" => 0,
        "IN" => 1,
        "ENO" => 5,
        "OUT" => 6,
        _ => return None,
    })
}

/// `VAR FUNCTION#…#inst` 由来の FB ピン（セグメント内オフセット）。EgTagCreateEx は出さない。
fn is_fb_segment_pin_name(name: &str, fb_instances: &[FbInstanceDecl]) -> bool {
    let Some((inst, member)) = name.rsplit_once('.') else {
        return false;
    };
    let Some(fb) = fb_instances.iter().find(|fb| fb.inst == inst) else {
        return false;
    };
    fb_member_byte_offset(&fb.family, member).is_some()
}

/// 変数 `ir`（サニタイズ済み名）の実データへのポインタ。
/// stack: `@il_mem_*`、rtedge: `load ptr, ptr @il_slot_*`（1 命令を生成して SSA を返す）。
fn emit_var_data_ptr(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    ir: &str,
) -> String {
    match memory {
        MemoryKind::Stack => format!("@il_mem_{ir}"),
        MemoryKind::Rtedge => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load ptr, ptr @il_slot_{ir}"));
            t
        }
    }
}

fn llvm_escape_c_bytes(s: &str) -> String {
    let mut out = String::new();
    for &b in s.as_bytes() {
        if b.is_ascii_graphic() && b != b'\\' && b != b'"' {
            out.push(b as char);
        } else {
            out.push('\\');
            out.push_str(&format!("{:02X}", b));
        }
    }
    out.push_str("\\00");
    out
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

/// TIME#1s など TIME 即値。返す値はミリ秒（1s → 1000、1m → 60000）。
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
    // 長い接尾辞を先に（MS は上で処理済み）
    if rest_upper.ends_with('D') {
        let n: u32 = rest_upper.trim_end_matches('D').trim().parse().ok()?;
        return Some(n.saturating_mul(86_400_000));
    }
    if rest_upper.ends_with('H') {
        let n: u32 = rest_upper.trim_end_matches('H').trim().parse().ok()?;
        return Some(n.saturating_mul(3_600_000));
    }
    if rest_upper.ends_with('M') {
        let n: u32 = rest_upper.trim_end_matches('M').trim().parse().ok()?;
        return Some(n.saturating_mul(60_000));
    }
    if rest_upper.ends_with('S') {
        let n: u32 = rest_upper.trim_end_matches('S').trim().parse().ok()?;
        return Some(n.saturating_mul(1000));
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

/// メンバ名から型を推測（.PV, .CV → Int、.PT / .ET → Time、.Q, .IN, .CU, .RESET → Bool）
fn infer_type_from_member(name: &str) -> VarType {
    if name.contains(".PV") || name.contains(".CV") {
        VarType::Int
    } else if name.contains(".PT") || name.contains(".ET") {
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
                if is_int_literal(name) {
                    acc_type = Some(VarType::Int);
                    continue;
                }
                if is_time_literal(name) {
                    acc_type = Some(VarType::Time);
                    continue;
                }
                if parse_bit_suffix(name).is_some() {
                    let base = operand_base(name).to_string();
                    var_types.entry(base).or_insert(VarType::Dword);
                    acc_type = Some(VarType::Bool);
                    continue;
                }
                if let Some(ty) = var_types.get(name) {
                    acc_type = Some(*ty);
                    continue;
                }
                // 未登録の変数: 次の命令で型を推測
                let ty = match next {
                    Some(Instr::Add(_)) | Some(Instr::Gt(_)) | Some(Instr::Ge(_)) | Some(Instr::Eq(_)) => {
                        VarType::Int
                    }
                    Some(Instr::And(_)) | Some(Instr::Or(_)) | Some(Instr::Ldn(_)) => VarType::Bool,
                    _ => infer_type_from_member(name),
                };
                var_types.insert(name.clone(), ty);
                acc_type = Some(ty);
            }
            Instr::Add(_) => {
                acc_type = Some(VarType::Int);
            }
            Instr::Gt(_) | Instr::Ge(_) | Instr::Eq(_) => {
                acc_type = Some(VarType::Bool);
            }
            Instr::And(_) | Instr::Andn(_) | Instr::Or(_) | Instr::Orn(_) => {
                acc_type = Some(VarType::Bool);
            }
            Instr::St(name) | Instr::Stn(name) => {
                if parse_bit_suffix(name).is_some() {
                    let base = operand_base(name).to_string();
                    var_types.entry(base).or_insert(VarType::Dword);
                    continue;
                }
                if let Some(aty) = acc_type {
                    // LD TIME# の直後は acc が Int と誤認されうるため、FB メンバ名で上書きする。
                    let ty = if name.contains(".PV") || name.contains(".CV") {
                        VarType::Int
                    } else if name.contains(".PT") || name.contains(".ET") {
                        VarType::Time
                    } else {
                        aty
                    };
                    var_types.insert(name.clone(), ty);
                }
            }
            Instr::Set(name) | Instr::Reset(name) => {
                if parse_bit_suffix(name).is_some() {
                    let base = operand_base(name).to_string();
                    var_types.entry(base).or_insert(VarType::Dword);
                } else {
                    var_types.entry(name.clone()).or_insert(VarType::Bool);
                }
            }
            Instr::Cal(_) => {}
            Instr::Sel { cond, a, b, dst } => {
                var_types.insert(cond.clone(), VarType::Bool);
                for n in [a, b, dst] {
                    if !is_int_literal(n) && !is_time_literal(n) {
                        var_types.entry(n.clone()).or_insert(VarType::Int);
                    }
                }
            }
        }
    }

    // ADD/GT/EQ のオペランド（変数）は Int
    for instr in instrs {
        let name = match instr {
            Instr::Add(n) | Instr::Gt(n) | Instr::Ge(n) | Instr::Eq(n) => n,
            _ => continue,
        };
        if !is_int_literal(name) && !is_time_literal(name) {
            var_types.entry(name.clone()).or_insert(VarType::Int);
        }
    }

    var_types
}

fn llvm_global_ty_and_init(v: &VarDecl) -> (&'static str, &'static str, &'static str) {
    match v.ty {
        VarType::Bool => ("i1", "false", "1"),
        VarType::Byte => ("i8", "0", "1"),
        VarType::Word => ("i16", "0", "2"),
        VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => ("i32", "0", "4"),
    }
}

/// 各 IL 変数に @il_mem_*（実体）と @il_slot_*（そのアドレスを保持する ptr）を用意する。
/// - **stack**: `@il_slot_* = global ptr @il_mem_*` でリンク時に固定（`*_slots_init` は出さない）。
/// - **rtedge**: スロットは `ptr null` のまま、`@{pou}_slots_init` でタグ等から埋める想定（当面は il_mem を仮で store）。
fn emit_global_slots(
    m: &mut LlvmModule,
    vars: &[VarDecl],
    fb_instances: &[FbInstanceDecl],
    pou_name: &str,
    memory: MemoryKind,
) {
    for v in vars {
        let ir = sanitize_llvm_name(&v.name);
        let (ty, init, align) = llvm_global_ty_and_init(v);
        m.emit(format!(
            "@il_mem_{ir} = global {ty} {init}, align {align}",
            ir = ir,
            ty = ty,
            init = init,
            align = align
        ));
        match memory {
            MemoryKind::Stack => {
                m.emit(format!(
                    "@il_slot_{ir} = global ptr @il_mem_{ir}, align 4",
                    ir = ir
                ));
            }
            MemoryKind::Rtedge => {
                m.emit(format!("@il_slot_{ir} = global ptr null, align 4", ir = ir));
            }
        }
    }

    if memory == MemoryKind::Rtedge {
        let mut fb_inst_z: HashSet<String> = HashSet::new();
        for v in vars {
            if is_fb_segment_pin_name(&v.name, fb_instances) {
                if let Some((inst, _)) = v.name.rsplit_once('.') {
                    fb_inst_z.insert(inst.to_string());
                }
            }
        }
        let mut fb_inst_sorted: Vec<String> = fb_inst_z.into_iter().collect();
        fb_inst_sorted.sort();

        for fb in fb_instances {
            let seg_spec = format!("FUNCTION#{}#{}", fb.family, fb.inst);
            let seg_ir = sanitize_llvm_name(&format!("fbseg_{}", fb.inst));
            let esc = llvm_escape_c_bytes(&seg_spec);
            let n = seg_spec.as_bytes().len() + 1;
            m.emit(format!(
                "@il_spec_{seg_ir} = private unnamed_addr constant [{n} x i8] c\"{esc}\"",
                seg_ir = seg_ir,
                n = n,
                esc = esc
            ));
        }
        for inst in &fb_inst_sorted {
            let inst_ir = sanitize_llvm_name(inst);
            let esc = llvm_escape_c_bytes(inst);
            let n = inst.as_bytes().len() + 1;
            m.emit(format!(
                "@il_fb_z_{inst_ir} = private unnamed_addr constant [{n} x i8] c\"{esc}\"",
                inst_ir = inst_ir,
                n = n,
                esc = esc
            ));
        }
        for v in vars {
            if is_fb_segment_pin_name(&v.name, fb_instances) {
                continue;
            }
            if let Some(spec) = rtedge_instruction_spec(v) {
                let ir = sanitize_llvm_name(&v.name);
                let esc = llvm_escape_c_bytes(&spec);
                let n = spec.as_bytes().len() + 1;
                m.emit(format!(
                    "@il_spec_{ir} = private unnamed_addr constant [{n} x i8] c\"{esc}\"",
                    ir = ir,
                    n = n,
                    esc = esc
                ));
            }
        }
        m.emit(format!("define void @{}_slots_init() {{", pou_name));
        m.emit("entry:");
        m.emit("  call void @il_rtedge_registry_clear()");
        m.emit("  ; rtedge: FUNCTION セグメント → FB ピンは Eg Entry+offset → il_slot（IlRtedge_BindTonPinSlot）→ スカラータグ");
        for fb in fb_instances {
            let seg_ir = sanitize_llvm_name(&format!("fbseg_{}", fb.inst));
            let seg_spec = format!("FUNCTION#{}#{}", fb.family, fb.inst);
            let n = seg_spec.as_bytes().len() + 1;
            m.emit(format!(
                "  %spec_{seg_ir} = getelementptr inbounds [{n} x i8], ptr @il_spec_{seg_ir}, i32 0, i32 0",
                seg_ir = seg_ir,
                n = n
            ));
            m.emit(format!(
                "  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_{seg_ir}, i8 0)",
                seg_ir = seg_ir
            ));
        }
        m.emit("  ; FB: PLCP Structure_CreateCatalog 相当 — EgTagGetProperty(inst,Entry)→pSegment + offset");
        for v in vars {
            if !is_fb_segment_pin_name(&v.name, fb_instances) {
                continue;
            }
            let Some((inst, member)) = v.name.rsplit_once('.') else {
                continue;
            };
            let Some(fb) = fb_instances.iter().find(|fb| fb.inst == inst) else {
                continue;
            };
            let Some(off) = fb_member_byte_offset(&fb.family, member) else {
                continue;
            };
            let ir = sanitize_llvm_name(&v.name);
            let inst_ir = sanitize_llvm_name(inst);
            let n = inst.as_bytes().len() + 1;
            m.emit(format!(
                "  %fbp_{ir} = getelementptr inbounds [{n} x i8], ptr @il_fb_z_{inst_ir}, i32 0, i32 0",
                ir = ir,
                n = n,
                inst_ir = inst_ir
            ));
            m.emit(format!(
                "  call void @IlRtedge_BindTonPinSlot(ptr @il_slot_{ir}, ptr %fbp_{ir}, i32 {off})",
                ir = ir,
                off = off
            ));
        }
        for v in vars {
            if is_fb_segment_pin_name(&v.name, fb_instances) {
                continue;
            }
            if rtedge_instruction_spec(v).is_some() {
                let ir = sanitize_llvm_name(&v.name);
                let n = rtedge_instruction_spec(v).unwrap().as_bytes().len() + 1;
                m.emit(format!(
                    "  %spec_{ir} = getelementptr inbounds [{n} x i8], ptr @il_spec_{ir}, i32 0, i32 0",
                    ir = ir,
                    n = n
                ));
                m.emit(format!(
                    "  call i8 @Rtedge_TagCreateByInstruction(ptr %spec_{ir}, i8 0)",
                    ir = ir
                ));
                m.emit(format!(
                    "  call void @il_rtedge_registry_record_binding(ptr %spec_{ir}, ptr @il_slot_{ir})",
                    ir = ir
                ));
            }
        }
        m.emit("  ; フォールバック: Entry バインド前は il_mem を指す（FB ピンは上で Entry+offset 済み）。");
        for v in vars {
            if is_fb_segment_pin_name(&v.name, fb_instances) {
                continue;
            }
            let ir = sanitize_llvm_name(&v.name);
            m.emit(format!(
                "  store ptr @il_mem_{ir}, ptr @il_slot_{ir}",
                ir = ir
            ));
        }
        m.emit("  ret void");
        m.emit("}");
    }
}

/// ごく簡単な IL (BOOL 論理ネットワーク) を LLVM IR に変換。
/// entry_name には POU 名（通常はファイル名のベース名）を渡す。
fn compile_il_to_llvm_ir(
    prog: &IlProgram,
    entry_name: &str,
    memory: MemoryKind,
) -> Result<String, String> {
    let prog_m = merge_fb_pins_into_program(prog)?;
    let var_types = infer_var_types(&prog_m);

    // 即値以外の名前を変数リストに（型は推論結果またはメンバから）
    let mut vars: Vec<VarDecl> = prog_m.vars.clone();
    let mut declared: HashMap<String, VarType> = vars.iter().map(|v| (v.name.clone(), v.ty)).collect();

    for instr in &prog_m.instrs {
        match instr {
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
                if inst.starts_with("TON") {
                    let prev_in = format!("{}._IN_", inst);
                    if !declared.contains_key(&prev_in) {
                        declared.insert(prev_in.clone(), VarType::Bool);
                        vars.push(VarDecl {
                            name: prev_in,
                            ty: VarType::Bool,
                        });
                    }
                }
                if inst.starts_with("R_TRIG") || inst.starts_with("F_TRIG") {
                    let prev = format!("{}._prev_clk", inst);
                    if !declared.contains_key(&prev) {
                        declared.insert(prev.clone(), VarType::Bool);
                        vars.push(VarDecl {
                            name: prev,
                            ty: VarType::Bool,
                        });
                    }
                }
            }
            Instr::Sel { cond, a, b, dst } => {
                let mut add_if_needed = |name: &str, default_ty: VarType| {
                    if is_int_literal(name) || is_time_literal(name) {
                        return;
                    }
                    if !declared.contains_key(name) {
                        let ty = var_types
                            .get(name)
                            .copied()
                            .unwrap_or(default_ty);
                        declared.insert(name.to_string(), ty);
                        vars.push(VarDecl {
                            name: name.to_string(),
                            ty,
                        });
                    }
                };
                add_if_needed(cond, VarType::Bool);
                add_if_needed(a, VarType::Int);
                add_if_needed(b, VarType::Int);
                add_if_needed(dst, VarType::Int);
            }
            Instr::Ld(n)
            | Instr::Ldn(n)
            | Instr::And(n)
            | Instr::Andn(n)
            | Instr::Or(n)
            | Instr::Orn(n)
            | Instr::St(n)
            | Instr::Stn(n)
            | Instr::Set(n)
            | Instr::Reset(n)
            | Instr::Add(n)
            | Instr::Gt(n)
            | Instr::Ge(n)
            | Instr::Eq(n) => {
                let name = n;
                if is_int_literal(name) || is_time_literal(name) {
                    continue;
                }
                let reg_key = if parse_bit_suffix(name).is_some() {
                    operand_base(name).to_string()
                } else {
                    name.clone()
                };
                if !declared.contains_key(&reg_key) {
                    let ty = var_types
                        .get(&reg_key)
                        .copied()
                        .unwrap_or_else(|| infer_type_from_member(name));
                    declared.insert(reg_key.clone(), ty);
                    vars.push(VarDecl {
                        name: reg_key,
                        ty,
                    });
                }
            }
        }
    }

    validate_bit_operands_in_program(&vars, &prog_m)?;

    let mut m = LlvmModule::new();

    m.emit(format!(
        "; llil: IL -> LLVM IR (LD/LDN/AND/ANDN/OR/ORN/ST/STN/S/R, ADD/GT/GE, CTU/TP/TON/R_TRIG/F_TRIG, .Xn) memory={}",
        memory.as_cli_label()
    ));
    // clang が出す .ll と llvm-link するため datalayout / triple を揃える
    m.emit("target datalayout = \"e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32\"");
    m.emit("target triple = \"i386-pc-windows-msvc\"");
    if memory == MemoryKind::Rtedge {
        m.emit("declare i8 @Rtedge_TagCreateByInstruction(ptr, i8)");
        m.emit("declare void @il_rtedge_registry_clear()");
        m.emit("declare void @il_rtedge_registry_record_binding(ptr, ptr)");
        m.emit("declare void @IlRtedge_BindTonPinSlot(ptr, ptr, i32)");
    }

    // POU 名（ファイル名ベース）を LLVM 用にサニタイズして関数名に使う。
    let pou_name = sanitize_llvm_name(entry_name);

    emit_global_slots(&mut m, &vars, &prog_m.fb_instances, &pou_name, memory);

    emit_ctu_step(&mut m);
    emit_tp_step(&mut m);
    emit_ton_step(&mut m);
    emit_r_trig_step(&mut m);
    emit_f_trig_step(&mut m);

    // 本体: POU 関数（例: define i32 @eqtest() { ... }）
    m.emit(format!("define i32 @{}() {{", pou_name));
    m.emit("entry:");

    // stack: @il_mem_* を直接参照。rtedge: 各アクセスで il_slot から実ポインタを load。

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

    for instr in &prog_m.instrs {
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
                if let Some((_, bit)) = parse_bit_suffix(name) {
                    let ty = lookup_var(&vars, name)?;
                    if !supports_bit_access(ty) {
                        return Err(format!(
                            "LD/LDN のビットオペランドは BYTE/WORD/INT/UINT/DWORD/TIME である必要があります: {}",
                            name
                        ));
                    }
                    validate_bit_index(ty, bit, name)?;
                    let ir_name = sanitize_llvm_name(operand_base(name));
                    let elt = llvm_elem_ty(ty).unwrap();
                    let v = fresh_tmp();
                    let dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                    m.emit(format!("  {v} = load {elt}, ptr {dptr}"));
                    let sh = fresh_tmp();
                    m.emit(format!("  {sh} = lshr {elt} {v}, {bit}"));
                    let b1 = fresh_tmp();
                    m.emit(format!("  {b1} = and {elt} {sh}, 1"));
                    let cmp = fresh_tmp();
                    m.emit(format!("  {cmp} = icmp ne {elt} {b1}, 0"));
                    let val = match instr {
                        Instr::Ld(_) => cmp,
                        Instr::Ldn(_) => {
                            let n = fresh_tmp();
                            m.emit(format!("  {n} = xor i1 {cmp}, true"));
                            n
                        }
                        _ => unreachable!(),
                    };
                    m.emit(format!("  store i1 {val}, ptr %acc"));
                    continue;
                }
                let ty = lookup_var(&vars, name)?;
                if matches!(
                    ty,
                    VarType::Byte
                        | VarType::Word
                        | VarType::Int
                        | VarType::Uint
                        | VarType::Dword
                        | VarType::Time
                ) {
                    // LD <整数/時間変数>: int_acc にロード（BYTE/WORD は zext）
                    let ir_name = sanitize_llvm_name(name);
                    let dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                    let tmp = fresh_tmp();
                    match ty {
                        VarType::Byte => {
                            m.emit(format!("  {tmp} = load i8, ptr {dptr}"));
                            let z = fresh_tmp();
                            m.emit(format!("  {z} = zext i8 {tmp} to i32"));
                            m.emit(format!("  store i32 {z}, ptr %int_acc"));
                        }
                        VarType::Word => {
                            m.emit(format!("  {tmp} = load i16, ptr {dptr}"));
                            let z = fresh_tmp();
                            m.emit(format!("  {z} = zext i16 {tmp} to i32"));
                            m.emit(format!("  store i32 {z}, ptr %int_acc"));
                        }
                        VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => {
                            m.emit(format!("  {tmp} = load i32, ptr {dptr}"));
                            m.emit(format!("  store i32 {tmp}, ptr %int_acc"));
                        }
                        _ => unreachable!(),
                    }
                    continue;
                }
                // BOOL 変数
                let ir_name = sanitize_llvm_name(name);
                let dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                let tmp = fresh_tmp();
                m.emit(format!("  {tmp} = load i1, ptr {dptr}"));
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
            Instr::And(name) | Instr::Andn(name) | Instr::Or(name) | Instr::Orn(name) => {
                let cur = fresh_tmp();
                m.emit(format!("  {cur} = load i1, ptr %acc"));

                let src = if let Some((_, bit)) = parse_bit_suffix(name) {
                    let ty = lookup_var(&vars, name)?;
                    if !supports_bit_access(ty) {
                        return Err(format!(
                            "AND/ANDN/OR のビットオペランドは BYTE/WORD/INT/UINT/DWORD/TIME である必要があります: {}",
                            name
                        ));
                    }
                    validate_bit_index(ty, bit, name)?;
                    let ir_name = sanitize_llvm_name(operand_base(name));
                    let elt = llvm_elem_ty(ty).unwrap();
                    let v = fresh_tmp();
                    let dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                    m.emit(format!("  {v} = load {elt}, ptr {dptr}"));
                    let sh = fresh_tmp();
                    m.emit(format!("  {sh} = lshr {elt} {v}, {bit}"));
                    let b1 = fresh_tmp();
                    m.emit(format!("  {b1} = and {elt} {sh}, 1"));
                    let icmp = fresh_tmp();
                    m.emit(format!("  {icmp} = icmp ne {elt} {b1}, 0"));
                    icmp
                } else {
                    let ty = lookup_var(&vars, name)?;
                    if !matches!(ty, VarType::Bool) {
                        return Err(format!(
                            "AND/ANDN/OR/ORN は BOOL 変数またはビット指定（.Xn）のみ対応: {}",
                            name
                        ));
                    }
                    let ir_name = sanitize_llvm_name(name);
                    let dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                    let s = fresh_tmp();
                    m.emit(format!("  {s} = load i1, ptr {dptr}"));
                    s
                };
                let rhs = match instr {
                    Instr::Andn(_) | Instr::Orn(_) => {
                        let not_tmp = fresh_tmp();
                        m.emit(format!("  {not_tmp} = xor i1 {src}, true"));
                        not_tmp
                    }
                    _ => src,
                };

                let op = match instr {
                    Instr::And(_) | Instr::Andn(_) => "and",
                    Instr::Or(_) | Instr::Orn(_) => "or",
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
                    emit_load_scalar_as_i32(&mut m, memory, &mut fresh_tmp, &vars, rhs)?
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
                    emit_load_scalar_as_i32(&mut m, memory, &mut fresh_tmp, &vars, rhs)?
                };
                let res = fresh_tmp();
                m.emit(format!("  {res} = icmp ugt i32 {lhs_tmp}, {rhs_val}"));
                m.emit(format!("  store i1 {res}, ptr %acc"));
            }
            Instr::Ge(rhs) => {
                // bool_acc = (int_acc >= rhs)。符号なし比較 uge
                let lhs_tmp = fresh_tmp();
                m.emit(format!("  {lhs_tmp} = load i32, ptr %int_acc"));
                let rhs_val = if let Some(n) = parse_int_literal(rhs) {
                    format!("{}", n)
                } else if let Some(ms) = parse_time_literal(rhs) {
                    format!("{}", ms)
                } else {
                    emit_load_scalar_as_i32(&mut m, memory, &mut fresh_tmp, &vars, rhs)?
                };
                let res = fresh_tmp();
                m.emit(format!("  {res} = icmp uge i32 {lhs_tmp}, {rhs_val}"));
                m.emit(format!("  store i1 {res}, ptr %acc"));
            }
            Instr::Eq(rhs) => {
                // bool_acc = (int_acc == rhs)
                let lhs_tmp = fresh_tmp();
                m.emit(format!("  {lhs_tmp} = load i32, ptr %int_acc"));
                let rhs_val = if let Some(n) = parse_int_literal(rhs) {
                    format!("{}", n)
                } else if let Some(ms) = parse_time_literal(rhs) {
                    format!("{}", ms)
                } else {
                    emit_load_scalar_as_i32(&mut m, memory, &mut fresh_tmp, &vars, rhs)?
                };
                let res = fresh_tmp();
                m.emit(format!("  {res} = icmp eq i32 {lhs_tmp}, {rhs_val}"));
                m.emit(format!("  store i1 {res}, ptr %acc"));
            }
            Instr::Sel { cond, a, b, dst } => {
                let cond_ty = lookup_var(&vars, cond)?;
                if !matches!(cond_ty, VarType::Bool) {
                    return Err(format!("SEL の第1オペランドは BOOL 変数である必要があります: {}", cond));
                }
                let cond_ir = sanitize_llvm_name(cond);
                let c_dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &cond_ir);
                let ctmp = fresh_tmp();
                m.emit(format!("  {ctmp} = load i1, ptr {c_dptr}"));

                let va = if let Some(n) = parse_int_literal(a) {
                    format!("{}", n)
                } else if let Some(ms) = parse_time_literal(a) {
                    format!("{}", ms)
                } else {
                    emit_load_scalar_as_i32(&mut m, memory, &mut fresh_tmp, &vars, a)?
                };
                let vb = if let Some(n) = parse_int_literal(b) {
                    format!("{}", n)
                } else if let Some(ms) = parse_time_literal(b) {
                    format!("{}", ms)
                } else {
                    emit_load_scalar_as_i32(&mut m, memory, &mut fresh_tmp, &vars, b)?
                };
                let r = fresh_tmp();
                m.emit(format!("  {r} = select i1 {ctmp}, i32 {va}, i32 {vb}"));
                let dst_ty = lookup_var(&vars, dst)?;
                if !matches!(
                    dst_ty,
                    VarType::Byte
                        | VarType::Word
                        | VarType::Int
                        | VarType::Uint
                        | VarType::Dword
                        | VarType::Time
                ) {
                    return Err(format!(
                        "SEL の出力先は BYTE/WORD/INT/UINT/DWORD/TIME 変数である必要があります: {}",
                        dst
                    ));
                }
                let dst_ir = sanitize_llvm_name(dst);
                let dst_dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &dst_ir);
                match dst_ty {
                    VarType::Byte => {
                        let tr = fresh_tmp();
                        m.emit(format!("  {tr} = trunc i32 {r} to i8"));
                        m.emit(format!("  store i8 {tr}, ptr {dst_dptr}"));
                    }
                    VarType::Word => {
                        let tr = fresh_tmp();
                        m.emit(format!("  {tr} = trunc i32 {r} to i16"));
                        m.emit(format!("  store i16 {tr}, ptr {dst_dptr}"));
                    }
                    VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => {
                        m.emit(format!("  store i32 {r}, ptr {dst_dptr}"));
                    }
                    VarType::Bool => unreachable!(),
                }
            }
            Instr::Cal(inst_name) => {
                emit_fb_call(&mut m, memory, &mut fresh_tmp, inst_name, &vars)?;
            }
            Instr::St(name) | Instr::Stn(name) => {
                let negate_acc = matches!(instr, Instr::Stn(_));
                let ty = lookup_var(&vars, name)?;
                if let Some((_, bit)) = parse_bit_suffix(name) {
                    if !supports_bit_access(ty) {
                        return Err(format!(
                            "ST/STN のビット先は BYTE/WORD/INT/UINT/DWORD/TIME である必要があります: {}",
                            name
                        ));
                    }
                    validate_bit_index(ty, bit, name)?;
                    let ir_base = sanitize_llvm_name(operand_base(name));
                    let base_dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_base);
                    let elt = llvm_elem_ty(ty).unwrap();
                    let cur = fresh_tmp();
                    m.emit(format!("  {cur} = load i1, ptr %acc"));
                    let cur = if negate_acc {
                        let n = fresh_tmp();
                        m.emit(format!("  {n} = xor i1 {cur}, true"));
                        n
                    } else {
                        cur
                    };
                    let old = fresh_tmp();
                    m.emit(format!("  {old} = load {elt}, ptr {base_dptr}"));
                    let one = fresh_tmp();
                    m.emit(format!("  {one} = shl {elt} 1, {bit}"));
                    let not_mask = fresh_tmp();
                    let all_ones = match elt {
                        "i8" => "255",
                        "i16" => "65535",
                        "i32" => "-1",
                        _ => unreachable!(),
                    };
                    m.emit(format!("  {not_mask} = xor {elt} {one}, {all_ones}"));
                    let cleared = fresh_tmp();
                    m.emit(format!("  {cleared} = and {elt} {old}, {not_mask}"));
                    let ext = fresh_tmp();
                    m.emit(format!("  {ext} = zext i1 {cur} to {elt}"));
                    let shl = fresh_tmp();
                    m.emit(format!("  {shl} = shl {elt} {ext}, {bit}"));
                    let newv = fresh_tmp();
                    m.emit(format!("  {newv} = or {elt} {cleared}, {shl}"));
                    m.emit(format!("  store {elt} {newv}, ptr {base_dptr}"));
                    continue;
                }
                let ir_name = sanitize_llvm_name(name);
                let name_dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                match ty {
                    VarType::Bool => {
                        let cur = fresh_tmp();
                        m.emit(format!("  {cur} = load i1, ptr %acc"));
                        let cur = if negate_acc {
                            let n = fresh_tmp();
                            m.emit(format!("  {n} = xor i1 {cur}, true"));
                            n
                        } else {
                            cur
                        };
                        m.emit(format!("  store i1 {cur}, ptr {name_dptr}"));
                    }
                    VarType::Byte | VarType::Word | VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => {
                        if negate_acc {
                            return Err(format!(
                                "STN は BOOL またはビット指定先のみ対応です: {}",
                                name
                            ));
                        }
                        match ty {
                            VarType::Byte => {
                                let cur = fresh_tmp();
                                m.emit(format!("  {cur} = load i32, ptr %int_acc"));
                                let tr = fresh_tmp();
                                m.emit(format!("  {tr} = trunc i32 {cur} to i8"));
                                m.emit(format!("  store i8 {tr}, ptr {name_dptr}"));
                            }
                            VarType::Word => {
                                let cur = fresh_tmp();
                                m.emit(format!("  {cur} = load i32, ptr %int_acc"));
                                let tr = fresh_tmp();
                                m.emit(format!("  {tr} = trunc i32 {cur} to i16"));
                                m.emit(format!("  store i16 {tr}, ptr {name_dptr}"));
                            }
                            VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => {
                                let cur = fresh_tmp();
                                m.emit(format!("  {cur} = load i32, ptr %int_acc"));
                                m.emit(format!("  store i32 {cur}, ptr {name_dptr}"));
                            }
                            _ => unreachable!(),
                        }
                    }
                }
            }
            Instr::Set(name) | Instr::Reset(name) => {
                let set_true = matches!(instr, Instr::Set(_));
                let ty = lookup_var(&vars, name)?;
                if let Some((_, bit)) = parse_bit_suffix(name) {
                    if !supports_bit_access(ty) {
                        return Err(format!(
                            "S/R のビット先は BYTE/WORD/INT/UINT/DWORD/TIME である必要があります: {}",
                            name
                        ));
                    }
                    validate_bit_index(ty, bit, name)?;
                    let ir_base = sanitize_llvm_name(operand_base(name));
                    let base_dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_base);
                    let elt = llvm_elem_ty(ty).unwrap();
                    let old = fresh_tmp();
                    m.emit(format!("  {old} = load {elt}, ptr {base_dptr}"));
                    let one = fresh_tmp();
                    m.emit(format!("  {one} = shl {elt} 1, {bit}"));
                    let not_mask = fresh_tmp();
                    let all_ones = match elt {
                        "i8" => "255",
                        "i16" => "65535",
                        "i32" => "-1",
                        _ => unreachable!(),
                    };
                    m.emit(format!("  {not_mask} = xor {elt} {one}, {all_ones}"));
                    let cleared = fresh_tmp();
                    m.emit(format!("  {cleared} = and {elt} {old}, {not_mask}"));
                    if set_true {
                        let ext = fresh_tmp();
                        m.emit(format!("  {ext} = zext i1 true to {elt}"));
                        let shl = fresh_tmp();
                        m.emit(format!("  {shl} = shl {elt} {ext}, {bit}"));
                        let newv = fresh_tmp();
                        m.emit(format!("  {newv} = or {elt} {cleared}, {shl}"));
                        m.emit(format!("  store {elt} {newv}, ptr {base_dptr}"));
                    } else {
                        m.emit(format!("  store {elt} {cleared}, ptr {base_dptr}"));
                    }
                    continue;
                }
                if !matches!(ty, VarType::Bool) {
                    return Err(format!("S/R のオペランドは BOOL またはビット指定である必要があります: {}", name));
                }
                let ir_name = sanitize_llvm_name(name);
                let name_dptr = emit_var_data_ptr(&mut m, memory, &mut fresh_tmp, &ir_name);
                let cur_acc = fresh_tmp();
                m.emit(format!("  {cur_acc} = load i1, ptr %acc"));
                let old_v = fresh_tmp();
                m.emit(format!("  {old_v} = load i1, ptr {name_dptr}"));
                let new_v = fresh_tmp();
                if set_true {
                    m.emit(format!(
                        "  {new_v} = select i1 {cur_acc}, i1 true, i1 {old_v}",
                        cur_acc = cur_acc,
                        old_v = old_v,
                        new_v = new_v
                    ));
                } else {
                    m.emit(format!(
                        "  {new_v} = select i1 {cur_acc}, i1 false, i1 {old_v}",
                        cur_acc = cur_acc,
                        old_v = old_v,
                        new_v = new_v
                    ));
                }
                m.emit(format!("  store i1 {new_v}, ptr {name_dptr}", new_v = new_v));
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

/// TON (On-delay): PLCPFB と同様に前周期 IN（`_IN_`）で立上りを検出。IN=false で ET/Q リセット。
/// 1 スキャン≒1ms の簡易モデル（TIME# のミリ秒を PT/ET に使用）。
fn emit_ton_step(m: &mut LlvmModule) {
    m.emit("define void @ton_step(ptr %in, ptr %pt, ptr %et, ptr %q, ptr %prev_in) {");
    m.emit("entry:");
    m.emit("  %iv = load i1, ptr %in");
    m.emit("  br i1 %iv, label %ton_in_on, label %ton_in_off");
    m.emit("");
    m.emit("ton_in_off:");
    m.emit("  store i32 0, ptr %et");
    m.emit("  store i1 false, ptr %q");
    m.emit("  store i1 false, ptr %prev_in");
    m.emit("  ret void");
    m.emit("");
    m.emit("ton_in_on:");
    m.emit("  %pv = load i1, ptr %prev_in");
    m.emit("  %pv_n = xor i1 %pv, true");
    m.emit("  %rise = and i1 %iv, %pv_n");
    m.emit("  br i1 %rise, label %ton_rise, label %ton_hold");
    m.emit("");
    m.emit("ton_rise:");
    m.emit("  store i32 0, ptr %et");
    m.emit("  store i1 false, ptr %q");
    m.emit("  store i1 true, ptr %prev_in");
    m.emit("  ret void");
    m.emit("");
    m.emit("ton_hold:");
    m.emit("  %pt_val = load i32, ptr %pt");
    m.emit("  %et_old = load i32, ptr %et");
    m.emit("  %et_inc = add i32 %et_old, 1");
    m.emit("  %below_pt = icmp slt i32 %et_inc, %pt_val");
    m.emit("  %et_new = select i1 %below_pt, i32 %et_inc, i32 %pt_val");
    m.emit("  store i32 %et_new, ptr %et");
    m.emit("  %q_val = icmp sge i32 %et_new, %pt_val");
    m.emit("  store i1 %q_val, ptr %q");
    m.emit("  store i1 true, ptr %prev_in");
    m.emit("  ret void");
    m.emit("}");
}

/// R_TRIG: CLK の立ち上がり 1 スキャンのみ Q=true。内部 `_prev_clk` で前回 CLK を保持。
fn emit_r_trig_step(m: &mut LlvmModule) {
    m.emit("define void @r_trig_step(ptr %clk, ptr %q, ptr %prev_clk) {");
    m.emit("entry:");
    m.emit("  %clk_v = load i1, ptr %clk");
    m.emit("  %prev_v = load i1, ptr %prev_clk");
    m.emit("  %prev_not = xor i1 %prev_v, true");
    m.emit("  %rise = and i1 %clk_v, %prev_not");
    m.emit("  store i1 %rise, ptr %q");
    m.emit("  store i1 %clk_v, ptr %prev_clk");
    m.emit("  ret void");
    m.emit("}");
}

/// F_TRIG: CLK の立下り 1 スキャンのみ Q=true。
fn emit_f_trig_step(m: &mut LlvmModule) {
    m.emit("define void @f_trig_step(ptr %clk, ptr %q, ptr %prev_clk) {");
    m.emit("entry:");
    m.emit("  %clk_v = load i1, ptr %clk");
    m.emit("  %prev_v = load i1, ptr %prev_clk");
    m.emit("  %clk_not = xor i1 %clk_v, true");
    m.emit("  %fall = and i1 %clk_not, %prev_v");
    m.emit("  store i1 %fall, ptr %q");
    m.emit("  store i1 %clk_v, ptr %prev_clk");
    m.emit("  ret void");
    m.emit("}");
}

fn operand_for_global_var(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    vars: &[VarDecl],
    name: &str,
) -> Result<String, String> {
    if !vars.iter().any(|v| v.name == name) {
        return Err(format!("変数 {} が見つかりません", name));
    }
    let ir = sanitize_llvm_name(name);
    Ok(emit_var_data_ptr(m, memory, fresh_tmp, &ir))
}

fn fb_family_name(inst_name: &str) -> &str {
    if let Some((head, tail)) = inst_name.rsplit_once('_') {
        if !tail.is_empty() && tail.chars().all(|c| c.is_ascii_digit()) {
            return head;
        }
    }
    inst_name
}

fn find_instance_field(vars: &[VarDecl], inst: &str, field: &str) -> Option<String> {
    let exact = format!("{}.{}", inst, field);
    if vars.iter().any(|v| v.name == exact) {
        return Some(exact);
    }
    if field == "IN2" {
        let p = format!("{}.IN_2_", inst);
        if let Some(v) = vars.iter().find(|v| v.name.starts_with(&p)) {
            return Some(v.name.clone());
        }
    }
    let p = format!("{}.{}_", inst, field);
    vars.iter()
        .find(|v| v.name.starts_with(&p))
        .map(|v| v.name.clone())
}

fn emit_load_any_as_i32(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    vars: &[VarDecl],
    name: &str,
) -> Result<String, String> {
    let ty = lookup_var(vars, name)?;
    let ir = sanitize_llvm_name(name);
    let dptr = emit_var_data_ptr(m, memory, fresh_tmp, &ir);
    match ty {
        VarType::Bool => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load i1, ptr {dptr}"));
            let z = fresh_tmp();
            m.emit(format!("  {z} = zext i1 {t} to i32"));
            Ok(z)
        }
        _ => emit_load_scalar_as_i32(m, memory, fresh_tmp, vars, name),
    }
}

fn emit_load_any_as_bool(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    vars: &[VarDecl],
    name: &str,
) -> Result<String, String> {
    let ty = lookup_var(vars, name)?;
    let ir = sanitize_llvm_name(name);
    let dptr = emit_var_data_ptr(m, memory, fresh_tmp, &ir);
    match ty {
        VarType::Bool => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load i1, ptr {dptr}"));
            Ok(t)
        }
        _ => {
            let v = emit_load_scalar_as_i32(m, memory, fresh_tmp, vars, name)?;
            let c = fresh_tmp();
            m.emit(format!("  {c} = icmp ne i32 {v}, 0"));
            Ok(c)
        }
    }
}

fn emit_store_i32_to_var(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    vars: &[VarDecl],
    name: &str,
    val_i32: &str,
) -> Result<(), String> {
    let ty = lookup_var(vars, name)?;
    let ir = sanitize_llvm_name(name);
    let dptr = emit_var_data_ptr(m, memory, fresh_tmp, &ir);
    match ty {
        VarType::Bool => {
            let c = fresh_tmp();
            m.emit(format!("  {c} = icmp ne i32 {val_i32}, 0"));
            m.emit(format!("  store i1 {c}, ptr {dptr}"));
        }
        VarType::Byte => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = trunc i32 {val_i32} to i8"));
            m.emit(format!("  store i8 {t}, ptr {dptr}"));
        }
        VarType::Word => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = trunc i32 {val_i32} to i16"));
            m.emit(format!("  store i16 {t}, ptr {dptr}"));
        }
        VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => {
            m.emit(format!("  store i32 {val_i32}, ptr {dptr}"));
        }
    }
    Ok(())
}

fn emit_store_bool_to_var(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    vars: &[VarDecl],
    name: &str,
    val_i1: &str,
) -> Result<(), String> {
    let ty = lookup_var(vars, name)?;
    let ir = sanitize_llvm_name(name);
    let dptr = emit_var_data_ptr(m, memory, fresh_tmp, &ir);
    match ty {
        VarType::Bool => m.emit(format!("  store i1 {val_i1}, ptr {dptr}")),
        _ => {
            let z = fresh_tmp();
            m.emit(format!("  {z} = zext i1 {val_i1} to i32"));
            emit_store_i32_to_var(m, memory, fresh_tmp, vars, name, &z)?;
        }
    }
    Ok(())
}

fn emit_fb_call(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    inst_name: &str,
    vars: &[VarDecl],
) -> Result<(), String> {
    let base = inst_name;

    if base.starts_with("CTU") {
        let cu = format!("{}.CU", base);
        let reset = format!("{}.RESET", base);
        let pv = format!("{}.PV", base);
        let q = format!("{}.Q", base);
        let cv = format!("{}.CV", base);
        let prev_cu = format!("{}._prev_cu", base);

        let cu_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &cu).map_err(|_| {
                format!("CTU 入力 {} が見つかりません", cu)
            })?;
        let reset_ptr = operand_for_global_var(m, memory, fresh_tmp, vars, &reset).map_err(|_| {
            format!("CTU 入力 {} が見つかりません", reset)
        })?;
        let pv_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &pv).map_err(|_| {
                format!("CTU 入力 {} が見つかりません", pv)
            })?;
        let q_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &q).map_err(|_| {
                format!("CTU 出力 {} が見つかりません", q)
            })?;
        let cv_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &cv).map_err(|_| {
                format!("CTU 出力 {} が見つかりません", cv)
            })?;
        let prev_cu_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &prev_cu).map_err(|_| {
                format!("CTU 内部 {} が見つかりません", prev_cu)
            })?;

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

        let in_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &in_).map_err(|_| {
                format!("TP 入力 {} が見つかりません", in_)
            })?;
        let pt_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &pt).map_err(|_| {
                format!("TP 入力 {} が見つかりません", pt)
            })?;
        let q_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &q).map_err(|_| {
                format!("TP 出力 {} が見つかりません", q)
            })?;
        let elapsed_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &elapsed).map_err(|_| {
                format!("TP 内部 {} が見つかりません", elapsed)
            })?;
        let running_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &running).map_err(|_| {
                format!("TP 内部 {} が見つかりません", running)
            })?;

        m.emit(format!(
            "  call void @tp_step(ptr {}, ptr {}, ptr {}, ptr {}, ptr {})",
            in_ptr, pt_ptr, q_ptr, elapsed_ptr, running_ptr
        ));
        return Ok(());
    }

    if base.starts_with("TON") {
        let in_ = format!("{}.IN", base);
        let pt = format!("{}.PT", base);
        let et = format!("{}.ET", base);
        let q = format!("{}.Q", base);
        let prev_in = format!("{}._IN_", base);

        let in_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &in_).map_err(|_| {
                format!("TON 入力 {} が見つかりません", in_)
            })?;
        let pt_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &pt).map_err(|_| {
                format!("TON 入力 {} が見つかりません", pt)
            })?;
        let et_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &et).map_err(|_| {
                format!("TON 入出力 {} が見つかりません", et)
            })?;
        let q_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &q).map_err(|_| {
                format!("TON 出力 {} が見つかりません", q)
            })?;
        let prev_ptr =
            operand_for_global_var(m, memory, fresh_tmp, vars, &prev_in).map_err(|_| {
                format!("TON 内部 {} が見つかりません", prev_in)
            })?;

        m.emit(format!(
            "  call void @ton_step(ptr {}, ptr {}, ptr {}, ptr {}, ptr {})",
            in_ptr, pt_ptr, et_ptr, q_ptr, prev_ptr
        ));
        return Ok(());
    }

    if base.starts_with("R_TRIG") {
        let clk = format!("{}.CLK", base);
        let q = format!("{}.Q", base);
        let prev = format!("{}._prev_clk", base);
        let Ok(clk_ptr) = operand_for_global_var(m, memory, fresh_tmp, vars, &clk) else {
            return Ok(());
        };
        let Ok(q_ptr) = operand_for_global_var(m, memory, fresh_tmp, vars, &q) else {
            return Ok(());
        };
        let Ok(prev_ptr) = operand_for_global_var(m, memory, fresh_tmp, vars, &prev) else {
            return Ok(());
        };
        m.emit(format!(
            "  call void @r_trig_step(ptr {}, ptr {}, ptr {})",
            clk_ptr, q_ptr, prev_ptr
        ));
        return Ok(());
    }

    if base.starts_with("F_TRIG") {
        let clk = format!("{}.CLK", base);
        let q = format!("{}.Q", base);
        let prev = format!("{}._prev_clk", base);
        let Ok(clk_ptr) = operand_for_global_var(m, memory, fresh_tmp, vars, &clk) else {
            return Ok(());
        };
        let Ok(q_ptr) = operand_for_global_var(m, memory, fresh_tmp, vars, &q) else {
            return Ok(());
        };
        let Ok(prev_ptr) = operand_for_global_var(m, memory, fresh_tmp, vars, &prev) else {
            return Ok(());
        };
        m.emit(format!(
            "  call void @f_trig_step(ptr {}, ptr {}, ptr {})",
            clk_ptr, q_ptr, prev_ptr
        ));
        return Ok(());
    }

    // 汎用 FB 群（算術・比較・変換）
    let family = fb_family_name(base).to_ascii_uppercase();
    let in_name = find_instance_field(vars, base, "IN");
    let in1_name = find_instance_field(vars, base, "IN1");
    let in2_name = find_instance_field(vars, base, "IN2");
    let out_name = find_instance_field(vars, base, "OUT");

    if family == "MOVE"
        || family == "UDINT_TO_INT"
        || family == "WORD_TO_INT"
        || family == "WORD_TO_DINT"
        || family == "WORD_TO_SINT"
        || family == "WORD_TO_DWORD"
        || family == "DWORD_TO_WORD"
        || family == "DWORD_TO_INT"
        || family == "INT_TO_REAL"
        || family == "REAL_TO_INT"
        || family == "REAL_TO_DINT"
        || family == "REAL_TO_LREAL"
        || family == "LREAL_TO_REAL"
        || family == "DWORD_TO_REAL"
        || family == "EXP"
        || family == "LN"
    {
        let Some(in_var) = in_name else {
            return Ok(());
        };
        let Some(out_var) = out_name else {
            return Ok(());
        };
        let v = emit_load_any_as_i32(m, memory, fresh_tmp, vars, &in_var)?;
        emit_store_i32_to_var(m, memory, fresh_tmp, vars, &out_var, &v)?;
        return Ok(());
    }

    if ["ADD", "SUB", "MUL", "DIV", "MOD", "SHR", "ROL", "BIT_TEST"].contains(&family.as_str()) {
        let Some(a_name) = in1_name else {
            return Ok(());
        };
        let Some(b_name) = in2_name else {
            return Ok(());
        };
        let Some(out_var) = out_name else {
            return Ok(());
        };
        let a = emit_load_any_as_i32(m, memory, fresh_tmp, vars, &a_name)?;
        let b = emit_load_any_as_i32(m, memory, fresh_tmp, vars, &b_name)?;
        let r = fresh_tmp();
        match family.as_str() {
            "ADD" => m.emit(format!("  {r} = add i32 {a}, {b}")),
            "SUB" => m.emit(format!("  {r} = sub i32 {a}, {b}")),
            "MUL" => m.emit(format!("  {r} = mul i32 {a}, {b}")),
            "DIV" => {
                let z = fresh_tmp();
                m.emit(format!("  {z} = icmp eq i32 {b}, 0"));
                let tag = fresh_tmp().replace('%', "");
                let l_zero = format!("div_zero_{}", tag);
                let l_do = format!("div_do_{}", tag);
                let l_end = format!("div_end_{}", tag);
                m.emit(format!("  br i1 {z}, label %{l_zero}, label %{l_do}"));
                m.emit(format!("{l_do}:"));
                let d = fresh_tmp();
                m.emit(format!("  {d} = sdiv i32 {a}, {b}"));
                m.emit(format!("  br label %{l_end}"));
                m.emit(format!("{l_zero}:"));
                m.emit(format!("  br label %{l_end}"));
                m.emit(format!("{l_end}:"));
                m.emit(format!("  {r} = phi i32 [0, %{l_zero}], [{d}, %{l_do}]"));
            }
            "MOD" => {
                let z = fresh_tmp();
                m.emit(format!("  {z} = icmp eq i32 {b}, 0"));
                let tag = fresh_tmp().replace('%', "");
                let l_zero = format!("mod_zero_{}", tag);
                let l_do = format!("mod_do_{}", tag);
                let l_end = format!("mod_end_{}", tag);
                m.emit(format!("  br i1 {z}, label %{l_zero}, label %{l_do}"));
                m.emit(format!("{l_do}:"));
                let d = fresh_tmp();
                m.emit(format!("  {d} = srem i32 {a}, {b}"));
                m.emit(format!("  br label %{l_end}"));
                m.emit(format!("{l_zero}:"));
                m.emit(format!("  br label %{l_end}"));
                m.emit(format!("{l_end}:"));
                m.emit(format!("  {r} = phi i32 [0, %{l_zero}], [{d}, %{l_do}]"));
            }
            "SHR" => {
                let amt = fresh_tmp();
                m.emit(format!("  {amt} = and i32 {b}, 31"));
                m.emit(format!("  {r} = lshr i32 {a}, {amt}"));
            }
            "ROL" => {
                let amt = fresh_tmp();
                m.emit(format!("  {amt} = and i32 {b}, 31"));
                let inv = fresh_tmp();
                m.emit(format!("  {inv} = sub i32 32, {amt}"));
                let l = fresh_tmp();
                m.emit(format!("  {l} = shl i32 {a}, {amt}"));
                let rr = fresh_tmp();
                m.emit(format!("  {rr} = lshr i32 {a}, {inv}"));
                m.emit(format!("  {r} = or i32 {l}, {rr}"));
            }
            "BIT_TEST" => {
                let amt = fresh_tmp();
                m.emit(format!("  {amt} = and i32 {b}, 31"));
                let s = fresh_tmp();
                m.emit(format!("  {s} = lshr i32 {a}, {amt}"));
                m.emit(format!("  {r} = and i32 {s}, 1"));
            }
            _ => unreachable!(),
        }
        emit_store_i32_to_var(m, memory, fresh_tmp, vars, &out_var, &r)?;
        return Ok(());
    }

    if ["EQ", "NE", "GT", "GE", "LT", "LE"].contains(&family.as_str()) {
        let Some(a_name) = in1_name else {
            return Ok(());
        };
        let Some(b_name) = in2_name else {
            return Ok(());
        };
        let Some(out_var) = out_name else {
            return Ok(());
        };
        let a = emit_load_any_as_i32(m, memory, fresh_tmp, vars, &a_name)?;
        let b = emit_load_any_as_i32(m, memory, fresh_tmp, vars, &b_name)?;
        let c = fresh_tmp();
        let pred = match family.as_str() {
            "EQ" => "eq",
            "NE" => "ne",
            "GT" => "sgt",
            "GE" => "sge",
            "LT" => "slt",
            "LE" => "sle",
            _ => unreachable!(),
        };
        m.emit(format!("  {c} = icmp {pred} i32 {a}, {b}"));
        emit_store_bool_to_var(m, memory, fresh_tmp, vars, &out_var, &c)?;
        return Ok(());
    }

    if ["AND", "OR", "XOR"].contains(&family.as_str()) {
        let Some(a_name) = in1_name else {
            return Ok(());
        };
        let Some(b_name) = in2_name else {
            return Ok(());
        };
        let Some(out_var) = out_name else {
            return Ok(());
        };
        let a = emit_load_any_as_bool(m, memory, fresh_tmp, vars, &a_name)?;
        let b = emit_load_any_as_bool(m, memory, fresh_tmp, vars, &b_name)?;
        let r = fresh_tmp();
        let op = match family.as_str() {
            "AND" => "and",
            "OR" => "or",
            "XOR" => "xor",
            _ => unreachable!(),
        };
        m.emit(format!("  {r} = {op} i1 {a}, {b}"));
        emit_store_bool_to_var(m, memory, fresh_tmp, vars, &out_var, &r)?;
        return Ok(());
    }

    if family == "NOT" {
        let Some(in_var) = in_name else {
            return Ok(());
        };
        let Some(out_var) = out_name else {
            return Ok(());
        };
        let a = emit_load_any_as_bool(m, memory, fresh_tmp, vars, &in_var)?;
        let r = fresh_tmp();
        m.emit(format!("  {r} = xor i1 {a}, true"));
        emit_store_bool_to_var(m, memory, fresh_tmp, vars, &out_var, &r)?;
        return Ok(());
    }

    Err(format!("未対応の FB: {}", base))
}

fn lookup_var(vars: &[VarDecl], name: &str) -> Result<VarType, String> {
    let base = operand_base(name);
    for v in vars.iter().rev() {
        if v.name == base {
            return Ok(v.ty);
        }
    }
    Err(format!("未定義の変数 {}", base))
}

/// ADD/GT/GE/EQ/SEL のオペランドを int_acc 互換の i32 に読み込む。
fn emit_load_scalar_as_i32(
    m: &mut LlvmModule,
    memory: MemoryKind,
    fresh_tmp: &mut impl FnMut() -> String,
    vars: &[VarDecl],
    name: &str,
) -> Result<String, String> {
    let ty = lookup_var(vars, name)?;
    let ir = sanitize_llvm_name(name);
    let dptr = emit_var_data_ptr(m, memory, fresh_tmp, &ir);
    match ty {
        VarType::Bool => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load i1, ptr {dptr}"));
            let z = fresh_tmp();
            m.emit(format!("  {z} = zext i1 {t} to i32"));
            Ok(z)
        }
        VarType::Byte => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load i8, ptr {dptr}"));
            let z = fresh_tmp();
            m.emit(format!("  {z} = zext i8 {t} to i32"));
            Ok(z)
        }
        VarType::Word => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load i16, ptr {dptr}"));
            let z = fresh_tmp();
            m.emit(format!("  {z} = zext i16 {t} to i32"));
            Ok(z)
        }
        VarType::Int | VarType::Uint | VarType::Dword | VarType::Time => {
            let t = fresh_tmp();
            m.emit(format!("  {t} = load i32, ptr {dptr}"));
            Ok(t)
        }
    }
}

/// ビット指定子の範囲と、ADD/GT 等にビットが付かないことを検証する。
fn validate_bit_operands_in_program(vars: &[VarDecl], prog: &IlProgram) -> Result<(), String> {
    for instr in &prog.instrs {
        match instr {
            Instr::Ld(n)
            | Instr::Ldn(n)
            | Instr::And(n)
            | Instr::Andn(n)
            | Instr::Or(n)
            | Instr::Orn(n)
            | Instr::St(n)
            | Instr::Stn(n)
            | Instr::Set(n)
            | Instr::Reset(n) => {
                if is_int_literal(n) || is_time_literal(n) {
                    continue;
                }
                if let Some((_, bit)) = parse_bit_suffix(n) {
                    let ty = lookup_var(vars, n)?;
                    if !supports_bit_access(ty) {
                        return Err(format!(
                            "ビット指定子は BYTE/WORD/INT/UINT/DWORD/TIME の変数にのみ使えます: {}",
                            n
                        ));
                    }
                    validate_bit_index(ty, bit, n)?;
                }
            }
            Instr::Add(n) | Instr::Gt(n) | Instr::Ge(n) | Instr::Eq(n) => {
                if parse_bit_suffix(n).is_some() {
                    return Err(format!(
                        "この命令はビット指定オペランドを受け付けません: {}",
                        n
                    ));
                }
            }
            Instr::Sel { cond, a, b, dst } => {
                for op in [cond.as_str(), a.as_str(), b.as_str(), dst.as_str()] {
                    if parse_bit_suffix(op).is_some() {
                        return Err(format!(
                            "SEL はビット指定オペランドを受け付けません: {}",
                            op
                        ));
                    }
                }
            }
            Instr::Cal(_) => {}
        }
    }
    Ok(())
}

fn usage(program: &str) {
    eprintln!("使い方:");
    eprintln!("  {} <input.il>", program);
    eprintln!(
        "  {} <input.il> [-o <output.ll>] [--memory=stack|rtedge]",
        program
    );
    eprintln!();
    eprintln!("IL (簡易サブセット) を LLVM IR (.ll) に変換します。");
    eprintln!("--memory は省略時 stack（スロットはグローバル初期化で il_mem を指す）。");
    eprintln!("--memory=rtedge: <POU>_slots_init でタグ生成とレジストリ登録。Eg 実行後は IlRtedgeRegistry_BindAllSlots で il_slot を Entry に接続。");
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let program = args.get(0).cloned().unwrap_or_else(|| "llil".into());
    let (input_path, out_path, memory) = match parse_cli_args(&args) {
        Ok(x) => x,
        Err(e) => {
            eprintln!("{e}");
            usage(&program);
            std::process::exit(1);
        }
    };
    // 日本語コメントなどで Shift-JIS 等になっていても読めるように、バイトとして読み込み
    // UTF-8 でない部分は loss y に置き換えて文字列化する。
    let input = match fs::read(&input_path) {
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

    // POU 名として入力ファイルのベース名を使う（拡張子を除いた部分）。
    let entry_name = Path::new(&input_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("il_pou");

    let ir = match compile_il_to_llvm_ir(&prog, entry_name, memory) {
        Ok(ir) => ir,
        Err(e) => {
            eprintln!("コンパイルエラー: {e}");
            std::process::exit(1);
        }
    };

    // 出力先:
    //   llil input.il              -> stdout
    //   llil input.il -o output.ll -> output.ll
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

