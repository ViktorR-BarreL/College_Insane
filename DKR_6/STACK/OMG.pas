program DKR_6;

uses Crt, Static_Stack, Dynamic_Stack;

const
  MAX_SIZE = 100;
  NORM = 8; {серый}
  SEL = 13; {розовый}
  Num = 3;
  nn = 4;

type
  omg = array[1..nn] of string;

var
  menu: array[1..Num] of string;{ названия пунктов меню }
  punkt1_p, punkt2_p: omg;
  Stack1: tStack;
  Stack2: PNode;
  punkt: integer;
  ch: char;
  x1, y1: integer;

procedure MenuToScr;
var
  i: integer;
begin
  ClrScr;
  punkt := 1;
  for i := 1 to Num do
  begin
    GoToXY(x1, y1 + i - 1);
    write(menu[i]);
  end;
  TextColor(SEL);
  GoToXY(x1, y1 + punkt - 1);
  write(menu[punkt]);
  TextColor(NORM);
end;

procedure DisplayMenu(var menuItems: omg; title: string);
var
  i: integer;
begin
  ClrScr;
  punkt := 1;
  textcolor(11);
  writeln(title);
  textcolor(norm);
  for i := 1 to nn do
  begin
    GoToXY(x1, y1 + i - 1);
    write(menuItems[i]);
  end;
  TextColor(SEL);
  GoToXY(x1, y1 + punkt - 1);
  write(menuItems[punkt]);
  TextColor(NORM);
end;

procedure punkt1;
begin
  ClrScr;
  punkt1_p[1] := ' Добавить Элемент ';
  punkt1_p[2] := ' Взять Элемент ';
  punkt1_p[3] := ' Вывести Стек ';
  punkt1_p[4] := ' Очистить Стек ';
  punkt := 1; x1 := 5; y1 := 5;
  TextColor(NORM);
  DisplayMenu(punkt1_p, 'Реализация СТЕКА с помощью статической структуры');
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40:{ стрелка вниз }
          if punkt < 4 then begin
            GoToXY(x1, y1 + punkt - 1); write(punkt1_p[punkt]);
            punkt := punkt + 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(punkt1_p[punkt]);
            TextColor(NORM);
          end;
        #38:{ стрелка вверх }
          if punkt > 1 then begin
            GoToXY(x1, y1 + punkt - 1); write(punkt1_p[punkt]);
            punkt := punkt - 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(punkt1_p[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else
    if ch = #13 then begin{ нажата клавиша <Enter> }
      case punkt of
        1: AddToStack_Stat(Stack1);
        2: Pop_Stat(Stack1);
        3: Print_Stat(Stack1);
        4: ClearStack_Stat(stack1);
      end;
      DisplayMenu(punkt1_p, 'Реализация СТЕКА с помощью статической структуры')
    end;
  until ch = #8;
  menutoscr;
end;

procedure punkt2;
begin
  clrscr;
  punkt2_p[1] := ' Добавить Элемент ';
  punkt2_p[2] := ' Взять Элемент ';
  punkt2_p[3] := ' Вывести Стек ';
  punkt2_p[4] := ' Очистить Стек ';
  punkt := 1; x1 := 5; y1 := 5;
  TextColor(NORM);
  DisplayMenu(punkt2_p, 'Реализация СТЕКА с помощью ДиНаМиЧеСкОй структуры');
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40:{ стрелка вниз }
          if punkt < 4 then begin
            GoToXY(x1, y1 + punkt - 1); write(punkt2_p[punkt]);
            punkt := punkt + 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(punkt2_p[punkt]);
            TextColor(NORM);
          end;
        #38:{ стрелка вверх }
          if punkt > 1 then begin
            GoToXY(x1, y1 + punkt - 1); write(punkt2_p[punkt]);
            punkt := punkt - 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(punkt2_p[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else
    if ch = #13 then begin{ нажата клавиша <Enter> }
      case punkt of
        1: AddToStack_Dyn(Stack2);
        2: Pop_Dyn(Stack2);
        3: Print_Dyn(Stack2);
        4: ClearStack_Dyn(stack2);
      end;
      DisplayMenu(punkt2_p, 'Реализация СТЕКА с помощью ДиНаМиЧеСкОй структуры');
    end;
  until ch = #8;
  menutoscr;
end;


begin
  clrscr;
  textcolor(10);
  Writeln;
  Writeln;
  Writeln('       ________  _________  ________  ________  ___  __       ');
  Writeln('       |\   ____\|\___   ___\\   __  \|\   ____\|\  \|\  \     ');
  Writeln('       \ \  \___|\|___ \  \_\ \  \|\  \ \  \___|\ \  \/  /|_   ');
  Writeln('        \ \_____  \   \ \  \ \ \   __  \ \  \    \ \   ___  \  ');
  Writeln('         \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \\ \  \ ');
  Writeln('           ____\_\  \   \ \__\ \ \__\ \__\ \_______\ \__\\ \__\');
  Writeln('          |\_________\   \|__|  \|__|\|__|\|_______|\|__| \|__|'); 
  Writeln('          \|_________|                                         ');
  writeln;
  textcolor(norm);
  writeln('                       Нажмите [Enter] для продолжения');
  repeat
    ch := readkey;
  until ch = #13;
  clrscr;
  Writeln('STACK');
  menu[1] := ' Статическая структура ';
  menu[2] := ' Динамическая структура ';
  menu[3] := ' Выход ';
  punkt := 1; x1 := 5; y1 := 5;
  TextColor(NORM);
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40:{ стрелка вниз }
          if punkt < Num then begin
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            punkt := punkt + 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            TextColor(NORM);
          end;
        #38:{ стрелка вверх }
          if punkt > 1 then begin
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            punkt := punkt - 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else
    if ch = #13 then begin{ нажата клавиша <Enter> }
      case punkt of
        1: punkt1;
        2: punkt2;
        3: ch := #27;{ выход }
      end;
    end;
  until ch = #27;{ 27 - код <Esc> }
end.
