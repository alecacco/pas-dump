program screensaver7;
uses crt,graph;
var driver,modo:smallint;
    yd,ys,b:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     yd:=0;
     ys:=0;
     b:=0;
     repeat
           case b of
           0:
           begin
                yd:=yd+10;
                if(yd=740) then b:=1;
           end;
           1:
           begin
                ys:=ys+10;
                if (ys=740) then b:=2;
           end;
           2:
           begin
                yd:=yd-10;
                if yd=0 then b:=3;
           end;
           3:
           begin
                ys:=ys-10;
                if (ys=0) then
                   begin
                        b:=0;
                        cleardevice;
                   end;
           end;
           end;
           setcolor(random(15)+1);
           line(1,ys,1280,yd);
     until false;
end.
