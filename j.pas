program snake;
uses crt;
var c:char;
var i,x,y,x1,x2,x3,x4,y1,y2,y3,y4:integer;
begin
     repeat
     window(1,1,80,25);clrscr;
     textbackground(blue);
     clrscr;
     for i:= 1 to 80 do write('*');
     for i:= 1 to 23 do writeln('*');
     for i:= 1 to 24 do begin
         gotoxy(80,i);
         write('*');
         end;
     for i:=1 to 80 do begin
         gotoxy(i,24);
         write('*');
         end;
     x:=40;
     y:=11;
     x4:=0;
     y4:=0;
     gotoxy(x,y);
     repeat
           c:=readkey;
           if (c='a')or(c='A') then repeat
              x:=x-1;
              delay(100);
              gotoxy(x,y);
              write('#');
              gotoxy(x4,y4);
              write(' ');
              x4:=x3;
              x3:=x2;
              x2:=x1;
              x1:=x;
              y4:=y3;
              y3:=y2;
              y2:=y1;
              y1:=y;
              until keypressed or(x=80)or(y=24)or(x=1)or(y=1)or((x=x4)and(y=y4))or((x=x2)and(y=y2))or((x=x3)and(y=y3));
           if (c='s')or(c='S') then repeat
              y:=y+1;
              delay(100);
              gotoxy(x,y);
              write('#');
              gotoxy(x4,y4);
              write(' ');
              x4:=x3;
              x3:=x2;
              x2:=x1;
              x1:=x;
              y4:=y3;
              y3:=y2;
              y2:=y1;
              y1:=y;
              until keypressed or(x=80)or(y=24)or(x=1)or(y=1)or((x=x4)and(y=y4))or((x=x2)and(y=y2))or((x=x3)and(y=y3));
           if (c='w')or(c='W')then repeat
              y:=y-1;
              delay(100);
              gotoxy(x,y);
              write('#');
              gotoxy(x4,y4);
              write(' ');
              x4:=x3;
              x3:=x2;
              x2:=x1;
              x1:=x;
              y4:=y3;
              y3:=y2;
              y2:=y1;
              y1:=y;
              until keypressed or(x=80)or(y=24)or(x=1)or(y=1)or((x=x4)and(y=y4))or((x=x2)and(y=y2))or((x=x3)and(y=y3));
           if (c='d')or(c='D') then repeat
              x:=x+1;
              delay(100);
              gotoxy(x,y);
              write('#');
              gotoxy(x4,y4);
              write(' ');
              x4:=x3;
              x3:=x2;
              x2:=x1;
              x1:=x;
              y4:=y3;
              y3:=y2;
              y2:=y1;
              y1:=y;
              until keypressed or(x=80)or(y=24)or(x=1)or(y=1)or((x=x4)and(y=y4))or((x=x2)and(y=y2))or((x=x3)and(y=y3));
     until (c='0')or(x=80)or(y=24)or(x=1)or(y=1)or((x=x4)and(y=y4))or((x=x2)and(y=y2))or((x=x3)and(y=y3));
     window(2,2,79,23);
     textbackground(red);
     clrscr;
     gotoxy(35,12);
     writeln('GAME OVER');
     for x:=1 to 8 do writeln;
     writeln('press ''q'' to quit, ''r'' to restart');
     repeat
     c:=readkey;
     until (c='q')or(c='r')or(c='Q')or(c='R');
     until(c='q')or(c='Q');
end.


