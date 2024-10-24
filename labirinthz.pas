program labirinth;
uses crt;
var h,b,i,j,x,y,exx,exy,xf,yf:integer;
    area:array[1..100,1..100]of boolean;
    c:char;
    path:string;

procedure ask;
begin
     writeln('insert .lab file path: ');
     readln(path);
end;

procedure load;
var
   src:text;
   line:string;
begin
     assign(src,path+'.lab');
     reset(src);
     readln(src,x);
     readln(src,y);
     readln(src,xf);
     readln(src,yf);
     readln(src,b);
     readln(src,h);
     i:=0;
     repeat
           i:=i+1;
           readln(src,line);
           j:=1;
           repeat
                 if line[j]='1' then area[j,i]:=true;
                 j:=j+1;
           until line[j]='2'
     until eof(src);
     close(src);
end;

procedure writescreen;
begin
     textbackground(0);
     clrscr;
     for i:=1 to h do
         for j:=1 to b do
             begin
                  if area[j,i] then
                     begin
                          textbackground(green);
                          gotoxy(j*2-1,i*2-1);
                          write('°');
                          gotoxy(j*2,i*2);
                          write('°');
                          gotoxy(j*2-1,i*2);
                          write('°');
                          gotoxy(j*2,i*2-1);
                          write('°');
                     end
                     else
                     begin
                          textbackground(7);
                          gotoxy(j*2-1,i*2-1);
                          write(' ');
                          gotoxy(j*2,i*2);
                          write(' ');
                          gotoxy(j*2-1,i*2);
                          write(' ');
                          gotoxy(j*2,i*2-1);
                          write(' ');
                     end;
             end;
             textbackground(blue);
             gotoxy(x*2,y*2);
             write(chr(188));
             gotoxy(x*2-1,y*2-1);
             write(chr(201));
             gotoxy(x*2-1,y*2);
             write(chr(200));
             gotoxy(x*2,y*2-1);
             write(chr(187));
             textbackground(red);
             gotoxy(xf*2,yf*2);
             write(chr(186));
             gotoxy(xf*2-1,yf*2-1);
             write(chr(201));
             gotoxy(xf*2-1,yf*2);
             write(chr(186));
             gotoxy(xf*2,yf*2-1);
             write(chr(187));
end;

procedure remember;
begin
     exx:=x;
     exy:=y;
end;

procedure move;
begin
     if x*2+39<b*2 then gotoxy(x*2+39,y*2)
                 else gotoxy(b*2,y*2);
     if y*2-12>0 then gotoxy(x*2,y*2-12)
               else gotoxy(x*2,1);
     if y*2+12<h*2 then gotoxy(x*2,y*2+12)
                 else gotoxy(x*2,h*2);
     if x*2-39>0 then gotoxy(x*2-39,y*2)
               else gotoxy(1,y*2);
     gotoxy(x*2,y*2);
     c:=readkey;
     case c of
          'a':x:=x-1;
          'd':x:=x+1;
          'w':y:=y-1;
          's':y:=y+1;
          #0:
             begin
               c:=readkey;
               case c of
                  #75:x:=x-1;
                  #77:x:=x+1;                           //FRECCE!!!!!!!!!!! :D:D:D
                  #80:y:=y+1;
                  #72:y:=y-1;
               end;
             end;
     end;
     if (area[x,y])or(x<=0)or(x>b)or(y<=0)or(y>h) then
        begin
             x:=exx;
             y:=exy;
        end;
     gotoxy(exx*2,exy*2);
     textbackground(7);
     write(' ');
     gotoxy(exx*2-1,exy*2);
     write(' ');
     gotoxy(exx*2-1,exy*2-1);
     write(' ');
     gotoxy(exx*2,exy*2-1);
     write(' ');
     textbackground(blue);
     gotoxy(x*2,y*2);
     write(chr(188));
     gotoxy(x*2-1,y*2-1);
     write(chr(201));
     gotoxy(x*2-1,y*2);
     write(chr(200));
     gotoxy(x*2,y*2-1);
     write(chr(187));
end;

function arrive:boolean;
begin
     arrive:=false;
     if (x=xf)and (y=yf) then arrive:=true;
end;

procedure bye;
begin
     clrscr;
     if (x=xf)and(y=yf) then writeln('HAI VINTO!')
                        else writeln('HAI PERSO');
     repeat until keypressed;
end;

begin
   ask;
   repeat
     load;
     writescreen;
     repeat
           remember;
           move;
     until (arrive)or(c='q')or(c='r');
   until (c='q')or arrive;
     bye;
end.
