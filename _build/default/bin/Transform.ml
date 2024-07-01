open Expr

let rec transform_expr = function
  | UExpr (Neg, Constant x) -> Constant (-x) (* 단항 연산자 '-' 적용 예시 *)
  | BExpr (Plus, Constant x, Constant y) -> Constant (x + y) (* 상수 간 덧셈 최>적화 *)
  | UExpr (op, e) -> UExpr (op, transform_expr e) (* 재귀적 변환 *)
  | BExpr (op, e1, e2) -> BExpr (op, transform_expr e1, transform_expr e2) (* 재
귀적 변환 *)
  | e -> e

let transform tree = transform_expr tree
