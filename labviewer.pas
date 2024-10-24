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
                 if line[j]='1' then area[j,i]:=true
                                else area[j,i]:=false;
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
                  gotoxy(j,i);
                  if area[j,i] then textbackground(0)
                               else textbackground(7);
                  if (j=xf)and(i=yf)then textbackground(red);
                  if (j=x)and(i=y)then textbackground(blue);
                  write(' ');
             end;
end;

procedure remember;
begin
     exx:=x;
     exy:=y;
end;

procedure move;
begin
     if x+39<b then gotoxy(x+39,y)
               else gotoxy(b,y);
     if y-12>0 then gotoxy(x,y-12)
               else gotoxy(x,1);
     if y+12<h then gotoxy(x,y+12)
               else gotoxy(x,h);
     if x-39>0 then gotoxy(x-39,y)
               else gotoxy(1,y);
     gotoxy(x,y);
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
     gotoxy(exx,exy);
     textbackground(7);
     write(' ');
     gotoxy(x,y);
     textbackground(blue);
     write(' ');
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
     c:=readkey;
     until c='q';
end.
