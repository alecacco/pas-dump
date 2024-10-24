program screen5;
uses graph,crt;
var driver,modo:smallint;
    l,a,b:integer;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     l:=0;
     a:=50;
     b:=0;
     repeat
           case b of
           0:
           begin
                l:=l+40;
                if(l=640) then b:=1;
           end;
           1:
           begin
                a:=a+40;
                if (a=370) then b:=2;
           end;
           2:
           begin
                l:=l-40;
                if l=40 then b:=3;
           end;
           3:
           begin
                a:=a-40;
                if (a=50) then
                   begin
                        b:=0;
                        cleardevice;
                   end;
           end;
           end;
           setcolor(random(15)+1);
           ellipse(640,400,0,360,l,a);
     until false;
end.
