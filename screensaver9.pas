program screensaver7;
uses crt,graph;
var driver,modo:smallint;
    x,y,c:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     x:=0;
     y:=400;
     c:=0;
     setcolor(lightgreen);
     setlinestyle(0,0,3);
     repeat
           c:=c+1;
           if x>1280 then
              begin
                   x:=0;
                   cleardevice;
                   x:=x+random(50)+50;
                   y:=random(400);
                   line(1,400,x,400+y)
              end
              else
              begin
               x:=x+random(50)+50;
               y:=random(400);
               if c mod 2=0 then lineto(x,400-y)
                        else lineto(x,400+y);
           end;
           delay(100);
     until false;
end.
