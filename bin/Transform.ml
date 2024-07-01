open Expr

let rec transform_expr = function
  | UExpr (Neg, Constant x) -> Constant (-x) (* ���� ������ '-' ���� ���� *)
  | BExpr (Plus, Constant x, Constant y) -> Constant (x + y) (* ��� �� ���� ��>��ȭ *)
  | UExpr (op, e) -> UExpr (op, transform_expr e) (* ����� ��ȯ *)
  | BExpr (op, e1, e2) -> BExpr (op, transform_expr e1, transform_expr e2) (* ��
���� ��ȯ *)
  | e -> e

let transform tree = transform_expr tree
