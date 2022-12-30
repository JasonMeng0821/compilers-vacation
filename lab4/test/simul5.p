var i: integer;
var j: boolean;
begin 
  i := 100;
  j := true;
  i, j := j, i;
  print_num(i);
  newline()
end.