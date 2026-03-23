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

#[derive(Debug, Clone, PartialEq)]
enum TokenKind {
    Ident(String),
    Int(i64),
    Colon,
    Semicolon,
    Assign,      // :=
    Var,         // VAR
    EndVar,      // END_VAR
    VarInput,    // VAR_INPUT
    Program,     // PROGRAM (予約のみ、今は未使用)
    EndProgram,  // END_PROGRAM (予約のみ、今は未使用)
    Function,    // FUNCTION
    EndFunction, // END_FUNCTION
    Return,      // RETURN
    Xor,         // XOR
    And,         // AND
    Or,          // OR
    Plus,
    Minus,
    Star,
    Slash,
    LParen,
    RParen,
    LBracket, // [
    RBracket, // ]
    DotDot,   // ..
    Comma,    // ,
    TypeInt,   // INT
    TypeByte,  // BYTE（.X0..X7）
    TypeWord,  // WORD（.X0..X15）
    TypeDword, // DWORD（.X0..X31）
    TypeBool, // BOOL
    Array,    // ARRAY
    Of,       // OF
    Not,      // NOT
    For,      // FOR
    To,       // TO
    Do,       // DO
    EndFor,   // END_FOR
    Mod,      // MOD
    Lt,       // <
    Le,       // <=
    Gt,       // >
    Ge,       // >=
    Eq,       // = （比較。:= は Assign）
    Ne,       // <>
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
    c.is_ascii_alphanumeric() || c == '_'
}

fn lex(input: &str) -> Result<Vec<Token>, String> {
    let mut tokens = Vec::new();
    let mut i = 0;
    let bytes = input.as_bytes();

    while i < bytes.len() {
        let c = bytes[i] as char;
        if c.is_whitespace() {
            i += 1;
            continue;
        }
        if c == '/' && i + 1 < bytes.len() && bytes[i + 1] as char == '/' {
            i += 2;
            while i < bytes.len() && (bytes[i] as char) != '\n' {
                i += 1;
            }
            continue;
        }
        let pos = i;

        if is_ident_start(c) {
            let start = i;
            i += 1;
            while i < bytes.len() && is_ident_char(bytes[i] as char) {
                i += 1;
            }
            // 識別子直後の `.Xn`（ビット指定）。`..` は range のため取り込まない。
            if i < bytes.len() && bytes[i] as char == '.' {
                if i + 1 < bytes.len() && bytes[i + 1] as char != '.' {
                    let c2 = bytes[i + 1] as char;
                    if c2 == 'X' || c2 == 'x' {
                        let mut j = i + 2;
                        while j < bytes.len() && (bytes[j] as char).is_ascii_digit() {
                            j += 1;
                        }
                        if j > i + 2 {
                            i = j;
                        }
                    }
                }
            }
            let ident = &input[start..i];
            let upper = ident.to_ascii_uppercase();
            let kind = match upper.as_str() {
                "VAR" => TokenKind::Var,
                "END_VAR" => TokenKind::EndVar,
                "VAR_INPUT" => TokenKind::VarInput,
                "PROGRAM" => TokenKind::Program,
                "END_PROGRAM" => TokenKind::EndProgram,
                "FUNCTION" => TokenKind::Function,
                "END_FUNCTION" => TokenKind::EndFunction,
                "RETURN" => TokenKind::Return,
                "XOR" => TokenKind::Xor,
                "AND" => TokenKind::And,
                "OR" => TokenKind::Or,
                "INT" => TokenKind::TypeInt,
                "BYTE" => TokenKind::TypeByte,
                "WORD" => TokenKind::TypeWord,
                "DWORD" => TokenKind::TypeDword,
                "BOOL" => TokenKind::TypeBool,
                "ARRAY" => TokenKind::Array,
                "OF" => TokenKind::Of,
                "NOT" => TokenKind::Not,
                "FOR" => TokenKind::For,
                "TO" => TokenKind::To,
                "DO" => TokenKind::Do,
                "END_FOR" => TokenKind::EndFor,
                "MOD" => TokenKind::Mod,
                _ => TokenKind::Ident(ident.to_string()),
            };
            tokens.push(Token { kind, pos });
            continue;
        }

        if c.is_ascii_digit() {
            let start = i;
            i += 1;
            while i < bytes.len() && (bytes[i] as char).is_ascii_digit() {
                i += 1;
            }
            let s = &input[start..i];
            let v: i64 = s.parse().map_err(|e| format!("整数リテラルのパースに失敗しました: {e}"))?;
            tokens.push(Token {
                kind: TokenKind::Int(v),
                pos,
            });
            continue;
        }

        match c {
            ':' => {
                if i + 1 < bytes.len() && bytes[i + 1] as char == '=' {
                    tokens.push(Token {
                        kind: TokenKind::Assign,
                        pos,
                    });
                    i += 2;
                } else {
                    tokens.push(Token {
                        kind: TokenKind::Colon,
                        pos,
                    });
                    i += 1;
                }
            }
            '=' => {
                tokens.push(Token {
                    kind: TokenKind::Eq,
                    pos,
                });
                i += 1;
            }
            '<' => {
                if i + 1 < bytes.len() {
                    let n = bytes[i + 1] as char;
                    if n == '=' {
                        tokens.push(Token {
                            kind: TokenKind::Le,
                            pos,
                        });
                        i += 2;
                        continue;
                    }
                    if n == '>' {
                        tokens.push(Token {
                            kind: TokenKind::Ne,
                            pos,
                        });
                        i += 2;
                        continue;
                    }
                }
                tokens.push(Token {
                    kind: TokenKind::Lt,
                    pos,
                });
                i += 1;
            }
            '>' => {
                if i + 1 < bytes.len() && bytes[i + 1] as char == '=' {
                    tokens.push(Token {
                        kind: TokenKind::Ge,
                        pos,
                    });
                    i += 2;
                } else {
                    tokens.push(Token {
                        kind: TokenKind::Gt,
                        pos,
                    });
                    i += 1;
                }
            }
            ';' => {
                tokens.push(Token {
                    kind: TokenKind::Semicolon,
                    pos,
                });
                i += 1;
            }
            '+' => {
                tokens.push(Token {
                    kind: TokenKind::Plus,
                    pos,
                });
                i += 1;
            }
            '-' => {
                tokens.push(Token {
                    kind: TokenKind::Minus,
                    pos,
                });
                i += 1;
            }
            '*' => {
                tokens.push(Token {
                    kind: TokenKind::Star,
                    pos,
                });
                i += 1;
            }
            '/' => {
                tokens.push(Token {
                    kind: TokenKind::Slash,
                    pos,
                });
                i += 1;
            }
            '(' => {
                tokens.push(Token {
                    kind: TokenKind::LParen,
                    pos,
                });
                i += 1;
            }
            ')' => {
                tokens.push(Token {
                    kind: TokenKind::RParen,
                    pos,
                });
                i += 1;
            }
            '[' => {
                tokens.push(Token {
                    kind: TokenKind::LBracket,
                    pos,
                });
                i += 1;
            }
            ']' => {
                tokens.push(Token {
                    kind: TokenKind::RBracket,
                    pos,
                });
                i += 1;
            }
            ',' => {
                tokens.push(Token {
                    kind: TokenKind::Comma,
                    pos,
                });
                i += 1;
            }
            '.' => {
                if i + 1 < bytes.len() && bytes[i + 1] as char == '.' {
                    tokens.push(Token {
                        kind: TokenKind::DotDot,
                        pos,
                    });
                    i += 2;
                } else {
                    return Err(format!("未知の文字 '{}' (バイト位置 {pos})", c));
                }
            }
            _ => {
                return Err(format!("未知の文字 '{}' (バイト位置 {pos})", c));
            }
        }
    }

    Ok(tokens)
}

#[derive(Debug)]
enum Expr {
    Int(i64),
    Var(String),
    Binary {
        op: BinOp,
        lhs: Box<Expr>,
        rhs: Box<Expr>,
    },
    Cmp {
        op: CmpOp,
        lhs: Box<Expr>,
        rhs: Box<Expr>,
    },
    UnaryNot(Box<Expr>),   // BOOL 用
    Index(String, Box<Expr>), // 配列添字 base[index]
    ArrayLit(Vec<Expr>),   // [ e1, e2, ... ]
}

#[derive(Debug, Clone, Copy)]
enum CmpOp {
    Lt,
    Le,
    Gt,
    Ge,
    Eq,
    Ne,
}

#[derive(Debug, Clone, Copy)]
enum BinOp {
    Add,
    Sub,
    Mul,
    Div,
    Mod,
    Xor,
    And,
    Or,
}

#[derive(Debug, Clone, Copy)]
enum ParamTy {
    Bool,
    Int,
}

#[derive(Debug)]
struct FunctionParam {
    name: String,
    ty: ParamTy,
}

/// VAR のスカラーは INT / DWORD。配列は従来どおり INT のみ。
#[derive(Debug, Clone, Copy)]
enum ScalarVarTy {
    Int,
    Byte,  // LLVM i8
    Word,  // LLVM i16
    Dword, // LLVM i32
}

#[derive(Debug)]
enum Stmt {
    VarDecl {
        name: String,
        array_bounds: Option<(i64, i64)>, // None = スカラー、Some = ARRAY [lo..hi] OF INT
        scalar_ty: Option<ScalarVarTy>,   // array_bounds が None のとき INT または DWORD
        init: Expr,
    },
    Assign {
        name: String,
        expr: Expr,
    },
    For {
        var: String,
        start: Expr,
        end: Expr,
        body: Vec<Stmt>,
    },
    Return(Expr),
}

#[derive(Debug)]
struct ProgramAst {
    stmts: Vec<Stmt>,
}

#[derive(Debug)]
struct FunctionAst {
    name: String,
    params: Vec<FunctionParam>,
    body: Vec<Stmt>,
}

#[derive(Debug)]
enum RootAst {
    Program(ProgramAst),
    Function(FunctionAst),
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

    fn expect(&mut self, expected: &TokenKind) -> Result<Token, String> {
        match self.bump() {
            Some(t) if &t.kind == expected => Ok(t),
            Some(t) => Err(format!(
                "トークン {:?} を期待しましたが {:?} でした (位置 {})",
                expected, t.kind, t.pos
            )),
            None => Err(format!(
                "トークン {:?} を期待しましたが、入力が終わっています",
                expected
            )),
        }
    }

    fn parse_root(&mut self) -> Result<RootAst, String> {
        match self.peek() {
            Some(Token {
                kind: TokenKind::Function,
                ..
            }) => self.parse_function().map(RootAst::Function),
            _ => self.parse_program().map(RootAst::Program),
        }
    }

    fn parse_program(&mut self) -> Result<ProgramAst, String> {
        let mut stmts = Vec::new();
        while let Some(tok) = self.peek() {
            match tok.kind {
                TokenKind::Var => {
                    self.bump();
                    self.parse_var_block(&mut stmts)?;
                }
                TokenKind::Return => {
                    stmts.push(self.parse_return_stmt()?);
                }
                TokenKind::For => {
                    stmts.push(self.parse_for_stmt()?);
                }
                TokenKind::Ident(_) => {
                    stmts.push(self.parse_assign_stmt()?);
                }
                _ => {
                    return Err(format!(
                        "文の先頭として不正なトークン {:?} (位置 {})",
                        tok.kind, tok.pos
                    ));
                }
            }
        }
        Ok(ProgramAst { stmts })
    }

    fn parse_for_stmt(&mut self) -> Result<Stmt, String> {
        self.expect(&TokenKind::For)?;
        let var = match self.bump() {
            Some(Token {
                kind: TokenKind::Ident(s),
                ..
            }) => s,
            Some(t) => return Err(format!("FOR の変数に識別子を期待しましたが {:?} でした", t.kind)),
            None => return Err("FOR の変数を期待しましたが入力が終わっています".to_string()),
        };
        self.expect(&TokenKind::Assign)?;
        let start = self.parse_expr()?;
        self.expect(&TokenKind::To)?;
        let end = self.parse_expr()?;
        self.expect(&TokenKind::Do)?;
        let mut body = Vec::new();
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::EndFor,
                    ..
                }) => {
                    self.bump();
                    break;
                }
                Some(Token {
                    kind: TokenKind::Ident(_),
                    ..
                }) => body.push(self.parse_assign_stmt()?),
                Some(tok) => {
                    return Err(format!(
                        "FOR 本体で予期しないトークン {:?} (位置 {})",
                        tok.kind, tok.pos
                    ));
                }
                None => return Err("END_FOR を待っているときに入力が終わりました".to_string()),
            }
        }
        Ok(Stmt::For {
            var,
            start,
            end,
            body,
        })
    }

    fn parse_function(&mut self) -> Result<FunctionAst, String> {
        // FUNCTION NotBool : BOOL
        self.expect(&TokenKind::Function)?;
        let name = match self.bump() {
            Some(Token {
                kind: TokenKind::Ident(s),
                ..
            }) => s,
            Some(t) => {
                return Err(format!("関数名として識別子を期待しましたが {:?} でした", t.kind));
            }
            None => return Err("関数名を期待しましたが入力が終わっています".to_string()),
        };
        self.expect(&TokenKind::Colon)?;
        self.expect(&TokenKind::TypeBool)?;

        // VAR_INPUT
        self.expect(&TokenKind::VarInput)?;

        // パラメータ (BOOL / INT)
        let mut params = Vec::new();
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::EndVar,
                    ..
                }) => {
                    self.bump();
                    break;
                }
                Some(Token {
                    kind: TokenKind::Ident(_),
                    ..
                }) => {
                    let param_name = match self.bump() {
                        Some(Token {
                            kind: TokenKind::Ident(s),
                            ..
                        }) => s,
                        Some(t) => {
                            return Err(format!("引数名として識別子を期待しましたが {:?} でした", t.kind));
                        }
                        None => return Err("引数名を期待しましたが入力が終わっています".to_string()),
                    };
                    self.expect(&TokenKind::Colon)?;
                    let pty = match self.peek() {
                        Some(Token {
                            kind: TokenKind::TypeBool,
                            ..
                        }) => {
                            self.bump();
                            ParamTy::Bool
                        }
                        Some(Token {
                            kind: TokenKind::TypeInt,
                            ..
                        }) => {
                            self.bump();
                            ParamTy::Int
                        }
                        Some(t) => {
                            return Err(format!(
                                "VAR_INPUT では BOOL または INT を期待しましたが {:?} でした",
                                t.kind
                            ));
                        }
                        None => return Err("型を期待しましたが入力が終わっています".to_string()),
                    };
                    self.expect(&TokenKind::Semicolon)?;
                    params.push(FunctionParam {
                        name: param_name,
                        ty: pty,
                    });
                }
                Some(t) => {
                    return Err(format!("VAR_INPUT ブロック内で識別子または END_VAR を期待しましたが {:?} でした", t.kind));
                }
                None => return Err("VAR_INPUT ブロックが終了していません".to_string()),
            }
        }

        // 関数本体: END_FUNCTION までを単純な文列として読む
        let mut body = Vec::new();
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::EndFunction,
                    ..
                }) => {
                    self.bump();
                    break;
                }
                Some(Token {
                    kind: TokenKind::Ident(_),
                    ..
                }) => {
                    body.push(self.parse_assign_stmt()?);
                }
                Some(Token {
                    kind: TokenKind::Return,
                    ..
                }) => {
                    body.push(self.parse_return_stmt()?);
                }
                Some(tok) => {
                    return Err(format!(
                        "FUNCTION 本体で予期しないトークン {:?} (位置 {})",
                        tok.kind, tok.pos
                    ));
                }
                None => {
                    return Err("END_FUNCTION を待っているときに入力が終わりました".to_string());
                }
            }
        }

        Ok(FunctionAst {
            name,
            params,
            body,
        })
    }

    fn parse_var_block(&mut self, out: &mut Vec<Stmt>) -> Result<(), String> {
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::EndVar,
                    ..
                }) => {
                    self.bump();
                    break;
                }
                Some(Token {
                    kind: TokenKind::Ident(_),
                    ..
                }) => {
                    out.push(self.parse_var_decl()?);
                }
                Some(tok) => {
                    return Err(format!(
                        "VAR ブロック内で予期しないトークン {:?} (位置 {})",
                        tok.kind, tok.pos
                    ));
                }
                None => {
                    return Err("END_VAR を待っているときに入力が終わりました".to_string());
                }
            }
        }
        Ok(())
    }

    fn parse_var_decl(&mut self) -> Result<Stmt, String> {
        let name = match self.bump() {
            Some(Token {
                kind: TokenKind::Ident(s),
                ..
            }) => s,
            Some(t) => {
                return Err(format!("識別子を期待しましたが {:?} でした", t.kind));
            }
            None => return Err("識別子を期待しましたが入力が終わっています".to_string()),
        };
        self.expect(&TokenKind::Colon)?;

        let (array_bounds, scalar_ty) = if let Some(Token {
            kind: TokenKind::Array,
            ..
        }) = self.peek()
        {
            self.bump();
            self.expect(&TokenKind::LBracket)?;
            let lo = match self.bump() {
                Some(Token {
                    kind: TokenKind::Int(v),
                    ..
                }) => v,
                Some(t) => return Err(format!("ARRAY の下限に整数を期待しましたが {:?} でした", t.kind)),
                None => return Err("ARRAY の下限を期待しましたが入力が終わっています".to_string()),
            };
            self.expect(&TokenKind::DotDot)?;
            let hi = match self.bump() {
                Some(Token {
                    kind: TokenKind::Int(v),
                    ..
                }) => v,
                Some(t) => return Err(format!("ARRAY の上限に整数を期待しましたが {:?} でした", t.kind)),
                None => return Err("ARRAY の上限を期待しましたが入力が終わっています".to_string()),
            };
            self.expect(&TokenKind::RBracket)?;
            self.expect(&TokenKind::Of)?;
            self.expect(&TokenKind::TypeInt)?;
            (Some((lo, hi)), None)
        } else if let Some(Token {
            kind: TokenKind::TypeByte,
            ..
        }) = self.peek()
        {
            self.bump();
            (None, Some(ScalarVarTy::Byte))
        } else if let Some(Token {
            kind: TokenKind::TypeWord,
            ..
        }) = self.peek()
        {
            self.bump();
            (None, Some(ScalarVarTy::Word))
        } else if let Some(Token {
            kind: TokenKind::TypeDword,
            ..
        }) = self.peek()
        {
            self.bump();
            (None, Some(ScalarVarTy::Dword))
        } else {
            self.expect(&TokenKind::TypeInt)?;
            (None, Some(ScalarVarTy::Int))
        };

        let mut init = Expr::Int(0);
        if let Some(Token {
            kind: TokenKind::Assign,
            ..
        }) = self.peek()
        {
            self.bump();
            init = self.parse_expr()?;
        }
        self.expect(&TokenKind::Semicolon)?;
        Ok(Stmt::VarDecl {
            name,
            array_bounds,
            scalar_ty,
            init,
        })
    }

    fn parse_assign_stmt(&mut self) -> Result<Stmt, String> {
        let name = match self.bump() {
            Some(Token {
                kind: TokenKind::Ident(s),
                ..
            }) => s,
            Some(t) => return Err(format!("識別子を期待しましたが {:?} でした", t.kind)),
            None => return Err("識別子を期待しましたが入力が終わっています".to_string()),
        };
        self.expect(&TokenKind::Assign)?;
        let expr = self.parse_expr()?;
        self.expect(&TokenKind::Semicolon)?;
        Ok(Stmt::Assign { name, expr })
    }

    fn parse_return_stmt(&mut self) -> Result<Stmt, String> {
        self.expect(&TokenKind::Return)?;
        let expr = self.parse_expr()?;
        self.expect(&TokenKind::Semicolon)?;
        Ok(Stmt::Return(expr))
    }

    fn parse_expr(&mut self) -> Result<Expr, String> {
        let lhs = self.parse_add_sub()?;
        match self.peek() {
            Some(Token {
                kind: TokenKind::Lt,
                ..
            }) => {
                self.bump();
                let rhs = self.parse_add_sub()?;
                Ok(Expr::Cmp {
                    op: CmpOp::Lt,
                    lhs: Box::new(lhs),
                    rhs: Box::new(rhs),
                })
            }
            Some(Token {
                kind: TokenKind::Le,
                ..
            }) => {
                self.bump();
                let rhs = self.parse_add_sub()?;
                Ok(Expr::Cmp {
                    op: CmpOp::Le,
                    lhs: Box::new(lhs),
                    rhs: Box::new(rhs),
                })
            }
            Some(Token {
                kind: TokenKind::Gt,
                ..
            }) => {
                self.bump();
                let rhs = self.parse_add_sub()?;
                Ok(Expr::Cmp {
                    op: CmpOp::Gt,
                    lhs: Box::new(lhs),
                    rhs: Box::new(rhs),
                })
            }
            Some(Token {
                kind: TokenKind::Ge,
                ..
            }) => {
                self.bump();
                let rhs = self.parse_add_sub()?;
                Ok(Expr::Cmp {
                    op: CmpOp::Ge,
                    lhs: Box::new(lhs),
                    rhs: Box::new(rhs),
                })
            }
            Some(Token {
                kind: TokenKind::Eq,
                ..
            }) => {
                self.bump();
                let rhs = self.parse_add_sub()?;
                Ok(Expr::Cmp {
                    op: CmpOp::Eq,
                    lhs: Box::new(lhs),
                    rhs: Box::new(rhs),
                })
            }
            Some(Token {
                kind: TokenKind::Ne,
                ..
            }) => {
                self.bump();
                let rhs = self.parse_add_sub()?;
                Ok(Expr::Cmp {
                    op: CmpOp::Ne,
                    lhs: Box::new(lhs),
                    rhs: Box::new(rhs),
                })
            }
            _ => Ok(lhs),
        }
    }

    fn parse_add_sub(&mut self) -> Result<Expr, String> {
        let mut node = self.parse_or()?;
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::Plus,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_or()?;
                    node = Expr::Binary {
                        op: BinOp::Add,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                Some(Token {
                    kind: TokenKind::Minus,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_or()?;
                    node = Expr::Binary {
                        op: BinOp::Sub,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                _ => break,
            }
        }
        Ok(node)
    }

    fn parse_or(&mut self) -> Result<Expr, String> {
        let mut node = self.parse_and()?;
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::Or,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_and()?;
                    node = Expr::Binary {
                        op: BinOp::Or,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                _ => break,
            }
        }
        Ok(node)
    }

    fn parse_and(&mut self) -> Result<Expr, String> {
        let mut node = self.parse_xor()?;
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::And,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_xor()?;
                    node = Expr::Binary {
                        op: BinOp::And,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                _ => break,
            }
        }
        Ok(node)
    }

    fn parse_xor(&mut self) -> Result<Expr, String> {
        let mut node = self.parse_mul_div()?;
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::Xor,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_mul_div()?;
                    node = Expr::Binary {
                        op: BinOp::Xor,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                _ => break,
            }
        }
        Ok(node)
    }

    fn parse_mul_div(&mut self) -> Result<Expr, String> {
        let mut node = self.parse_primary()?;
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::Star,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_primary()?;
                    node = Expr::Binary {
                        op: BinOp::Mul,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                Some(Token {
                    kind: TokenKind::Slash,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_primary()?;
                    node = Expr::Binary {
                        op: BinOp::Div,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                Some(Token {
                    kind: TokenKind::Mod,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_primary()?;
                    node = Expr::Binary {
                        op: BinOp::Mod,
                        lhs: Box::new(node),
                        rhs: Box::new(rhs),
                    };
                }
                _ => break,
            }
        }
        Ok(node)
    }

    fn parse_primary(&mut self) -> Result<Expr, String> {
        let first = match self.bump() {
            Some(t) => t,
            None => return Err("式を期待しましたが入力が終わっています".to_string()),
        };
        match first.kind {
            TokenKind::Int(v) => Ok(Expr::Int(v)),
            TokenKind::Ident(s) => {
                if let Some(Token {
                    kind: TokenKind::LBracket,
                    ..
                }) = self.peek()
                {
                    self.bump();
                    let index_expr = self.parse_expr()?;
                    self.expect(&TokenKind::RBracket)?;
                    Ok(Expr::Index(s, Box::new(index_expr)))
                } else {
                    Ok(Expr::Var(s))
                }
            }
            TokenKind::Not => {
                let expr = self.parse_primary()?;
                Ok(Expr::UnaryNot(Box::new(expr)))
            }
            TokenKind::LParen => {
                let expr = self.parse_expr()?;
                self.expect(&TokenKind::RParen)?;
                Ok(expr)
            }
            TokenKind::LBracket => {
                let mut elems = Vec::new();
                loop {
                    if let Some(Token {
                        kind: TokenKind::RBracket,
                        ..
                    }) = self.peek()
                    {
                        self.bump();
                        break;
                    }
                    elems.push(self.parse_expr()?);
                    match self.peek() {
                        Some(Token {
                            kind: TokenKind::Comma,
                            ..
                        }) => {
                            self.bump();
                        }
                        Some(Token {
                            kind: TokenKind::RBracket,
                            ..
                        }) => {}
                        Some(tok) => {
                            return Err(format!(
                                "配列リテラルで ',' または ']' を期待しましたが {:?} でした (位置 {})",
                                tok.kind, tok.pos
                            ));
                        }
                        None => return Err("配列リテラルが ']' で閉じられていません".to_string()),
                    }
                }
                Ok(Expr::ArrayLit(elems))
            }
            _ => Err(format!(
                "式の先頭として不正なトークン {:?} (位置 {})",
                first.kind, first.pos
            )),
        }
    }
}

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

fn sanitize_llvm_name(name: &str) -> String {
    let mut out = String::with_capacity(name.len());
    for ch in name.chars() {
        if ch.is_ascii_alphanumeric() || ch == '_' {
            out.push(ch);
        } else {
            out.push('_');
        }
    }
    if out.is_empty() {
        "st_pou".to_string()
    } else {
        out
    }
}

/// `名前.Xn`（llil と同様。最後の `.` の直後が X/x + 10 進桁）
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

fn max_bit_scalar(ty: ScalarVarTy) -> u32 {
    match ty {
        ScalarVarTy::Byte => 7,
        ScalarVarTy::Word => 15,
        ScalarVarTy::Int | ScalarVarTy::Dword => 31,
    }
}

fn validate_bit_index(ty: ScalarVarTy, bit: u32, operand: &str) -> Result<(), String> {
    let max = max_bit_scalar(ty);
    if bit > max {
        return Err(format!(
            "ビット位置 {} は型の範囲外です（0..={}）: {}",
            bit, max, operand
        ));
    }
    Ok(())
}

fn llvm_elem_ty_st(ty: ScalarVarTy) -> &'static str {
    match ty {
        ScalarVarTy::Byte => "i8",
        ScalarVarTy::Word => "i16",
        ScalarVarTy::Int | ScalarVarTy::Dword => "i32",
    }
}

fn collect_bool_function_assign_targets(body: &[Stmt]) -> Result<Vec<String>, String> {
    let mut out = Vec::new();
    for s in body {
        match s {
            Stmt::Assign { name, .. } => out.push(name.clone()),
            _ => {
                return Err("BOOL 関数の本体は代入文のみです".to_string());
            }
        }
    }
    if out.is_empty() {
        return Err("BOOL 関数の本体が空です".to_string());
    }
    Ok(out)
}

fn validate_unique_assign_targets(names: &[String]) -> Result<(), String> {
    use std::collections::HashSet;
    let mut set = HashSet::new();
    for n in names {
        if !set.insert(n.clone()) {
            return Err(format!("代入先 {} が重複しています", n));
        }
    }
    Ok(())
}

struct BoolCodeGen<'a> {
    func: &'a FunctionAst,
    memory: MemoryKind,
    next_tmp: u32,
    /// stack: 空（パラメータは `i1 %name`）。rtedge: 各 VAR_INPUT のロード結果レジスタ名。
    var_bindings: std::collections::HashMap<String, String>,
}

impl<'a> BoolCodeGen<'a> {
    fn new(func: &'a FunctionAst, memory: MemoryKind) -> Self {
        Self {
            func,
            memory,
            next_tmp: 1,
            var_bindings: std::collections::HashMap::new(),
        }
    }

    fn fresh_tmp(&mut self) -> String {
        let name = format!("%b{}", self.next_tmp);
        self.next_tmp += 1;
        name
    }

    fn param_ty(&self, name: &str) -> Option<ParamTy> {
        self.func
            .params
            .iter()
            .find(|p| p.name == name)
            .map(|p| p.ty)
    }

    fn gen_int_expr(&mut self, m: &mut LlvmModule, expr: &Expr) -> Result<String, String> {
        match expr {
            Expr::Int(v) => Ok(format!("{}", *v)),
            Expr::Var(name) => {
                if let Some(reg) = self.var_bindings.get(name) {
                    return Ok(reg.clone());
                }
                match self.param_ty(name) {
                    Some(ParamTy::Int) => Ok(format!("%{}", name)),
                    Some(ParamTy::Bool) => Err(format!("INT 式で BOOL 引数 {} は使えません", name)),
                    None => Err(format!("未定義の変数 {}", name)),
                }
            }
            Expr::Binary { op, lhs, rhs } => match op {
                BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div | BinOp::Mod => {
                    let l = self.gen_int_expr(m, lhs)?;
                    let r = self.gen_int_expr(m, rhs)?;
                    let tmp = self.fresh_tmp();
                    let op_str = match op {
                        BinOp::Add => "add",
                        BinOp::Sub => "sub",
                        BinOp::Mul => "mul",
                        BinOp::Div => "sdiv",
                        BinOp::Mod => "srem",
                        _ => unreachable!(),
                    };
                    m.emit(format!("  {} = {} i32 {}, {}", tmp, op_str, l, r));
                    Ok(tmp)
                }
                _ => Err("INT 式では AND/OR/XOR は使えません".to_string()),
            },
            Expr::UnaryNot(_) => Err("整数式で NOT は使えません".to_string()),
            Expr::Cmp { .. } => Err("比較は BOOL を返します（括弧で分離してください）".to_string()),
            Expr::Index(..) | Expr::ArrayLit(_) => Err("BOOL 関数では配列は未対応です".to_string()),
        }
    }

    fn gen_bool_expr(&mut self, m: &mut LlvmModule, expr: &Expr) -> Result<String, String> {
        match expr {
            Expr::Cmp { op, lhs, rhs } => {
                let l = self.gen_int_expr(m, lhs)?;
                let r = self.gen_int_expr(m, rhs)?;
                let tmp = self.fresh_tmp();
                let pred = match op {
                    CmpOp::Lt => "slt",
                    CmpOp::Le => "sle",
                    CmpOp::Gt => "sgt",
                    CmpOp::Ge => "sge",
                    CmpOp::Eq => "eq",
                    CmpOp::Ne => "ne",
                };
                m.emit(format!("  {} = icmp {} i32 {}, {}", tmp, pred, l, r));
                Ok(tmp)
            }
            Expr::Var(name) => {
                if let Some(reg) = self.var_bindings.get(name) {
                    return Ok(reg.clone());
                }
                match self.param_ty(name) {
                    Some(ParamTy::Bool) => Ok(format!("%{}", name)),
                    Some(ParamTy::Int) => Err(format!("BOOL 式で INT 引数 {} は使えません", name)),
                    None => Err(format!("未定義の変数 {}", name)),
                }
            }
            Expr::UnaryNot(inner) => {
                let v = self.gen_bool_expr(m, inner)?;
                let tmp = self.fresh_tmp();
                m.emit(format!("  {} = xor i1 {}, true", tmp, v));
                Ok(tmp)
            }
            Expr::Binary { op, lhs, rhs } => match op {
                BinOp::Xor | BinOp::And | BinOp::Or => {
                    let l = self.gen_bool_expr(m, lhs)?;
                    let r = self.gen_bool_expr(m, rhs)?;
                    let tmp = self.fresh_tmp();
                    let op_str = match op {
                        BinOp::Xor => "xor",
                        BinOp::And => "and",
                        BinOp::Or => "or",
                        _ => unreachable!(),
                    };
                    m.emit(format!("  {} = {} i1 {}, {}", tmp, op_str, l, r));
                    Ok(tmp)
                }
                _ => Err("BOOL 式では算術演算は使えません（比較式を使う）".to_string()),
            },
            Expr::Int(_) => Err("BOOL 式で整数リテラル単体は不可（比較式を使う）".to_string()),
            Expr::Index(..) | Expr::ArrayLit(_) => Err("BOOL 関数では配列は未対応です".to_string()),
        }
    }

    fn emit_rtedge_globals_and_slots_init(
        &self,
        m: &mut LlvmModule,
        pou_name: &str,
        output_irs: &[String],
    ) {
        for p in &self.func.params {
            let ir = sanitize_llvm_name(&p.name);
            match p.ty {
                ParamTy::Bool => {
                    m.emit(format!("@il_mem_{ir} = global i1 false, align 1", ir = ir));
                    m.emit(format!(
                        "@il_slot_{ir} = global ptr null, align 4",
                        ir = ir
                    ));
                }
                ParamTy::Int => {
                    m.emit(format!("@il_mem_{ir} = global i32 0, align 4", ir = ir));
                    m.emit(format!(
                        "@il_slot_{ir} = global ptr null, align 4",
                        ir = ir
                    ));
                }
            }
        }
        for out_ir in output_irs {
            m.emit(format!(
                "@il_mem_{out_ir} = global i1 false, align 1",
                out_ir = out_ir
            ));
            m.emit(format!(
                "@il_slot_{out_ir} = global ptr null, align 4",
                out_ir = out_ir
            ));
        }

        m.emit(format!("define void @{}_slots_init() {{", pou_name));
        m.emit("entry:");
        m.emit("  ; rtedge: 当面は stack と同様 @il_mem_* を指す。EgApi で il_slot を上書き。");
        for p in &self.func.params {
            let ir = sanitize_llvm_name(&p.name);
            m.emit(format!(
                "  store ptr @il_mem_{ir}, ptr @il_slot_{ir}",
                ir = ir
            ));
        }
        for out_ir in output_irs {
            m.emit(format!(
                "  store ptr @il_mem_{out_ir}, ptr @il_slot_{out_ir}",
                out_ir = out_ir
            ));
        }
        m.emit("  ret void");
        m.emit("}");
    }

    fn gen(&mut self) -> Result<LlvmModule, String> {
        let assign_targets = collect_bool_function_assign_targets(&self.func.body)?;
        validate_unique_assign_targets(&assign_targets)?;
        for name in &assign_targets {
            if self.param_ty(name).is_some() {
                return Err(format!(
                    "代入先 {} は VAR_INPUT と同名です",
                    name
                ));
            }
        }

        let mut m = LlvmModule::new();
        m.emit(format!(
            "; llst: simple ST BOOL function -> LLVM IR memory={}",
            self.memory.as_cli_label()
        ));
        m.emit("target datalayout = \"e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32\"");
        m.emit("target triple = \"i386-pc-windows-msvc\"");

        let pou_name = sanitize_llvm_name(&self.func.name);

        if self.memory == MemoryKind::Rtedge {
            let output_irs: Vec<String> = assign_targets
                .iter()
                .map(|n| sanitize_llvm_name(n))
                .collect();
            self.emit_rtedge_globals_and_slots_init(&mut m, &pou_name, &output_irs);

            m.emit(format!("define void @{}() {{", pou_name));
            m.emit("entry:");
            for p in &self.func.params {
                let ir = sanitize_llvm_name(&p.name);
                let ptr_tmp = self.fresh_tmp();
                let val_tmp = self.fresh_tmp();
                m.emit(format!(
                    "  {} = load ptr, ptr @il_slot_{}",
                    ptr_tmp, ir
                ));
                match p.ty {
                    ParamTy::Bool => {
                        m.emit(format!("  {} = load i1, ptr {}", val_tmp, ptr_tmp));
                    }
                    ParamTy::Int => {
                        m.emit(format!("  {} = load i32, ptr {}", val_tmp, ptr_tmp));
                    }
                }
                self.var_bindings.insert(p.name.clone(), val_tmp);
            }

            for stmt in &self.func.body {
                if let Stmt::Assign { name, expr } = stmt {
                    let v = self.gen_bool_expr(&mut m, expr)?;
                    let out_ir = sanitize_llvm_name(name);
                    let out_ptr = self.fresh_tmp();
                    m.emit(format!(
                        "  {} = load ptr, ptr @il_slot_{}",
                        out_ptr, out_ir
                    ));
                    m.emit(format!("  store i1 {}, ptr {}", v, out_ptr));
                    self.var_bindings.insert(name.clone(), v);
                }
            }
            m.emit("  ret void");
            m.emit("}");
            return Ok(m);
        }

        if self.func.body.len() != 1 {
            return Err(
                "BOOL 関数は stack では 1 文のみ: `FunctionName := <式>;`".to_string(),
            );
        }
        let stmt = &self.func.body[0];
        let expr = match stmt {
            Stmt::Assign { name, expr } if name == &self.func.name => expr,
            _ => {
                return Err(
                    "BOOL 関数（stack）は `FunctionName := <式>;` である必要があります".to_string(),
                )
            }
        };

        let param_list = self
            .func
            .params
            .iter()
            .map(|p| {
                let ty = match p.ty {
                    ParamTy::Bool => "i1",
                    ParamTy::Int => "i32",
                };
                format!("{} %{}", ty, p.name)
            })
            .collect::<Vec<_>>()
            .join(", ");
        m.emit(format!(
            "define i1 @{}( {} ) {{",
            self.func.name, param_list
        ));
        m.emit("entry:");

        let v = self.gen_bool_expr(&mut m, expr)?;
        m.emit(format!("  ret i1 {}", v));
        m.emit("}");
        Ok(m)
    }
}

struct CodeGen<'a> {
    ast: &'a ProgramAst,
    entry_name: &'a str,
    memory: MemoryKind,
    next_tmp: u32,
    vars: Vec<(String, String, ScalarVarTy)>, // (name, ptr, ty) for scalars
    arrays: Vec<(String, String, u32)>,       // (name, ptr, len) for arrays
}

impl<'a> CodeGen<'a> {
    fn new(ast: &'a ProgramAst, entry_name: &'a str, memory: MemoryKind) -> Self {
        Self {
            ast,
            entry_name,
            memory,
            next_tmp: 1,
            vars: Vec::new(),
            arrays: Vec::new(),
        }
    }

    fn fresh_tmp(&mut self) -> String {
        let name = format!("%t{}", self.next_tmp);
        self.next_tmp += 1;
        name
    }

    fn find_scalar_ptr(&self, base: &str) -> Option<(&str, ScalarVarTy)> {
        self.vars
            .iter()
            .rev()
            .find(|(n, _, _)| n == base)
            .map(|(_, p, t)| (p.as_str(), *t))
    }

    fn find_array_ptr(&self, name: &str) -> Option<(&str, u32)> {
        self.arrays
            .iter()
            .rev()
            .find(|(n, _, _)| n == name)
            .map(|(_, p, len)| (p.as_str(), *len))
    }

    fn gen(&mut self) -> Result<LlvmModule, String> {
        let mut m = LlvmModule::new();
        let pou_name = sanitize_llvm_name(self.entry_name);

        m.emit(format!(
            "; llst: simple ST -> LLVM IR memory={}",
            self.memory.as_cli_label()
        ));
        m.emit(format!("define i32 @{}() {{", pou_name));
        m.emit("entry:");

        for stmt in &self.ast.stmts {
            match stmt {
                Stmt::VarDecl {
                    name,
                    array_bounds,
                    scalar_ty,
                    init,
                } => {
                    match array_bounds {
                        None => {
                            let sty = scalar_ty.unwrap_or(ScalarVarTy::Int);
                            let ptr = self.fresh_tmp();
                            match sty {
                                ScalarVarTy::Byte => {
                                    m.emit(format!("  {} = alloca i8", ptr));
                                    self.vars.push((name.clone(), ptr.clone(), sty));
                                    let v = self.gen_expr(&mut m, init)?;
                                    let tr = self.fresh_tmp();
                                    m.emit(format!("  {} = trunc i32 {} to i8", tr, v));
                                    m.emit(format!("  store i8 {}, ptr {}", tr, ptr));
                                }
                                ScalarVarTy::Word => {
                                    m.emit(format!("  {} = alloca i16", ptr));
                                    self.vars.push((name.clone(), ptr.clone(), sty));
                                    let v = self.gen_expr(&mut m, init)?;
                                    let tr = self.fresh_tmp();
                                    m.emit(format!("  {} = trunc i32 {} to i16", tr, v));
                                    m.emit(format!("  store i16 {}, ptr {}", tr, ptr));
                                }
                                ScalarVarTy::Int | ScalarVarTy::Dword => {
                                    m.emit(format!("  {} = alloca i32", ptr));
                                    self.vars.push((name.clone(), ptr.clone(), sty));
                                    let v = self.gen_expr(&mut m, init)?;
                                    m.emit(format!("  store i32 {}, ptr {}", v, ptr));
                                }
                            }
                        }
                        Some((lo, hi)) => {
                            let len = (hi - lo + 1) as u32;
                            let ptr = self.fresh_tmp();
                            m.emit(format!("  {} = alloca [{} x i32]", ptr, len));
                            self.arrays.push((name.clone(), ptr.clone(), len));
                            if let Expr::ArrayLit(elems) = init {
                                for (idx, e) in elems.iter().enumerate() {
                                    let v = self.gen_expr(&mut m, e)?;
                                    let elem_ptr = self.fresh_tmp();
                                    m.emit(format!(
                                        "  {} = getelementptr inbounds [{} x i32], ptr {}, i32 0, i32 {}",
                                        elem_ptr, len, ptr, idx
                                    ));
                                    m.emit(format!("  store i32 {}, ptr {}", v, elem_ptr));
                                }
                            }
                        }
                    }
                }
                Stmt::Assign { name, expr } => {
                    let v = self.gen_expr(&mut m, expr)?;
                    self.emit_store_scalar(&mut m, name, &v)?;
                }
                Stmt::For {
                    var,
                    start,
                    end,
                    body,
                } => {
                    let ptr = self.fresh_tmp();
                    m.emit(format!("  {} = alloca i32", ptr));
                    let start_v = self.gen_expr(&mut m, start)?;
                    m.emit(format!("  store i32 {}, ptr {}", start_v, ptr));
                    let loop_label = format!("loop.{}", self.next_tmp);
                    self.next_tmp += 1;
                    let body_label = format!("forbody.{}", self.next_tmp);
                    self.next_tmp += 1;
                    let end_label = format!("end.{}", self.next_tmp);
                    self.next_tmp += 1;
                    m.emit(format!("  br label %{}", loop_label));
                    m.emit(format!("{}:", loop_label));
                    self.vars.push((var.clone(), ptr.clone(), ScalarVarTy::Int));
                    let cur = self.fresh_tmp();
                    m.emit(format!("  {} = load i32, ptr {}", cur, ptr));
                    let end_v = self.gen_expr(&mut m, end)?;
                    let cond = self.fresh_tmp();
                    m.emit(format!("  {} = icmp sgt i32 {}, {}", cond, cur, end_v));
                    m.emit(format!(
                        "  br i1 {}, label %{}, label %{}",
                        cond, end_label, body_label
                    ));
                    m.emit(format!("{}:", body_label));
                    for s in body {
                        match s {
                            Stmt::Assign { name: an, expr: ex } => {
                                let v = self.gen_expr(&mut m, ex)?;
                                self.emit_store_scalar(&mut m, an, &v)?;
                            }
                            _ => return Err("FOR 本体では代入文のみ対応しています".to_string()),
                        }
                    }
                    let inc = self.fresh_tmp();
                    m.emit(format!("  {} = load i32, ptr {}", inc, ptr));
                    let one = self.fresh_tmp();
                    m.emit(format!("  {} = add i32 {}, 1", one, inc));
                    m.emit(format!("  store i32 {}, ptr {}", one, ptr));
                    m.emit(format!("  br label %{}", loop_label));
                    m.emit(format!("{}:", end_label));
                    self.vars.pop();
                }
                Stmt::Return(expr) => {
                    let v = self.gen_expr(&mut m, expr)?;
                    m.emit(format!("  ret i32 {}", v));
                }
            }
        }

        if !matches!(self.ast.stmts.last(), Some(Stmt::Return(_))) {
            m.emit("  ret i32 0");
        }

        m.emit("}");
        Ok(m)
    }

    fn emit_store_scalar(&mut self, m: &mut LlvmModule, name: &str, val_ssa: &str) -> Result<(), String> {
        if let Some((_, bit)) = parse_bit_suffix(name) {
            let base = operand_base(name);
            let (ptr, sty) = self
                .find_scalar_ptr(base)
                .ok_or_else(|| format!("未定義の変数 {}", base))?;
            validate_bit_index(sty, bit, name)?;
            let elt = llvm_elem_ty_st(sty);
            let ptr_s = ptr.to_string();
            let old = self.fresh_tmp();
            m.emit(format!("  {} = load {elt}, ptr {}", old, ptr_s));
            let one = self.fresh_tmp();
            m.emit(format!("  {} = shl {elt} 1, {}", one, bit));
            let not_mask = self.fresh_tmp();
            let all_ones = match elt {
                "i8" => "255",
                "i16" => "65535",
                "i32" => "-1",
                _ => unreachable!(),
            };
            m.emit(format!("  {} = xor {elt} {}, {}", not_mask, one, all_ones));
            let cleared = self.fresh_tmp();
            m.emit(format!("  {} = and {elt} {}, {}", cleared, old, not_mask));
            let bi = self.fresh_tmp();
            m.emit(format!("  {} = icmp ne i32 {}, 0", bi, val_ssa));
            let ext = self.fresh_tmp();
            m.emit(format!("  {} = zext i1 {} to {elt}", ext, bi));
            let shl = self.fresh_tmp();
            m.emit(format!("  {} = shl {elt} {}, {}", shl, ext, bit));
            let newv = self.fresh_tmp();
            m.emit(format!("  {} = or {elt} {}, {}", newv, cleared, shl));
            m.emit(format!("  store {elt} {}, ptr {}", newv, ptr_s));
            return Ok(());
        }
        if let Some((ptr, sty)) = self.find_scalar_ptr(name) {
            let ptr_s = ptr.to_string();
            match sty {
                ScalarVarTy::Byte => {
                    let tr = self.fresh_tmp();
                    m.emit(format!("  {} = trunc i32 {} to i8", tr, val_ssa));
                    m.emit(format!("  store i8 {}, ptr {}", tr, ptr_s));
                }
                ScalarVarTy::Word => {
                    let tr = self.fresh_tmp();
                    m.emit(format!("  {} = trunc i32 {} to i16", tr, val_ssa));
                    m.emit(format!("  store i16 {}, ptr {}", tr, ptr_s));
                }
                ScalarVarTy::Int | ScalarVarTy::Dword => {
                    m.emit(format!("  store i32 {}, ptr {}", val_ssa, ptr_s));
                }
            }
            Ok(())
        } else {
            Err(format!("未定義の変数 {}", name))
        }
    }

    fn gen_expr(&mut self, m: &mut LlvmModule, expr: &Expr) -> Result<String, String> {
        match expr {
            Expr::Int(v) => Ok(format!("{}", v)),
            Expr::Var(name) => {
                if let Some((base, bit)) = parse_bit_suffix(name) {
                    let (ptr, sty) = self
                        .find_scalar_ptr(base)
                        .ok_or_else(|| format!("未定義の変数 {}", base))?;
                    validate_bit_index(sty, bit, name)?;
                    let elt = llvm_elem_ty_st(sty);
                    let ptr_s = ptr.to_string();
                    let v = self.fresh_tmp();
                    m.emit(format!("  {} = load {elt}, ptr {}", v, ptr_s));
                    let sh = self.fresh_tmp();
                    m.emit(format!("  {} = lshr {elt} {}, {}", sh, v, bit));
                    let b1 = self.fresh_tmp();
                    m.emit(format!("  {} = and {elt} {}, 1", b1, sh));
                    let icmp = self.fresh_tmp();
                    m.emit(format!("  {} = icmp ne {elt} {}, 0", icmp, b1));
                    let out = self.fresh_tmp();
                    m.emit(format!("  {} = zext i1 {} to i32", out, icmp));
                    return Ok(out);
                }
                let (ptr, sty) = self
                    .find_scalar_ptr(name)
                    .ok_or_else(|| format!("未定義の変数 {}", name))?;
                let ptr_s = ptr.to_string();
                let tmp = self.fresh_tmp();
                match sty {
                    ScalarVarTy::Byte => {
                        m.emit(format!("  {} = load i8, ptr {}", tmp, ptr_s));
                        let z = self.fresh_tmp();
                        m.emit(format!("  {} = zext i8 {} to i32", z, tmp));
                        Ok(z)
                    }
                    ScalarVarTy::Word => {
                        m.emit(format!("  {} = load i16, ptr {}", tmp, ptr_s));
                        let z = self.fresh_tmp();
                        m.emit(format!("  {} = zext i16 {} to i32", z, tmp));
                        Ok(z)
                    }
                    ScalarVarTy::Int | ScalarVarTy::Dword => {
                        m.emit(format!("  {} = load i32, ptr {}", tmp, ptr_s));
                        Ok(tmp)
                    }
                }
            }
            Expr::Binary { op, lhs, rhs } => {
                let lv = self.gen_expr(m, lhs)?;
                let rv = self.gen_expr(m, rhs)?;
                let tmp = self.fresh_tmp();
                let op_str = match op {
                    BinOp::Add => "add",
                    BinOp::Sub => "sub",
                    BinOp::Mul => "mul",
                    BinOp::Div => "sdiv",
                    BinOp::Mod => "srem",
                    BinOp::Xor => "xor",
                    BinOp::And => "and",
                    BinOp::Or => "or",
                };
                m.emit(format!("  {} = {} i32 {}, {}", tmp, op_str, lv, rv));
                Ok(tmp)
            }
            Expr::Cmp { .. } => Err("PROGRAM では比較式は未対応です（BOOL 関数で利用）".to_string()),
            Expr::Index(name, index_expr) => {
                let (arr_ptr, len) = self
                    .find_array_ptr(name)
                    .map(|(p, l)| (p.to_string(), l))
                    .ok_or_else(|| format!("未定義の配列 {}", name))?;
                let idx = self.gen_expr(m, index_expr)?;
                let elem_ptr = self.fresh_tmp();
                m.emit(format!(
                    "  {} = getelementptr inbounds [{} x i32], ptr {}, i32 0, i32 {}",
                    elem_ptr, len, arr_ptr, idx
                ));
                let tmp = self.fresh_tmp();
                m.emit(format!("  {} = load i32, ptr {}", tmp, elem_ptr));
                Ok(tmp)
            }
            Expr::ArrayLit(_) => Err("配列リテラルは変数初期化でのみ使用できます".to_string()),
            Expr::UnaryNot(_) => Err("整数式コンテキストでの NOT (BOOL 式) はまだサポートしていません".to_string()),
        }
    }
}

fn compile_st_to_llvm_ir(
    input: &str,
    entry_name: &str,
    memory: MemoryKind,
) -> Result<String, String> {
    let tokens = lex(input)?;
    let mut parser = Parser::new(tokens);
    let root = parser.parse_root()?;
    match root {
        RootAst::Program(ast) => {
            let mut gen = CodeGen::new(&ast, entry_name, memory);
            let module = gen.gen()?;
            Ok(module.to_string())
        }
        RootAst::Function(func) => {
            // いまは BOOL 関数 (invert.st のような形) のみをサポート
            let mut gen = BoolCodeGen::new(&func, memory);
            let module = gen.gen()?;
            Ok(module.to_string())
        }
    }
}

fn usage(program: &str) {
    eprintln!("使い方:");
    eprintln!("  {} <input.st>", program);
    eprintln!(
        "  {} <input.st> [-o <output.ll>] [--memory=stack|rtedge]",
        program
    );
    eprintln!();
    eprintln!("ST (Structured Text 風のサブセット) を LLVM IR (.ll) に変換します。");
    eprintln!("PROGRAM では INT / BYTE / WORD / DWORD スカラーと `名前.Xn` ビット指定（BYTE:0..7, WORD:0..15, INT/DWORD:0..31）が使えます。");
    eprintln!("--memory は省略時 stack（ローカル alloca）。rtedge は BOOL 関数で @il_slot_* / *_slots_init を生成。");
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let program = args.get(0).cloned().unwrap_or_else(|| "llst".into());
    let (input_path, out_path, memory) = match parse_cli_args(&args) {
        Ok(x) => x,
        Err(e) => {
            eprintln!("{e}");
            usage(&program);
            std::process::exit(1);
        }
    };
    let input = match fs::read_to_string(&input_path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("入力ファイルを読み込めませんでした: {e}");
            std::process::exit(1);
        }
    };

    let entry_name = Path::new(&input_path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("st_pou");

    let ir = match compile_st_to_llvm_ir(&input, entry_name, memory) {
        Ok(ir) => ir,
        Err(e) => {
            eprintln!("コンパイルエラー: {e}");
            std::process::exit(1);
        }
    };

    // 出力先:
    //   llst input.st              -> stdout
    //   llst input.st -o output.ll -> output.ll
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

