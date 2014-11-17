(* idk what these do *)
(*i camlp4deps: "parsing/grammar.cma" i*)
(*i camlp4use: "pa_extend.cmp" i*)

(* For [ArgArg] and [ArgVar] *)
open Glob_term
(* For [anomaly] *)
open Util
(* For pp **)
open Pp
open Sys
open Unix

module Section = struct
       let hello () = print_string "Hello world!\n"
       let xhello s =
           execvp "xmessage" [|"xmessage"; s|]
end

(* let _=Mltop.add_known_module "Hello" *)

open Tacexpr
open Tacinterp

TACTIC EXTEND hello
       | ["hello"] ->
         [fun gl ->
              Section.hello ();
              Tacticals.tclIDTAC gl]
END;;

TACTIC EXTEND xhello
       | ["xhello" string(n)] ->
         [fun gl ->
              Section.xhello n;
              Tacticals.tclIDTAC gl]
END;;
