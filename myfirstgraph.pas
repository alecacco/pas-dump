program graphica;
uses crt,graph;
var driver,modo:smallint;
    c,i,k:integer;
begin
driver:=detect;
initgraph(driver,modo,'');
//setbkcolor(14);
cleardevice;
SETLINESTYLE(0,0,3);
i:=0;
k:=0;
c:=0;
repeat
      c:=c+1;
      if i=1440 then i:=20;
      k:=k+10;
      setcolor(c);
      circle(i,450,k);
until keypressed;
end.
