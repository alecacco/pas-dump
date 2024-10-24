program colors;
uses crt;
var i:integer;
begin
     for i:=0 to 7 do
         begin
              //gotoxy(((i mod 8)+1)*10,(i+1)-((i mod 8)+1));
              gotoxy(1,i+1);
              textcolor(i);
              write('COLORE ',i);
         end;
     for i:=8 to 15 do
         begin
              //gotoxy(((i mod 8)+1)*10,(i+1)-((i mod 8)+1));
              gotoxy(11,i-7);
              textcolor(i);
              write('COLORE ',i);
         end;
     for i:=16 to 23 do
         begin
              //gotoxy(((i mod 8)+1)*10,(i+1)-((i mod 8)+1));
              gotoxy(22,i-15);
              textcolor(i);
              write('COLORE ',i);
         end;
     repeat until keypressed;
end.
