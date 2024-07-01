open Batteries

(* Duet 합성 도구를 호출하는 함수 *)
let run_duet sygus_file =
  let command = Printf.sprintf "/experiment/duet/main.native ./%s" sygus_file in
  let exit_status = Sys.command command in
  exit_status

(* 결과 처리 및 출력 *)
let process_results sygus_file =
  let exit_status = run_duet sygus_file in
  match exit_status with
  | 0 -> Printf.printf "Synthesis Successful.\n"
  | _ -> Printf.printf "Synthesizer Timed out or Failed.\n"

let analyze_and_report ast =
  let original_size = Expr.size ast in
  Printf.printf "Size of input expr: %d\n" original_size;
  let transformed_ast = Transform.transform ast in
  let optimized_size = Expr.size transformed_ast in
  Printf.printf "Size of deobfuscated expr: %d\n" optimized_size;
  (transformed_ast, optimized_size)

let _ =
  let input_expression = Sys.argv.(1) in
  let lexbuf = Lexing.from_string input_expression in

  try
    let parsed_ast = MBAParser.main MBALexer.token lexbuf in
    let _ = Printf.printf "Original expression parsed successfully.\n" in
    let (transformed_ast, _) = analyze_and_report parsed_ast in

    let sygus_content = SyGuSGenerator.generate_syguS transformed_ast in
    let sygus_filename = "output.sl" in

    (* SyGuS 파일 생성 *)
    let oc = open_out sygus_filename in
    Printf.fprintf oc "%s" sygus_content;
    close_out oc;

    Printf.printf "SyGuS file written to: %s\n" sygus_filename;
    
    (* Duet 실행 및 결과 처리 *)
    process_results sygus_filename; ()

  with
    | Failure msg ->
      Printf.eprintf "Parser error: %s near %s\n" msg (Lexing.lexeme lexbuf)
    | err ->  (* 다른 예외를 잡아서 보고 *)
      Printf.eprintf "Unexpected error: %s\n" (Printexc.to_string err)
