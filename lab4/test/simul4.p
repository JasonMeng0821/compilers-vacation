var i, j:boolean;
begin
  i := false;
  j := true;
  i, j := j, i;
  if i=true then
      print_num(1);
      newline()
  end
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
@   i := false;
	mov r4, #0
	ldr r5, =_i
	strb r4, [r5]
@   j := true;
	mov r6, #1
	ldr r7, =_j
	strb r6, [r7]
@   i, j := j, i;
	strb r6, [r5]
	strb r4, [r7]
@   if i=true then
	ldrb r0, [r5]
	cmp r0, #1
	bne .L1
@       print_num(1);
	mov r0, #1
	bl print_num
@       newline()
	bl newline
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

	.comm _i, 1, 4
	.comm _j, 1, 4
@ End
]]*)