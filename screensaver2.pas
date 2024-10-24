program screen2;
uses graph,crt;
var driver,modo:smallint;
    i:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     repeat
           setcolor(random(16));
           for i:=1 to 1280 do
               begin
                    line(i,1,i,800);
                    delay(3);
               end;
           cleardevice;
           setcolor(random(16));
           for i:=1 to 800 do
               begin
                    line(1,i,1280,i);
                    delay(3);
               end;
           cleardevice;
     until false;
end.
