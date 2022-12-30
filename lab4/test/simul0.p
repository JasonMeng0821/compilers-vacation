var i, j: integer;
begin 
  i := 0;
  j := 1;
  i, j := j, i;
  print_num(i);
  newline()
end.

(*<<
1
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
	mov r4, #0
	ldr r5, =_i
	str r4, [r5]
@   j := 1;
	mov r6, #1
	ldr r7, =_j
	str r6, [r7]
@   i, j := j, i;
	str r6, [r5]
	str r4, [r7]
@   print_num(i);
	ldr r0, [r5]
	bl print_num
@   newline()
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

	.comm _i, 4, 4
	.comm _j, 4, 4
@ End
]]*)