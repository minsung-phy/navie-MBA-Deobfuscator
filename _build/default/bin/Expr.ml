type unary_op = Neg | Not
type binary_op = Plus | Minus | Mul | Div | Mod | And | Or | Xor | LShift | RShift
type expr =
  | Constant of int
  | Var of string
  | UExpr of unary_op * expr
  | BExpr of binary_op * expr * expr

let rec size e =
  match e with
  | Var _ -> 1
  | Constant _ -> 1
  | UExpr (_, e1) -> 1 + size e1
  | BExpr (_, e1, e2) -> 1 + size e1 + size e2

let rec vars e =
  match e with
  | Var x -> [x]
  | Constant _ -> []
  | UExpr (_, e1) -> vars e1
  | BExpr (_, e1, e2) -> List.concat [vars e1; vars e2]

let unique_vars e =
  let var_list = vars e in
  List.fold_left (fun acc x -> if List.mem x acc then acc else x :: acc) [] var_list

