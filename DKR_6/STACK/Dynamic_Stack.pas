unit Dynamic_Stack;

interface

Uses Crt;

const
  NORM = 8;
  SEL = 13;

type
  PNode = ^Node;{ указатель на узел }
  Node = record
    data: integer;
    next: PNode; { указатель на след. элемент }
  end;

var
  S: PNode;
  x: integer;
  ch: char;

procedure Push_Dyn(var Head: PNode; x: integer);
procedure Print_Dyn(var Head: PNode);
procedure addToStack_Dyn(var Head: PNode);
procedure ClearStack_Dyn(var Head: PNode);
function Pop_Dyn(var Head: PNode): integer;

implementation 

procedure Push_Dyn(var Head: PNode; x: integer);
var
  NewNode: PNode;
begin
  New(NewNode);          { выделение памяти }
  NewNode^.data := x;    { запись символа }
  NewNode^.next := Head; { сделать первым узлом }
  Head := NewNode;
end;

procedure Print_Dyn(var Head: PNode);
var
  Temp, q: PNode;
begin
  ClrScr;
  if Head = nil then
  begin
    textcolor(red);
    Writeln('Стек Пуст');
    textcolor(norm);
  end
  else
  begin
    Temp := nil;
    // Переносим элементы из исходного стека во временный стек
    q := Head;
    while q <> nil do
    begin
      Push_Dyn(Temp, q^.data);
      q := q^.next;
    end;
    // Выводим элементы из временного стека
    q := Temp;
    while q <> nil do
    begin
      write(q^.data, ' ');
      q := q^.next;
    end;
  end;
  repeat
    ch := readkey;
  until ch = #13;
end;

procedure ClearStack_Dyn(var Head: PNode);
var
  q: PNode;
begin
  while Head <> nil do
  begin
    q := Head;
    Head := Head^.next;
    Dispose(q);
  end;
  Clrscr;
  textcolor(red);
  WriteLn('Стек очищен');
  textcolor(norm);
  repeat
    ch := ReadKey;
  until ch = #13;
end;

function Pop_Dyn(var Head: PNode): integer;
begin
  ClrScr;
  var q: PNode;
  if Head = nil then
  begin
    textcolor(red);
    Writeln('Стек Пуст');
    textcolor(norm);
  end
  else
  begin
    Result := Head^.data;  { берем верхний символ }
    q := Head;             { запоминаем вершину } 
    Head := Head^.next; { удаляем вершину }
    Writeln('Взят Элемент ', Result);
    Dispose(q);            { удаление из памяти }
  end;
  repeat
    ch := readkey
  until ch = #13;
end;

procedure AddToStack_Dyn(var Head: PNode);
begin
  Clrscr;
  textcolor(green);
  Write('Введите значение добавляемого элемента: '); 
  ReadLn(x);
  Push_Dyn(Head, x);
  textcolor(norm);
  repeat
    ch := ReadKey;
  until ch = #13;
end;

end.
