unit Sierpinski_carpet;

Interface
  Uses GraphABC;
  procedure Serp(x1, y1, x2, y2: Real; nn: integer);

Implementation
procedure Serp(x1, y1, x2, y2: Real; nn: integer);
var
  x1n, y1n, x2n, y2n: Real;
begin
  if abs(x1-x2) > nn then
  begin
    x1n := 2 * x1 / 3 + x2 / 3;
    x2n := x1 / 3 + 2 * x2 / 3;
    y1n := 2 * y1 / 3 + y2 / 3;
    y2n := y1 / 3 + 2 * y2 / 3;
    Rectangle(Round(x1n), Round(y1n), Round(x2n), Round(y2n));
    Serp(x1, y1, x1n, y1n, nn);
    Serp(x1n, y1, x2n, y1n, nn);
    Serp(x2n, y1, x2, y1n, nn);
    Serp(x1, y1n, x1n, y2n, nn);
    Serp(x2n, y1n, x2, y2n, nn);
    Serp(x1, y2n, x1n, y2, nn);
    Serp(x1n, y2n, x2n, y2, nn);
    Serp(x2n, y2n, x2, y2, nn)
  end
end;
end.
