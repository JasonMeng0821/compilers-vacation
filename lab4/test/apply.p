(* Passing nested functions as parameters *)

proc apply(proc f(x: integer));
begin
  f(111)
end;

proc beta(y: integer);
  proc f(x: integer);
  begin
    print_num(x);
    newline();
  end;

  proc g(x:integer);
  begin
    print_num(y);
    newline();
  end;

begin
  apply(f);
  apply(g)
end;

begin
  beta(222)
end.

(*<<
111
222
>>*)

(*[[
@ picoPascal compiler output
	.global pmain

@ proc apply(proc f(x: integer));
	.text
_apply:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   f(111)
	mov r0, #111
	ldr r10, [fp, #44]
	ldr r1, [fp, #40]
	blx r1
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@ proc beta(y: integer);
_beta:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   apply(f);
	mov r1, fp
	ldr r0, =_f_g1
	bl _apply
@   apply(g)
	mov r1, fp
	ldr r0, =_g_g2
	bl _apply
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@   proc f(x: integer);
_f_g1:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     print_num(x);
	ldr r0, [fp, #40]
	bl print_num
@     newline();
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@   proc g(x:integer);
_g_g2:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     print_num(y);
	ldr r0, [fp, #24]
	ldr r0, [r0, #40]
	bl print_num
@     newline();
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   beta(222)
	mov r0, #222
	bl _beta
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@ End
]]*)