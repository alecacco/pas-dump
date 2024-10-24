program tabella_ascii;
uses crt;
var i,x,y,xg,yg,del:integer;
procedure orizzontale;
     begin
          gotoxy(x,y);
          for i:=1 to 20 do
          begin
               write(chr(205));
               delay(del);
          end;
     end;
procedure verticale;
     begin
          for i:=yg to yg+20 do
          begin
               gotoxy(x,i);
               write(chr(186));
               delay(del);
          end;
     end;
procedure tabella;
     begin
          x:=xg;
          y:=yg;
          orizzontale;
          verticale;
          y:=yg+10;
          orizzontale;
          y:=yg+20;
          orizzontale;
          x:=xg+10;
          y:=yg;
          verticale;
          x:=xg+20;
          verticale;
          gotoxy(xg,yg);
          write(chr(201));
          gotoxy(xg,yg+20);
          write(chr(200));
          gotoxy(xg+10,yg);
          write(chr(203));
          gotoxy(xg+20,yg);
          write(chr(187));
          gotoxy(xg+10,yg+10);
          write(chr(206));
          gotoxy(xg+10,yg+20);
          write(chr(202));
          gotoxy(xg+20,yg+10);
          write(chr(185));
          gotoxy(xg+20,yg+20);
          write(chr(188));
          gotoxy(xg,yg+10);
          write(chr(204));
     end;
begin
write('quanto delay vuoi?');
read(del);
xg:=0;
yg:=0;
repeat
xg:=xg+1;
yg:=yg+1;
tabella;
until keypressed;
end.




