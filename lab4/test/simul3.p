type 
Books = record
   book_id: integer;
end;

var b: Books;
var i: integer;

begin
    i := 100;
    b.book_id := 1;
    i, b.book_id := b.book_id, i;
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
@     i := 100;
	mov r4, #100
	ldr r5, =_i
	str r4, [r5]
@     b.book_id := 1;
	mov r6, #1
	ldr r7, =_b
	str r6, [r7]
@     i, b.book_id := b.book_id, i;
	str r6, [r5]
	str r4, [r7]
@     print_num(i);
	ldr r0, [r5]
	bl print_num
@     newline()
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.pool

	.comm _b, 4, 4
	.comm _i, 4, 4
@ End
]]*)

