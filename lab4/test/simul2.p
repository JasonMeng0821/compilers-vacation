var a: array 10 of integer;
var i: integer;
begin 
  i := 0;
  a[0] := 1;
  a[1] := 2;
  i, a[i] := i+1, a[i]+1;
  print_num(a[0]);
  newline()
end.

(*<<
2
>>*)

(*[[
@ picoPascal compiler output
	.global pmain

	.text
pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   i := 0;
	ldr r4, =_i
	mov r0, #0
	str r0, [r4]
@   a[0] := 1;
	ldr r5, =_a
	mov r0, #1
	str r0, [r5]
@   a[1] := 2;
	mov r0, #2
	str r0, [r5, #4]
@   i, a[i] := i+1, a[i]+1;
	ldr r6, [r4]
	add r7, r5, r6, LSL #2
	add r6, r6, #1
	ldr r0, [r7]
	add r8, r0, #1
	str r6, [r4]
	str r8, [r7]
@   print_num(a[0]);
	ldr r0, [r5]
	bl print_num
@   newline()
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

	.comm _a, 40, 4
	.comm _i, 4, 4
@ End
]]*)