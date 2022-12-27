(* The digits problem with sets represented by nested functions *)

proc search(k, n: integer; proc avail(x: integer): boolean);
  var d, n1: integer;
  proc avail1(x: integer): boolean;
  begin
    if x <> d then 
      return avail(x)
    else
      return false
    end
  end;
begin
  if k = 9 then
    print_num(n); newline()
  else
    d := 1;
    while d < 10 do
      n1 := 10 * n + d;
      if (n1 mod (k+1) = 0) and avail(d) then
        search(k+1, n1, avail1)
      end;
      d := d+1
    end
  end
end;

proc avail0(x: integer): boolean;
begin
  return true
end;

begin
  search(0, 0, avail0)
end.

(*<<
381654729
>>*)

(*[[
@ picoPascal compiler output
	.global pmain

@ proc search(k, n: integer; proc avail(x: integer): boolean);
	.text
_search:
	mov ip, sp
	stmfd sp!, {r0-r3}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
	sub sp, sp, #8
@   if k = 9 then
	ldr r0, [fp, #40]
	cmp r0, #9
	bne .L4
@     print_num(n); newline()
	ldr r0, [fp, #44]
	bl print_num
	bl newline
	b .L2
.L4:
@     d := 1;
	mov r0, #1
	str r0, [fp, #-4]
.L6:
@     while d < 10 do
	ldr r5, [fp, #-4]
	cmp r5, #10
	bge .L2
@       n1 := 10 * n + d;
	ldr r0, [fp, #44]
	mov r1, #10
	mul r0, r0, r1
	add r4, r0, r5
@       if (n1 mod (k+1) = 0) and avail(d) then
	ldr r0, [fp, #40]
	add r1, r0, #1
	mov r0, r4
	bl int_mod
	cmp r0, #0
	bne .L11
	ldr r0, [fp, #-4]
	ldr r10, [fp, #52]
	ldr r1, [fp, #48]
	blx r1
	cmp r0, #0
	beq .L11
@         search(k+1, n1, avail1)
	mov r3, fp
	ldr r2, =_avail1_g1
	mov r1, r4
	ldr r0, [fp, #40]
	add r0, r0, #1
	bl _search
.L11:
@       d := d+1
	ldr r0, [fp, #-4]
	add r0, r0, #1
	str r0, [fp, #-4]
	b .L6
.L2:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@   proc avail1(x: integer): boolean;
_avail1_g1:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     if x <> d then 
	ldr r4, [fp, #40]
	ldr r5, [fp, #24]
	ldr r0, [r5, #-4]
	cmp r4, r0
	beq .L15
@       return avail(x)
	mov r0, r4
	ldr r10, [r5, #52]
	ldr r1, [r5, #48]
	blx r1
	b .L13
.L15:
@       return false
	mov r0, #0
.L13:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@ proc avail0(x: integer): boolean;
_avail0:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   return true
	mov r0, #1
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   search(0, 0, avail0)
	mov r3, #0
	ldr r2, =_avail0
	mov r1, #0
	mov r0, #0
	bl _search
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

@ End
]]*)