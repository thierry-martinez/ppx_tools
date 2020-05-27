let () =
  match [%expr [%lit.int 10]] with
  | { pexp_desc = Pexp_constant (Const_int 10); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_int 10) with
  | [%expr [%lit.int? 0]] -> assert false
  | [%expr [%lit.int? 10]] -> ()
  | _ -> assert false

let () =
  match [%expr [%lit.int32 10l]] with
  | { pexp_desc = Pexp_constant (Const_int32 10l); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_int32 10l) with
  | [%expr [%lit.int32? 0l]] -> assert false
  | [%expr [%lit.int32? 10l]] -> ()
  | _ -> assert false

let () =
  match [%expr [%lit.int64 10L]] with
  | { pexp_desc = Pexp_constant (Const_int64 10L); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_int64 10L) with
  | [%expr [%lit.int64? 0L]] -> assert false
  | [%expr [%lit.int64? 10L]] -> ()
  | _ -> assert false

let () =
  match [%expr [%lit.char 'c']] with
  | { pexp_desc = Pexp_constant (Const_char 'c'); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_char 'c') with
  | [%expr [%lit.char? 'a']] -> assert false
  | [%expr [%lit.char? 'c']] -> ()
  | _ -> assert false

let () =
  match [%expr [%lit.string "s"]] with
  | { pexp_desc = Pexp_constant (Const_string ("s", None)); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_string ("s", None)) with
  | [%expr [%lit.string? ""]] -> assert false
  | [%expr [%lit.string? "s"]] -> ()
  | _ -> assert false

let () =
  match [%expr [%lit.string "s"] [@quotation_delimiter Some "t"]] with
  | { pexp_desc = Pexp_constant (Const_string ("s", Some "t")); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_string ("s", Some "t")) with
  | [%expr [%lit.string? "s"] [@quotation_delimiter? None]] -> assert false
  | [%expr [%lit.string? "s"] [@quotation_delimiter? Some "t"]] -> ()
  | _ -> assert false

let () =
  match [%expr [%lit.float "1.0"]] with
  | { pexp_desc = Pexp_constant (Const_float "1.0"); _ } -> ()
  | _ -> assert false

let () =
  match Ast_helper.Exp.constant (Const_float "1.0") with
  | [%expr [%lit.float? "0.0"]] -> assert false
  | [%expr [%lit.float? "1.0"]] -> ()
  | _ -> assert false
