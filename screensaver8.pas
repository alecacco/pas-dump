program screen8;
uses graph,crt;
var driver,modo:smallint;
    x,y,c:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     c:=0;
     x:=random(1280)+1;
     y:=random(800)+1;
     setlinestyle(0,0,3);
     repeat
           c:=c+1;
           if c mod 400 =0 then cleardevice;
           setcolor(random(15)+1);
           x:=random(1280)+1;
           y:=random(800)+1;
           lineto(x,y);
           delay(100);
     until false;
end.
