type token =
  | EOF
  | TK_LPAREN
  | TK_RPAREN
  | TK_INT
  | TK_INT_LITERAL of (
# 9 "bin/MBAParser.mly"
       int
# 10 "bin/MBAParser.mli"
)
  | TK_SYMBOL of (
# 10 "bin/MBAParser.mly"
       string
# 15 "bin/MBAParser.mli"
)
  | TK_OP of (
# 11 "bin/MBAParser.mly"
       string
# 20 "bin/MBAParser.mli"
)

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Expr.expr
