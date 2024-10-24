program grapica;
uses crt,graph;
var driver,modo:smallint;
begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     restorecrtmode;
     repeat
           putpixel(random(1280)+1,random(800)+1,random(16));
     until keypressed;
end.
