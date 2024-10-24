program grapica;
uses crt,graph;
var driver,modo:smallint;
    min,max:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     restorecrtmode;
     min:=0;
     max:=0;
     setcolor(14);
     setfillstyle(1,0);
     repeat
           if (min=0 )and (max=0 ) then
              begin
                   setfillstyle(1,14);
                   circle(640,400,400);
                   FLOODFILL(640,400,14);
                   setfillstyle(1,0);
              end;
           if max<>360 then max:=max+1;
           if max=360 then
              begin
                   min:=min+1;
                   if min=360 then
                      begin
                           max:=0;
                           min:=0;
                      end;
              end;
           PIESLICE(640,400,min,max,400);
     until keypressed;
end.
