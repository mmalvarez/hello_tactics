(* Simple test of the "hello" tactic *)
Add LoadPath "./src" as Hello.
Require Import hello.

Goal False.
  xhello "hello, world!".
Abort.
