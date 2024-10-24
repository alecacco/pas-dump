(*scrivere un programma che produca il seguente effetto "caduta" di un carattere sullo schermo*)
program osvaldo;
uses crt;
(*delay(ms)*)
var colbkg,coltxt,x,y:integer;
var car:char;
begin
     writeln('inserisci il carattere da matrixare :D');
     readln(car);
     clrscr;
     coltxt:=1;
     colbkg:=1;
     repeat
           for x:=1 to 80 do
               begin
                    for y:=1 to 25 do
                        begin
                             gotoxy(x,y);
                             writeln(car);
                             textcolor(coltxt);
                             delay(1);
                             coltxt:=coltxt+1
                        end;
                    y:=1;
                    textbackground(colbkg);
                    colbkg:=colbkg+1;
               end;
     until keypressed;
end.




