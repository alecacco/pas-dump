program screen3;
uses graph,crt;
var driver,modo:smallint;
    c,x,y,r:integer;
    b:boolean;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     r:=0;
     b:=false;
     c:=0;
     repeat
           c:=c+1;
           if c mod 12 =0 then cleardevice;
           y:=random(800);
           for x:=1 to 180 do
             begin
               if b then r:=r-1
                    else r:=r+1;
               if r=200 then b:=true;
               if r=1 then b:= false;
               setcolor(random(15)+1);
               circle(x*10,y,r);
             end;

     until false;
end.
