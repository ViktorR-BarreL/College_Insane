uses GraphABC;
uses Sierpinski_carpet;
 
var
  n: Integer;
  x1, y1, x2, y2: Real;
 
Procedure KeyDown(key: integer);
begin
  case key of
    VK_A: if n div 3 >3 then n := n div 3; //клавиша 'A'  глубина++
    VK_Z: if n*3 < x2-x1 then n := n*3;//клавиша 'Z'  глубина--
    VK_Add : begin x1-=10; y1+=10; x2+=10; y2-=10 end;//клавиша '+'  Масштаб++
    VK_Subtract: begin x1+=10; y1-=10; x2-=10; y2+=10 end;//клавиша '+'  Масштаб--
    VK_Right: begin x1-=10; x2-=10 end; //далее курсоры в четыре стороны
    VK_Left: begin x1+=10; x2+=10 end;
    VK_Down: begin y1-=10; y2-=10 end;
    VK_Up: begin y1+=10; y2+=10 end;
    end;
  Window.Clear;
  Rectangle(Round(x1), Round(y1), Round(x2), Round(y2));
  Serp(x1, y1, x2, y2, n);
  ReDraw;
end;

begin
  SetWindowCaption('Фракталы: Ковер Серпинского');
  SetWindowSize(751, 751);
  SetWindowPos(10, 10);
  x1 := 11; y1 := 11; x2 := 740; y1 := 740; n := 4;
  LockDrawing;
  KeyDown(0);
  OnKeyDown += KeyDown;
end.