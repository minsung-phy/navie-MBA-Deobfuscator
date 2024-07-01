type token =
  | EOF
  | TK_LPAREN
  | TK_RPAREN
  | TK_INT
  | TK_INT_LITERAL of (
# 9 "bin/MBAParser.mly"
       int
# 10 "bin/MBAParser.ml"
)
  | TK_SYMBOL of (
# 10 "bin/MBAParser.mly"
       string
# 15 "bin/MBAParser.ml"
)
  | TK_OP of (
# 11 "bin/MBAParser.mly"
       string
# 20 "bin/MBAParser.ml"
)

open Parsing
let _ = parse_error;;
# 2 "bin/MBAParser.mly"
  open Expr
# 27 "bin/MBAParser.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* TK_LPAREN *);
  258 (* TK_RPAREN *);
  259 (* TK_INT *);
    0|]

let yytransl_block = [|
  260 (* TK_INT_LITERAL *);
  261 (* TK_SYMBOL *);
  262 (* TK_OP *);
    0|]

let yylhs = "\255\255\
\004\000\001\000\001\000\001\000\001\000\002\000\003\000\000\000"

let yylen = "\002\000\
\001\000\004\000\005\000\001\000\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\007\000\006\000\001\000\005\000\004\000\
\008\000\000\000\000\000\000\000\000\000\002\000\000\000\003\000"

let yydgoto = "\002\000\
\006\000\007\000\008\000\009\000"

let yysindex = "\001\000\
\007\255\000\000\000\255\000\000\000\000\000\000\000\000\000\000\
\000\000\007\255\253\254\011\255\007\255\000\000\012\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\253\255\000\000\000\000\000\000"

let yytablesize = 14
let yytable = "\011\000\
\003\000\001\000\013\000\004\000\005\000\010\000\012\000\003\000\
\000\000\015\000\004\000\005\000\014\000\016\000"

let yycheck = "\003\000\
\001\001\001\000\006\001\004\001\005\001\006\001\010\000\001\001\
\255\255\013\000\004\001\005\001\002\001\002\001"

let yynames_const = "\
  EOF\000\
  TK_LPAREN\000\
  TK_RPAREN\000\
  TK_INT\000\
  "

let yynames_block = "\
  TK_INT_LITERAL\000\
  TK_SYMBOL\000\
  TK_OP\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Expr.expr) in
    Obj.repr(
# 21 "bin/MBAParser.mly"
           ( _1 )
# 94 "bin/MBAParser.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Expr.expr) in
    Obj.repr(
# 25 "bin/MBAParser.mly"
    (
      let rterm = _3 in
      let op = 
        (match _2 with
          | "-" -> Neg
          | "~" -> Not
          | _ -> (failwith "unsupported")
        )
      in
      UExpr (op, rterm)
    )
# 112 "bin/MBAParser.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Expr.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Expr.expr) in
    Obj.repr(
# 37 "bin/MBAParser.mly"
    (
      let lterm = _2 in
      let rterm = _4 in
      let op = 
        (match _3 with
          | "+" -> Plus
          | "-" -> Minus
          | "*" -> Mul
          | "^" -> Xor
          | "&" -> And
          | "|" -> Or
          | "/" -> Div
          | "%" -> Mod
          | "<<" -> LShift
          | ">>" -> RShift
          | _ -> (failwith "unsupported")
        )
      in
      BExpr (op, lterm, rterm)
    )
# 140 "bin/MBAParser.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Expr.expr) in
    Obj.repr(
# 57 "bin/MBAParser.mly"
            ( _1 )
# 147 "bin/MBAParser.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Expr.expr) in
    Obj.repr(
# 58 "bin/MBAParser.mly"
           ( _1 )
# 154 "bin/MBAParser.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 62 "bin/MBAParser.mly"
            ( Var (_1) )
# 161 "bin/MBAParser.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 65 "bin/MBAParser.mly"
                   ( Constant (_1) )
# 168 "bin/MBAParser.ml"
               : Expr.expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Expr.expr)
