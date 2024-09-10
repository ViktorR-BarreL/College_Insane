uses crt;
const nmax=100;
var a,b:array[1..nmax] of integer;
    n,i,j,k:integer;
    f:boolean;
begin
clrscr;
randomize;
repeat
write('Размер массива до ',nmax,' n=');
readln(n);
until n in [1..nmax];
writeln('Исходный массив:');
for i:=1 to n do
 begin
  a[i]:=random(10);
  write(a[i],' ');
 end;
writeln;
for i:=1 to n do
b[i]:=-1;
for i:=1 to n do
 begin
  k:=0;
  for j:=1 to n do
  if a[j]<a[i] then k:=k+1;
  b[k+1]:=a[i];
 end;
for i:=2 to n do
if b[i]=-1 then b[i]:=b[i-1];
writeln('Отсортированный массив:');
for i:=1 to n do
write(b[i],' ');
readln
end.