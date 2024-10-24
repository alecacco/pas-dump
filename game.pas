program thegame;
uses crt;
var pos:array[1..24,1..80] of integer;
    x,y,i,j:integer;
begin
textbackground(white);
clrscr;
textcolor(black);
gotoxy(30,10);
write('--------------------');
gotoxy(30,14);
write('--------------------');
gotoxy(30,11);
write('/');
gotoxy(29,11);
write('|');
gotoxy(30,11);
write('\');
repeat until keypressed;
end.
