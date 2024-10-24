program screen4;
uses graph,crt;
var driver,modo:smallint;
    c:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     c:=0;
     repeat
           c:=c+1;
           if c mod 300 =0 then cleardevice;
           setcolor(random(15)+1);
           circle(random(1280)+1,random(800)+1,random(300)+1);
           delay(500);
     until false;
end.
