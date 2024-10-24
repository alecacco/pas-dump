program spaceinvaders;
uses crt;

type
    monster=record
       life:boolean;
       x,y,exx,exy,col:integer;
    end;

    bullet=record
       x,y,exy,v:integer;
       life:boolean;
    end;

var t,i,j,l,points,lifes:integer;
    dir:boolean;
    bul:array[0..10]of bullet;
    mon:array[1..9,1..4]of monster;
    up,me:monster;
    c:char;

procedure title;
begin
     textbackground(0);
     clrscr;
end;

procedure init;
begin
     points:=0;
     lifes:=3;
     with me do
          begin
               y:=57;
               x:=10;
               exx:=x;
               exy:=y;
               life:=true;
               col:=red;
          end;
     for i:=1 to 9 do
       for j:=1 to 4 do
         with mon[i,j] do
              begin
                   life:=true;
                   y:=(j*5);
                   x:=i*14;
                   exx:=x;
                   exy:=y;
                   col:=random(7)+1;
              end;
     dir:=true;
     for i:=0 to 10 do
         bul[i].life:=false;
end;

procedure remember;
begin
     for i:=1 to 9 do
       for j:=1 to 4 do
         with mon[i,j] do
            if life then
              begin
                   exx:=x;
                   exy:=y;
              end;
     for i:=0 to 10 do
         with bul[i] do
            if life then exy:=y;
end;

function monvel:integer;
begin
     monvel:=0;
     for i:=1 to 9 do
         for j:=1 to 4 do
             if mon[i,j].life then monvel:=monvel+1;
     monvel:=monvel*300;
     //monvel:=1; //X DEBUG: modalità accelerata per lo studio del movimento dei mostri
end;

procedure killdel(m1,m2:integer);
begin
     textbackground(0);
     with mon[m1,m2] do
        for i:=0 to 3 do
          begin
               gotoxy(x,y+i);
               if not dir then gotoxy(x-1,y+i);
               write('       ');
          end;
end;

procedure moveleft;
begin
     with me do
          if x>3 then x:=x-1;
end;

procedure moveright;
begin
     with me do
          if x<150 then x:=x+1;
end;


procedure writeme;
begin
   with me do
    begin
        textbackground(0);
        gotoxy(x-1,y);
        if x>1 then write(' ');
        textbackground(2);
        write('     ');
        textbackground(0);
        write(' ');
        gotoxy(1,1);
        gotoxy(x+1,y-1);
        write(' ');
        textbackground(2);
        write(' ');
        textbackground(0);
        write(' ');
    end;
end;

procedure forceddel;
begin
     for j:=1 to 9 do
         for l:=1 to 4 do
            if mon[j,l].life then
             killdel(j,l);
     writeme;
end;

procedure mondirmod;     //achronim of MONsters DIRection MODifier
begin
     i:=0;
     repeat
         i:=i+1;
         j:=0;                               //identificare l'estremità sinistra del gruppo mostri
         repeat
           j:=j+1;
         until (mon[i,j].life)or(j=5);
     until mon[i,j].life;
     if (mon[i,j].x=1) then
        begin
             dir:=not dir;
             forceddel;
             gotoxy(1,1);
        end;
     i:=10;
     repeat
         i:=i-1;
         j:=0;                               //identificare l'esrtemità destra del gruppo mostri
         repeat
           j:=j+1;
         until (mon[i,j].life)or(j=5);
     until mon[i,j].life;
     if (mon[i,j].x=150) then
        begin
             dir:=not dir;
             forceddel;
             gotoxy(1,1);
        end;
end;

procedure delmonster(xx,yy:integer);
begin
     textbackground(0);
     for l:=0 to 4 do
         begin
              if dir then gotoxy(xx-1,yy+l)
                     else gotoxy(xx+5,yy+l);
              write(' ');
         end;
end;

procedure writemonsters;
begin
     for i:=1 to 9 do
       for j:=1 to 4 do
         with mon[i,j] do
           if life then
              if exx<>x then
                 begin
                      delmonster(x,y);
//                      textbackground(col);
//                      textcolor(0);
                      textbackground(0);
                      textcolor(col+7);
                      gotoxy(x,y);   write('\/=\/');
                      gotoxy(x,y+1); write(chr(179),'0=0',chr(179));
                      gotoxy(x,y+2); write(' \I/ ');
                      gotoxy(x,y+3); write('/\!/\');
//                      write(chr(186),chr(186),chr(186),chr(186),chr(186));
                 end;
end;

function nobulsonmons(xx,yy:integer):boolean; //NO BULlets ON MONsterS
begin
     nobulsonmons:=true;
     for j:=1 to 9 do
         for l:=1 to 4 do
             with mon[j,l]do
                if life then
                  if (yy>=y)and(xx>=x)and(xx<=x+4)and(yy<=y+3) then nobulsonmons:=false;
end;

procedure writebuls;
begin
     for i:=0 to 10 do
       with bul[i] do
        if life then
           if (exy<>y) then
               begin
                    if (nobulsonmons(x,y)) then
                       begin
                            gotoxy(x,y);
                            textbackground(0);
                            if i=0 then
                                       begin
                                            textcolor(12);
                                            write('°');
                                       end
                                   else
                                       begin
                                            textcolor(yellow);
                                            write('|');
                                       end;
                       end;
                    if (nobulsonmons(x,exy)) then
                       begin
                            gotoxy(x,exy);
                            textbackground(0);
                            write(' ');
                       end;
               end;
end;

procedure writepoints;
begin
     gotoxy(75,58);
     textbackground(0);
     textcolor(yellow);
     write('Points: ',points,'     ');
end;

procedure writelifes;
begin
     gotoxy(30,58);
     textbackground(0);
     textcolor(lightgreen);
     write('lifes: ',lifes,'     ');
end;

procedure writeup;
begin
     with up do
        if not life then
          begin
               y:=3;
               x:=2;
               exx:=x;
               exy:=y;
               life:=true;
               col:=red;
          end;
   with up do
     if exx<>x then
      begin
        exx:=x;
        textbackground(0);
        gotoxy(x-1,y);
        if x>1 then write(' ');
        textbackground(blue);
        write('     ');
        textbackground(0);
        write(' ');
        gotoxy(1,1);
        gotoxy(x+1,y-1);
        write(' ');
        textbackground(blue);
        write(' ');
        textbackground(0);
        write(' ');
      end;
      if up.x=150 then
         with up do
           begin
                life:=false;
                gotoxy(x,y);
                textbackground(0);
                write('      ');
                gotoxy(x,y-1);
                write('      ');
           end;
end;

procedure move;
var b:boolean;
begin
     if t mod monvel=0 then
       for i:=1 to 9 do
         for j:=1 to 4 do
           with mon[i,j] do
               if life then
                  if dir then x:=x+1
                         else x:=x-1;
     if t mod 1000=0 then
        if up.life then up.x:=up.x+1;
     b:=dir;
     mondirmod;
     if dir<>b then
     for i:=1 to 9 do
       for j:=1 to 4 do
           with mon[i,j] do
                begin
                     y:=y+5;
                     if dir then x:=x+1
                            else x:=x-1;
                end;
     if bul[0].life and (t mod 500=0) then bul[0].y:=bul[0].y-1;
     for i:=1 to 10 do
         if bul[i].life and (t mod 1000=0) then bul[i].y:=bul[i].y+1;
end;

procedure kill;
var pointfactor:integer;
begin
     for i:=0 to 10 do
         with bul[i] do
              if life then
                 begin
                      if (y<=1)or(y>56)then
                         begin
                              life:=false;
                              gotoxy(x,exy);
                              textbackground(0);
                              write(' ');
                         end;
                      if (i>0)and(x=bul[0].x)and(y=bul[0].y)and(bul[0].life) then
                         begin
                              life:=false;
                              bul[0].life:=false;
                              gotoxy(bul[0].x,bul[0].exy);
                              textbackground(0);
                              write(' ');
                              gotoxy(x,exy);
                              textbackground(0);
                              write(' ');
                         end;
                 end;
     pointfactor:=0;
     for i:=1 to 9 do
         for j:=1 to 4 do
             with mon[i,j] do
                  if life then pointfactor:=pointfactor+1;
     pointfactor:=(5*9)+1-pointfactor;
     for i:=1 to 9 do
         for j:=1 to 4 do
             with mon[i,j] do
                  if life and bul[0].life then
                     if (bul[0].y>=y)and(bul[0].x>=x)and(bul[0].x<=x+4)and(bul[0].y<=y+3) then
                             begin
                                  points:=points+(pointfactor*(6-j)*100);
                                  writepoints;
                                  killdel(i,j);
                                  life:=not life;
                                  bul[0].life:=false;
                                  gotoxy(bul[0].x,bul[0].exy);
                                  textbackground(0);
                                  write(' ');
                             end;
end;

function numofmons:integer;
var q,w:integer;
begin
     numofmons:=0;
     for q:=1 to 9 do
         for w:=1 to 4 do
             with mon[q,w] do
                  if life then numofmons:=numofmons+1;
end;

function numofbuls:integer;
var p:integer;
begin
     numofbuls:=0;
     for p:=1 to 10 do
         if bul[p].life then numofbuls:=numofbuls+1;
end;

procedure randombomb;
begin
if numofbuls<=(numofmons div 3) then
   begin
     repeat
           i:=random(9)+1;
           j:=random(5)+1;
     until mon[i,j].life=true;
     l:=0;
     repeat
           l:=l+1;
     until (bul[l].life=false)or(l=11);
     if l<>11 then
        with bul[l]do
             begin
                  life:=true;
                  x:=mon[i,j].x+2;
                  y:=mon[i,j].y+3
             end;
   end;
end;

procedure newbul;
begin
     if bul[0].life then
        begin
             gotoxy(bul[0].x,bul[0].y);
             textbackground(0);
             write(' ');
        end;
     bul[0].life:=true;
     bul[0].x:=me.x+2;
     bul[0].y:=55;
end;

procedure verifychoice;
begin
     c:=readkey;
     case c of
          'p':repeat
                    c:=readkey;
              until c<>'p';
          'a':moveleft;
          'd':moveright;
          ' ':newbul;
          #0:
             begin
               c:=readkey;
               case c of
                  #72:newbul;
                  #75:moveleft;
                  #77:moveright;                           //FRECCE!!!!!!!!!!! :D:D:D
               end;
             end;
     end;
end;

function win:boolean;
begin
     win:=true;
     for i:=1 to 9 do
         for j:=1 to 4 do
             with mon[i,j] do
                  if life then win:=false;
end;

procedure extra;
begin
     with bul[0]do
          if life then
             if (x>=me.x)and(y=me.y)and(x<=me.x+4) then
                 begin
                      points:=points+10000;
                      up.x:=up.x-1;
                      repeat
                            up.x:=me.x+1;
                            writeup;
                      until up.x=150;
                 end;
end;

procedure shot;
begin
     for i:=1 to 10 do
         with bul[i]do
            if life then
              if (x>=me.x)and(y=me.y)and(x<=me.x+4) then
                 begin
                      lifes:=lifes-1;
                      writelifes;
                      me.x:=me.x+1;
                      repeat
                            me.x:=me.x-1;
                            writeme;
                      until me.x=3;
                 end;
end;

function lose:boolean;
begin
     lose:=false;
     for i:=1 to 9 do
         for j:=1 to 4 do
             with mon[i,j] do
                if life then
                    if y>=me.y-5 then
                          lose:=true;
     if lifes=0  then lose:=true;
end;

procedure lastscreen;
begin
     textbackground(0);
     clrscr;
     textcolor(yellow);
     writeln('THE END.');
     writeln;
     if win then writeln('YOU WON!')
            else writeln('YOU LOST! Earth had been conquered.');
     writeln;
     points:=points*lifes;
     writeln('you scored ',points,' points.');
     writeln;
     writeln('press ''r'' key to play again, any other key to exit...');
     c:=readkey;
end;

begin
randomize;
repeat
     title;
     init;
     writepoints;
     writelifes;
//     for i:=1 to 9 do               //
//         for j:=1 to 4 do           //single monster debug mode
//             mon[i,j].life:=false;  //
//     mon[9,5].life:=true;           //
     gotoxy(1,1);
     c:='p';
     repeat
           writeme;
           repeat
                 writebuls;      //write bullets
                 remember;
                 move;
                 t:=t+1;
                 if (random(400000)=0)or(up.life) then writeup;
                 if t mod monvel*2=0 then randombomb;
                 writemonsters;
                 shot;
                 kill;               //if someone is shutted his life must turn in to FALSE
                 if c='p' then
                    begin
                         gotoxy(1,1);
                         repeat until keypressed;
                    end;
           until keypressed or win or lose;
           if win or lose then c:='q';
           if c<>'q' then verifychoice;
     until (c='q');
     lastscreen;
until c='q';
end.
