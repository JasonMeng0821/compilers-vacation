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