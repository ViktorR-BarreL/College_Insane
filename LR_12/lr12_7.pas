﻿program lr12_7;

var
  z31, z32: text;
  i, j, k, n, s: integer;
  
begin
  assign(z31, 'c:\z3.in.txt');
  reset(z31);
  readln(z31, n);
  close(z31);
  for i:=1 to n do
  begin
    k:=0;
    for j:=1 to i do
    if (i mod j = 0) then inc(k);
    if k = 5 then s+=i;
    end;
  assign(z32, 'c:\z3.out.txt');
  rewrite(z32);
  write(z32, s);
  close(z32);
end.
