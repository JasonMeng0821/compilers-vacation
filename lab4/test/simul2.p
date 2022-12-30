var a: array 10 of integer;
var i: integer;
begin 
  i := 0;
  a[0] := 0;
  a[1] := 2;
  i, a[i] := i+1, a[i]+1;
  print_num(a[0]);
  newline()
end.

(*<<
2
>>*)