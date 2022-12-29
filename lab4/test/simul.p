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