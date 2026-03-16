use std::env;
use std::fs;
use std::path::Path;

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
    Plus,
    Minus,
    Star,
    Slash,
    LParen,
    RParen,
    TypeInt,  // INT
    TypeBool, // BOOL
    Not,      // NOT
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
        let pos = i;

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
                "END_VAR" => TokenKind::EndVar,
                "VAR_INPUT" => TokenKind::VarInput,
                "PROGRAM" => TokenKind::Program,
                "END_PROGRAM" => TokenKind::EndProgram,
                "FUNCTION" => TokenKind::Function,
                "END_FUNCTION" => TokenKind::EndFunction,
                "RETURN" => TokenKind::Return,
                "INT" => TokenKind::TypeInt,
                "BOOL" => TokenKind::TypeBool,
                "NOT" => TokenKind::Not,
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
    UnaryNot(Box<Expr>), // BOOL 用
}

#[derive(Debug, Clone, Copy)]
enum BinOp {
    Add,
    Sub,
    Mul,
    Div,
}

#[derive(Debug)]
enum Stmt {
    VarDecl {
        name: String,
        init: Expr,
    },
    Assign {
        name: String,
        expr: Expr,
    },
    Return(Expr),
}

#[derive(Debug)]
struct ProgramAst {
    stmts: Vec<Stmt>,
}

#[derive(Debug)]
struct FunctionAst {
    // いまは invert.st のような「BOOL を返す 1 引数 BOOL 関数」にだけ対応
    name: String,
    param_name: String,
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

        // パラメータ (1 個の BOOL のみ対応):
        //   x : BOOL;
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
        self.expect(&TokenKind::TypeBool)?;
        self.expect(&TokenKind::Semicolon)?;

        // END_VAR
        self.expect(&TokenKind::EndVar)?;

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
            param_name,
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
        self.expect(&TokenKind::TypeInt)?;

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
        Ok(Stmt::VarDecl { name, init })
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
        self.parse_add_sub()
    }

    fn parse_add_sub(&mut self) -> Result<Expr, String> {
        let mut node = self.parse_mul_div()?;
        loop {
            match self.peek() {
                Some(Token {
                    kind: TokenKind::Plus,
                    ..
                }) => {
                    self.bump();
                    let rhs = self.parse_mul_div()?;
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
                    let rhs = self.parse_mul_div()?;
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
                _ => break,
            }
        }
        Ok(node)
    }

    fn parse_primary(&mut self) -> Result<Expr, String> {
        match self.bump() {
            Some(Token {
                kind: TokenKind::Int(v),
                ..
            }) => Ok(Expr::Int(v)),
            Some(Token {
                kind: TokenKind::Ident(s),
                ..
            }) => Ok(Expr::Var(s)),
            Some(Token {
                kind: TokenKind::Not,
                ..
            }) => {
                // NOT <expr>
                let expr = self.parse_primary()?;
                Ok(Expr::UnaryNot(Box::new(expr)))
            }
            Some(Token {
                kind: TokenKind::LParen,
                ..
            }) => {
                let expr = self.parse_expr()?;
                self.expect(&TokenKind::RParen)?;
                Ok(expr)
            }
            Some(t) => Err(format!(
                "式の先頭として不正なトークン {:?} (位置 {})",
                t.kind, t.pos
            )),
            None => Err("式を期待しましたが入力が終わっています".to_string()),
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

struct BoolCodeGen<'a> {
    func: &'a FunctionAst,
    next_tmp: u32,
}

impl<'a> BoolCodeGen<'a> {
    fn new(func: &'a FunctionAst) -> Self {
        Self { func, next_tmp: 1 }
    }

    fn fresh_tmp(&mut self) -> String {
        let name = format!("%b{}", self.next_tmp);
        self.next_tmp += 1;
        name
    }

    fn gen_expr(&mut self, m: &mut LlvmModule, expr: &Expr) -> Result<String, String> {
        match expr {
            Expr::Var(name) => {
                if name == &self.func.param_name {
                    Ok(format!("%{}", self.func.param_name))
                } else {
                    Err(format!("BOOL 関数内で未対応の変数参照 {}", name))
                }
            }
            Expr::UnaryNot(inner) => {
                let v = self.gen_expr(m, inner)?;
                let tmp = self.fresh_tmp();
                // NOT x -> xor i1 x, true
                m.emit(format!("  {} = xor i1 {}, true", tmp, v));
                Ok(tmp)
            }
            Expr::Int(_) | Expr::Binary { .. } => Err(
                "BOOL 関数では整数リテラルや算術演算はまだサポートしていません".to_string(),
            ),
        }
    }

    fn gen(&mut self) -> Result<LlvmModule, String> {
        // いまは「関数名 := <式>;」1文だけに対応
        if self.func.body.len() != 1 {
            return Err("BOOL 関数は 1 文だけ (関数名 := <式>;) にしか対応していません".to_string());
        }
        let stmt = &self.func.body[0];
        let expr = match stmt {
            Stmt::Assign { name, expr } if name == &self.func.name => expr,
            _ => {
                return Err(
                    "BOOL 関数は本体が `FunctionName := <式>;` という代入文である必要があります"
                        .to_string(),
                )
            }
        };

        let mut m = LlvmModule::new();
        m.emit("; llst: simple ST BOOL function -> LLVM IR");
        m.emit(format!(
            "define i1 @{}(i1 %{}) {{",
            self.func.name, self.func.param_name
        ));
        m.emit("entry:");

        let v = self.gen_expr(&mut m, expr)?;
        m.emit(format!("  ret i1 {}", v));
        m.emit("}");
        Ok(m)
    }
}

struct CodeGen<'a> {
    ast: &'a ProgramAst,
    next_tmp: u32,
    vars: Vec<(String, String)>,
}

impl<'a> CodeGen<'a> {
    fn new(ast: &'a ProgramAst) -> Self {
        Self {
            ast,
            next_tmp: 1,
            vars: Vec::new(),
        }
    }

    fn fresh_tmp(&mut self) -> String {
        let name = format!("%t{}", self.next_tmp);
        self.next_tmp += 1;
        name
    }

    fn find_var_ptr(&self, name: &str) -> Option<&str> {
        self.vars
            .iter()
            .rev()
            .find(|(n, _)| n == name)
            .map(|(_, p)| p.as_str())
    }

    fn gen(&mut self) -> Result<LlvmModule, String> {
        let mut m = LlvmModule::new();

        m.emit("; llst: simple ST -> LLVM IR");
        m.emit("define i32 @main() {");
        m.emit("entry:");

        for stmt in &self.ast.stmts {
            match stmt {
                Stmt::VarDecl { name, init } => {
                    let ptr = self.fresh_tmp();
                    m.emit(format!("  {} = alloca i32", ptr));
                    self.vars.push((name.clone(), ptr.clone()));
                    let v = self.gen_expr(&mut m, init)?;
                    m.emit(format!("  store i32 {}, ptr {}", v, ptr));
                }
                Stmt::Assign { name, expr } => {
                    let ptr = self
                        .find_var_ptr(name)
                        .ok_or_else(|| format!("未定義の変数 {}", name))?
                        .to_string();
                    let v = self.gen_expr(&mut m, expr)?;
                    m.emit(format!("  store i32 {}, ptr {}", v, ptr));
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

    fn gen_expr(&mut self, m: &mut LlvmModule, expr: &Expr) -> Result<String, String> {
        match expr {
            Expr::Int(v) => Ok(format!("{}", v)),
            Expr::Var(name) => {
                // ここでは self からポインタ文字列をコピーしておき、
                // その後で fresh_tmp を呼ぶことで借用競合を避ける。
                let ptr: String = {
                    let mut found: Option<String> = None;
                    for (n, p) in self.vars.iter().rev() {
                        if n == name {
                            found = Some(p.clone());
                            break;
                        }
                    }
                    found.ok_or_else(|| format!("未定義の変数 {}", name))?
                };
                let tmp = self.fresh_tmp();
                m.emit(format!("  {} = load i32, ptr {}", tmp, ptr));
                Ok(tmp)
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
                };
                m.emit(format!("  {} = {} i32 {}, {}", tmp, op_str, lv, rv));
                Ok(tmp)
            }
            Expr::UnaryNot(_) => Err("整数式コンテキストでの NOT (BOOL 式) はまだサポートしていません".to_string()),
        }
    }
}

fn compile_st_to_llvm_ir(input: &str) -> Result<String, String> {
    let tokens = lex(input)?;
    let mut parser = Parser::new(tokens);
    let root = parser.parse_root()?;
    match root {
        RootAst::Program(ast) => {
            let mut gen = CodeGen::new(&ast);
            let module = gen.gen()?;
            Ok(module.to_string())
        }
        RootAst::Function(func) => {
            // いまは BOOL 関数 (invert.st のような形) のみをサポート
            let mut gen = BoolCodeGen::new(&func);
            let module = gen.gen()?;
            Ok(module.to_string())
        }
    }
}

fn usage(program: &str) {
    eprintln!("使い方:");
    eprintln!("  {} <input.st>", program);
    eprintln!("  {} <input.st> -o <output.ll>", program);
    eprintln!();
    eprintln!("ST (Structured Text 風のサブセット) を LLVM IR (.ll) に変換します。");
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let program = args.get(0).cloned().unwrap_or_else(|| "llst".into());
    if args.len() < 2 {
        usage(&program);
        std::process::exit(1);
    }

    let input_path = &args[1];
    let input = match fs::read_to_string(input_path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("入力ファイルを読み込めませんでした: {e}");
            std::process::exit(1);
        }
    };

    let ir = match compile_st_to_llvm_ir(&input) {
        Ok(ir) => ir,
        Err(e) => {
            eprintln!("コンパイルエラー: {e}");
            std::process::exit(1);
        }
    };

    // 出力先:
    //   llst input.st              -> stdout
    //   llst input.st -o output.ll -> output.ll
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

