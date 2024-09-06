unit Static_Stack;

interface

Uses Crt;

const
  MAX_SIZE = 100;
  NORM = 8;
  SEL = 13;

type
  tStack = array [1..MAX_SIZE] of Integer;

var
  last: Integer;
  Stack: tStack;
  ch: char;

procedure Push_Stat(var Stack: tStack; data: integer);
procedure Print_Stat(Stack: tStack);
procedure addToStack_Stat(var Stack: tStack);
procedure clearStack_Stat(var Stack: tStack);
function Pop_Stat(var Stack: tStack): integer;

implementation 

procedure Push_Stat(var Stack: tStack; data: integer);
begin
  if last = MAX_SIZE then
  begin
    textcolor(red);
    Writeln('Стек Полон');
    textcolor(norm);
  end
  else begin
    inc(last);
    Stack[last] := data;
  end;
end;

function Pop_Stat(var Stack: tStack): integer;
var
  Res: integer;
begin
  ClrScr;
  if last = 0 then
  begin
    textcolor(red);
    Writeln('Стек Пуст');
    textcolor(norm);
  end
  else begin
    Res := Stack[last];
    dec(last);
    Clrscr;
    Pop_Stat := Res;
    Writeln('Взят Элемент ', Res);
  end;
  repeat
    ch := readkey
  until ch = #13;
end;

procedure Print_Stat(Stack: tStack);
var
  i: Integer;
begin
  clrscr;
  if last = 0 then
  begin
    textcolor(red);
    WriteLn('Стек Пуст');
    textcolor(norm);
  end
  else begin
    for i := 1 to last do
      Write(Stack[i], ' ');
  end;
  repeat
    ch := readkey;
  until ch = #13;
end;

procedure addToStack_Stat(var Stack: tStack);
var
  data: integer;
begin
  Clrscr;
  textcolor(green);
  Write('Введите значение добавляемого элемента: '); 
  ReadLn(data);
  Push_Stat(Stack, data);
  textcolor(norm);
  repeat
    ch := ReadKey;
  until ch = #13;
end;

procedure clearStack_Stat(var Stack: tStack);
begin
  last := 0;
  Clrscr;
  textcolor(red);
  WriteLn('Стек очищен');
  textcolor(norm);
  repeat
    ch := ReadKey;
  until ch = #13;
end;

end. 
