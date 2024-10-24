program grapica;
uses crt,graph;
const ax=1024;
      ay=768;
var driver,modo:smallint;
    a:array[1..ax,1..ay] of boolean;
    i,j:integer;
procedure draw_a(x,y,r);
begin
     for  i:=1 to ax do
          for j:=1 to ay do
              if (sqr(i-x)+sqr(j-y))<sqr(r) then a[i,j]:=true
                                            else a[i,j]:=false;
end;
begin
     initialize;
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     repeat
           for i:=1 to 100 do
               for j:=1 to 100 do
                   if a[i,j] then
                      putpixel(i+100,j+100,10);
                      repeat until keypressed;
     until false;
//     restorecrtmode;
end.
