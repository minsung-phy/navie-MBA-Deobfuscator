open Expr

let rec expr_to_syguS e =
  match e with
  | Var v -> v
  | Constant c ->
    (* 숫자를 16진수 비트 벡터 리터럴로 변환 *)
    let hex = Printf.sprintf "#x%016X" (if c < 0 then (1 lsl 64) + c else c) in
    hex
  | UExpr (op, e1) ->
    let op_syguS = match op with
    | Neg -> "bvneg"
    | Not -> "bvnot"
    in
    Printf.sprintf "(%s %s)" op_syguS (expr_to_syguS e1)
  | BExpr (op, e1, e2) ->
    let op_syguS = match op with
    | Plus -> "bvadd"
    | Minus -> "bvsub"
    | Mul -> "bvmul"
    | Xor -> "bvxor"
    | And -> "bvand"
    | Or -> "bvor"
    | Div -> "bvudiv"
    | Mod -> "bvurem"
    | LShift -> "bvshl"
    | RShift -> "bvlshr"
    in
    Printf.sprintf "(%s %s %s)" op_syguS (expr_to_syguS e1) (expr_to_syguS e2)

let generate_syguS ast =
  let syguS_expr = expr_to_syguS ast in
  let syguS_file_content = Printf.sprintf "
(set-logic BV)

(define-fun obfuscated ((x (BitVec 64)) (y (BitVec 64))) (BitVec 64) 
  %s
)

(synth-fun deobfuscated ((x (BitVec 64)) (y (BitVec 64))) (BitVec 64) 
  (
    (Start (BitVec 64)
        (
          (bvnot Start)
          (bvxor Start Start)
          (bvand Start Start)
          (bvor Start Start)
          (bvneg Start)
          (bvadd Start Start)
          (bvmul Start Start)
          (bvsub Start Start)
          (bvshl Start Start)
          (bvsdiv Start Start)
          (bvsrem Start Start)
          (bvlshr Start Start)
           x y
           #x0000000000000000 #x0000000000000001 #x0000000000000002 #x0000000000000004 #x0000000000000008 #x0000000200000000 
        )
      )
  )
)

(declare-var x (BitVec 64)) 
(declare-var y (BitVec 64))

(constraint (= (obfuscated x y) (deobfuscated x y)))
(check-synth)
" syguS_expr in
  syguS_file_content

