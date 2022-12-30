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

