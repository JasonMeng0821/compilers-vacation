var i, j, k, l: integer;
begin 
  i := 0;
  j := 1;
  k := 2;
  l := 3;
  i, j, k, l:= l, k, j, i;
  print_num(i);
  print_num(j);
  print_num(k);
  print_num(l);
  newline()
end.

(*<<
3210
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
@   k := 2;
	mov r8, #2
	ldr r9, =_k
	str r8, [r9]
@   l := 3;
	mov r0, #3
	ldr r1, =_l
	str r0, [r1]
@   i, j, k, l:= l, k, j, i;
	str r0, [r5]
	str r8, [r7]
	str r6, [r9]
	str r4, [r1]
@   print_num(i);
	ldr r0, [r5]
	mov r4, r1
	bl print_num
@   print_num(j);
	ldr r0, [r7]
	bl print_num
@   print_num(k);
	ldr r0, [r9]
	bl print_num
@   print_num(l);
	ldr r0, [r4]
	bl print_num
@   newline()
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

	.comm _i, 4, 4
	.comm _j, 4, 4
	.comm _k, 4, 4
	.comm _l, 4, 4
@ End
]]*)