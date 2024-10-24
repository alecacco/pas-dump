program PASteroids;
uses crt;

type
    elements = record
       exlev,lev,col,x,y,exx,exy,vx,vy,dir,exdir:integer;
    end;

var ast:array[1..16]of elements;
    me:elements;
    bullet:elements;
    c:char;
    p,q,i,j,l,mom,exmom,t:integer;
    shuttle:array[1..16,1..5,1..5,0..2]of boolean;  //disegni degli shuttle nelle 16 posizioni
    asters:array[1..3,1..15,1..15]of boolean; //disegni dei 3 tipi ti asteroidi
    path:string;
    source:text;
    exarea,area:array[2..155,2..85]of integer;

procedure _mirror(whitch1,whitch2:integer);
begin
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,0]:=false;
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,7-j,0]:=shuttle[whitch1,i,j,0];
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,1]:=false;
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,7-j,1]:=shuttle[whitch1,i,j,1];
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,2]:=false;
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,7-j,2]:=shuttle[whitch1,i,j,2];
end;

procedure Imirror(whitch1,whitch2:integer);
begin
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,0]:=false;
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,7-i,j,0]:=shuttle[whitch1,i,j,0];
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,1]:=false;
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,7-i,j,1]:=shuttle[whitch1,i,j,1];
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,2]:=false;
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,7-i,j,2]:=shuttle[whitch1,i,j,2];
end;

procedure rotateright(whitch1,whitch2:integer);
begin
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,0]:=false;
     for i:=1 to 5 do
         for j:=1 to 6 do
             shuttle[whitch2,i,j,0]:=shuttle[whitch1,j,i,0];
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,1]:=false;
     for i:=1 to 5 do
         for j:=1 to 6 do
             shuttle[whitch2,i,j,1]:=shuttle[whitch1,j,i,1];
     for i:=1 to 5 do
         for j:=1 to 5 do
             shuttle[whitch2,i,j,2]:=false;
     for i:=1 to 5 do
         for j:=1 to 6 do
             shuttle[whitch2,i,j,2]:=shuttle[whitch1,j,i,2];
end;

procedure oisread(shutorasts:boolean; whitch:integer);
var line:string;
begin
     if shutorasts then    //true=asteroids, false=shuttles
        for i:=1 to 15 do
            begin
                 readln(source,line);
                 for j:=1 to 15 do
                     if line[j]='1' then asters[whitch,j,i]:=true
                                    else asters[whitch,j,i]:=false;
            end
     else
        begin
             for i:=1 to 5 do
                 begin
                      readln(source,line);
                      for j:=1 to 6 do
                          if line[j]='1' then shuttle[whitch,j,i,0]:=true
                                         else shuttle[whitch,j,i,0]:=false;
                 end;
             for i:=1 to 6 do
                 begin
                      readln(source,line);
                      for j:=1 to 6 do
                          if line[j]='1' then shuttle[whitch,j,i,1]:=true
                                         else shuttle[whitch,j,i,1]:=false;
                 end;
             for i:=1 to 6 do
                 begin
                      readln(source,line);
                      for j:=1 to 6 do
                          if line[j]='1' then shuttle[whitch,j,i,2]:=true
                                         else shuttle[whitch,j,i,2]:=false;
                 end;
        end;
end;

procedure loadshuttles;
begin
//     write('object folder: ');
//     readln(path);
     path:='f:\pas\pacois\';
     assign(source,path+'left.ois');
     reset(source);
     oisread(false,1);
     close(source);
     textcolor(0);
     textbackground(7);
     Imirror(1,9);
     rotateright(1,5);
     _mirror(5,13);
     assign(source,path+'up_left.ois');
     reset(source);
     oisread(false,3);
     close(source);
     Imirror(3,7);
     _mirror(3,15);
     Imirror(15,11);
     assign(source,path+'up_left_left.ois');
     reset(source);
     oisread(false,2);
     close(source);
     Imirror(2,8);
     _mirror(2,16);
     _mirror(8,10);
     assign(source,path+'up_up_left.ois');
     reset(source);
     oisread(false,4);
     close(source);
     Imirror(4,6);
     _mirror(4,14);
     _mirror(6,12);
end;

procedure loadasters;
begin
//     write('object folder: ');
//     readln(path);
     path:='f:\pas\pacois\';
     assign(source,path+'ast1.ois');
     reset(source);
     oisread(true,1);
     close(source);
     assign(source,path+'ast2.ois');
     reset(source);
     oisread(true,2);
     close(source);
     assign(source,path+'ast3.ois');
     reset(source);
     oisread(true,3);
     close(source);
end;

procedure title;
begin    //ci disegnerò un titolo con PYL 2.0
end;

procedure difficultychoice;
begin                    //scelta del numero di asteroidi iniziali
end;

procedure writeborders;
begin
     textbackground(blue);
     for i:=1 to 156 do
         begin
              gotoxy(i,1);
              write(' ');
              gotoxy(i,86);
              write(' ');
         end;
     for i:=1 to 85 do
         begin
              gotoxy(1,i);
              write(' ');
              gotoxy(156,i);
              write(' ');
         end;
end;

procedure init;
begin
     mom:=0;
     with me do
           begin
              x:=82;
              lev:=3;
              y:=41;
              dir:=2;
              vx:=0;
              vy:=0;
           end;
     bullet.lev:=0;
     textbackground(0);
     clrscr;
     for i:=1 to 16 do ast[i].lev:=0;
     for i:=1 to 4 do
         with ast[i] do
           begin
              col:=random(7)+1;
              lev:=3;
              if random(2)=0 then x:=random(50)+1
                             else x:=random(50)+100;
              if random(2)=0 then y:=random(20)+1
                             else y:=random(20)+45;
              if random(2)=0 then vx:=-(random(9)+90)
                             else vx:=(random(9)+90);
              if random(2)=0 then vy:=-(random(9)+90)
                             else vy:=(random(9)+90);
           end;
     for i:=2 to 155 do
         for j:=2 to 85 do
             area[i,j]:=0;
     for l:=1 to 16 do
         with ast[l] do
          if lev<>0 then
             for i:=x to x+14 do
                 for j:=y to y+14 do
                    if asters[3,i-x+1,j-y+1] then
                       area[i,j]:=col;
     writeborders;
end;

procedure remember;
begin
     with me do
          begin
               exx:=x;
               exy:=y;
               exdir:=dir;
               exlev:=lev;
          end;
     with bullet do
       if lev>0 then
          begin
               exx:=x;
               exy:=y;
          end;
     for i:=1 to 16 do
       with ast[i] do
         begin
              exlev:=lev;
              exx:=x;
              exy:=y;
         end;
     for i:=2 to 155 do
         for j:=2 to 85 do
             exarea[i,j]:=area[i,j];
end;

procedure writescreen;
begin
     with bullet do
        if lev>0 then
          if (exx<>x)or(exy<>y)or(exdir<>dir) then area[x,y]:=6;
     with me do
          if (exx<>x)or(exy<>y)or(exdir<>dir)or(exmom<>mom) then
             for i:=x to x+4 do
                 for j:=y to y+4 do
                     if shuttle[dir,i-x+1,j-y+1,mom] then
                        begin
                             p:=i;
                             q:=j;
                             if p>155 then p:=1+(p-155);
                             if q>85 then q:=1+(q-85);
                             if p<2 then p:=154+p;
                             if q<2 then q:=84+q;
                             area[p,q]:=6;
                        end;
     for l:=1 to 16 do
         with ast[l] do
          if lev<>0 then
          if (exx<>x)or(exy<>y)or(exlev<>lev) then
             for i:=x to x+14 do
                 for j:=y to y+14 do
                     if (asters[lev,i-x+1,j-y+1]) then
                        begin
                             p:=i;
                             q:=j;
                             if p>155 then p:=1+(p-155);
                             if q>85 then q:=1+(q-85);
                             if p<2 then p:=154+p;
                             if q<2 then q:=84+q;
                             area[p,q]:=col;
                        end;
     for i:=2 to 155 do
         for j:=2 to 85 do
             if exarea[i,j]<>area[i,j] then
                begin
                     textbackground(area[i,j]);
                     gotoxy(i,j);
                     write(' ');
                end;
end;

procedure deletescreen;
begin
     with me do
          if (exx<>x)or(exy<>y)or(exdir<>dir) then
             for i:=exx to exx+4 do
                 for j:=exy to exy+4 do
                     if shuttle[exdir,i-exx+1,j-exy+1,exmom] then
                        begin
                             p:=i;
                             q:=j;
                             if p>155 then p:=1+(p-155);
                             if q>85 then q:=1+(q-85);
                             if p<2 then p:=154+p;
                             if q<2 then q:=84+q;
                             area[p,q]:=0;
                        end;
     with bullet do
        if lev>0 then
          if (exx<>x)or(exy<>y) then area[exx,exy]:=0;
     for l:=1 to 16 do
         with ast[l] do
          if exlev<>0 then
          if (exx<>x)or(exy<>y)or(exlev<>lev) then
             for i:=exx to exx+14 do
                 for j:=exy to exy+14 do
                    if (asters[exlev,i-exx+1,j-exy+1]) then
                       begin
                            p:=i;
                            q:=j;
                            if p>155 then p:=1+(p-155);
                            if q>85 then q:=1+(q-85);
                            if p<2 then p:=154+p;
                            if q<2 then q:=84+q;
                            if area[p,q]=col then area[p,q]:=0;
                       end;
end;

procedure move;
begin
     if t mod 30=0 then mom:=mom+1;
     if mom=3 then mom:=0;
     with me do
          begin
               if (t mod (400-abs(vx))=0)and(abs(vx)>20) then
                  if vx<0 then x:=x-1
                          else x:=x+1;
               if (t mod (400-abs(vy))=0)and(abs(vy)>20) then
                  if vy<0 then y:=y-1
                          else y:=y+1;
               if x<2 then x:=155;
               if x>155 then x:=2;
               if y<2 then y:=85;
               if y>85 then y:=2;
          end;
     with bullet do
       if lev>0 then
          begin
               if (t mod (400-abs(vx))=0)and(vx<>0) then
                  if vx<0 then x:=x-1
                          else x:=x+1;
               if (t mod (400-abs(vy))=0)and(vy<>0) then
                  if vy<0 then y:=y-1
                          else y:=y+1;
               lev:=lev+1;
               if x<2 then x:=155;
               if x>155 then x:=2;
               if y<2 then y:=85;
               if y>85 then y:=2;
               if lev=1000 then
                  begin
                       lev:=0;
                       area[x,y]:=0;
                  end;
          end;
     for i:=1 to 16 do
       with ast[i] do
         if lev>0 then
          begin
               if (t mod ((200*lev)-abs(vx))=0) then
                  if vx<0 then x:=x-1
                          else x:=x+1;
               if (t mod ((200*lev)-abs(vy))=0) then
                  if vy<0 then y:=y-1
                          else y:=y+1;
               if x<2 then x:=155;
               if x>155 then x:=2;
               if y<2 then y:=85;
               if y>85 then y:=2;
          end;
end;

procedure throttle;
begin
     with me do
          case dir of
               1:vx:=vx-40;
               5:vy:=vy-40;
               9:vx:=vx+40;
               13:vy:=vy+40;
               3:
                 begin
                      vx:=vx-28;
                      vy:=vy-28;
                 end;
               7:
                 begin
                      vx:=vx+28;
                      vy:=vy-28;
                 end;
               11:
                 begin
                      vx:=vx+28;
                      vy:=vy+28;
                 end;
               15:
                 begin
                      vx:=vx-28;
                      vy:=vy+28;
                 end;
               2:
                 begin
                      vx:=vx-35;
                      vy:=vy-20;
                 end;
               4:
                 begin
                      vx:=vx-20;
                      vy:=vy-35;
                 end;
               6:
                 begin
                      vx:=vx+20;
                      vy:=vy-35;
                 end;
               8:
                 begin
                      vx:=vx+35;
                      vy:=vy-20;
                 end;
               10:
                 begin
                      vx:=vx+35;
                      vy:=vy+20;
                 end;
               12:
                 begin
                      vx:=vx+20;
                      vy:=vy+35;
                 end;
               14:
                 begin
                      vx:=vx-20;
                      vy:=vy+35;
                 end;
               16:
                 begin
                      vx:=vx-35;
                      vy:=vy+20;
                 end;
          end;
end;

function crash:integer;
begin
     crash:=0;
     for i:=me.x to me.x+4 do
         for j:=me.y to me.y+4 do
             if shuttle[me.dir,i+1-me.x,j+1-me.y,mom] then
                for l:=1 to 16 do
                    if ast[l].lev>0 then
                       for p:=ast[l].x to ast[l].x+14 do
                           for q:=ast[l].y to ast[l].y+14 do
                               if asters[ast[l].lev,p+1-ast[l].x,q+1-ast[l].y] then
                                  if (i=p)and(j=q) then crash:=l;
end;

function farfromasteroids:boolean;
begin
     farfromasteroids:=true;
     for i:=1 to 16 do
         with ast[i] do
            if lev>0 then
              if (((x>me.x-20)or(x<me.x+20))and(y>=me.y)and(y<me.y+4))or(((y>me.y-20)or(y<me.y+20))and(x>=me.x)and(x<me.x+4)) then farfromasteroids:=false;
end;

function shot:integer;
begin
     if bullet.lev>0 then
        begin
             with bullet do
                  begin
                       p:=x;
                       q:=y;
                  end;
             for l:=1 to 16 do
                 if ast[l].lev>0 then
                    with ast[l]do
                         for i:=x to x+14 do
                             for j:=y to y+14 do
                                 if asters[lev,i+1-x,j+1-y] then
                                    if (i=p)and(j=q) then shot:=l;
        end;
end;

procedure division(whitch:integer);
begin
     ast[whitch].lev:=ast[whitch].lev-1;
     if ast[whitch].lev=0 then
             for i:=ast[whitch].x to ast[whitch].x+14 do
                 for j:=ast[whitch].y to ast[whitch].y+14 do
                     if asters[1,i+1-ast[whitch].x,j+1-ast[whitch].y] then area[i,j]:=0;
     bullet.lev:=0;
     area[bullet.x,bullet.y]:=0;
     gotoxy(bullet.x,bullet.y);          //MAGIC. DO NOT TOUCH.
     textbackground(0);
     write(' ');
     l:=0;
     repeat
           l:=l+1;
     until ast[l].lev=0;
     with ast[l]do
          begin
               lev:=ast[whitch].lev;
               vx:=ast[whitch].vy;
               vy:=ast[whitch].vx;
               if random(2)=0 then vx:=-vx
                              else vy:=-vy;
               col:=random(7)+1;
               x:=ast[whitch].x;
               y:=ast[whitch].y;
          end;
     bullet.lev:=999;
end;

procedure crashtest;
begin
     if crash<>0 then
        with me do
             begin
                  exlev:=lev;
                  lev:=lev-1;
                  vx:=0;
                  vy:=0;
                  division(crash);
                  repeat
                        x:=random(150)+1;
                        y:=random(80)+1;
                  until farfromasteroids;
             end;
     if (crash=0)and(shot<>0)and(bullet.lev>0) then division(shot);
end;

procedure fire;
begin
     with bullet do
          begin
               lev:=1;
               case me.dir of
                    1:
                      begin
                           x:=me.x-1;
                           y:=me.y+2;
                           vx:=-390;
                           vy:=0;
                      end;
                    2:
                      begin
                           x:=me.x-1;
                           y:=me.y-1;
                           vx:=-390;
                           vy:=-350;
                      end;
                    3:
                      begin
                           x:=me.x-1;
                           y:=me.y-1;
                           vx:=-390;
                           vy:=-390;
                      end;
                    4:
                      begin
                           x:=me.x-1;
                           y:=me.y-1;
                           vx:=-350;
                           vy:=-390;
                      end;
                    5:
                      begin
                           x:=me.x+2;
                           y:=me.y-1;
                           vy:=-390;
                           vx:=0;
                      end;
                    6:
                      begin
                           x:=me.x+4+1;
                           y:=me.y-1;
                           vx:=350;
                           vy:=-390;
                      end;
                    7:
                      begin
                           x:=me.x+4+1;
                           y:=me.y-1;
                           vx:=390;
                           vy:=-390;
                      end;
                    8:
                      begin
                           x:=me.x+4+1;
                           y:=me.y-1;
                           vx:=390;
                           vy:=-350;
                      end;
                    9:
                      begin
                           x:=me.x+4+1;
                           y:=me.y+2;
                           vx:=390;
                           vy:=0;
                      end;
                    10:
                      begin
                           x:=me.x+4+1;
                           y:=me.y+4+1;
                           vx:=390;
                           vy:=350;
                      end;
                    11:
                      begin
                           x:=me.x+4+1;
                           y:=me.y+4+1;
                           vx:=390;
                           vy:=390;
                      end;
                    12:
                      begin
                           x:=me.x+4+1;
                           y:=me.y+4+1;
                           vx:=350;
                           vy:=390;
                      end;
                    13:
                      begin
                           x:=me.x+2;
                           y:=me.y+4+1;
                           vx:=0;
                           vy:=390;
                      end;
                    14:
                      begin
                           x:=me.x-1;
                           y:=me.y+4+1;
                           vx:=-350;
                           vy:=390;
                      end;
                    15:
                      begin
                           x:=me.x-1;
                           y:=me.y+4+1;
                           vx:=-390;
                           vy:=390;
                      end;
                    16:
                      begin
                           x:=me.x-1;
                           y:=me.y+4+1;
                           vx:=-390;
                           vy:=350;
                      end;
               end;
         end;
end;

procedure jump;
begin
     for i:=me.x to me.x+4 do
         for j:=me.x to me.y+4 do
             if shuttle[me.dir,i-me.x,j-me.y,mom] then area[i,j]:=0;
     repeat
           me.x:=random(155)+1;
           me.y:=random(85)+1;
     until farfromasteroids;
end;

procedure verifychoice;
begin
     case c of
          'a':me.dir:=me.dir-1;
          'd':me.dir:=me.dir+1;
          'w':throttle;
          's':jump;
          #0:with me do                                   //devo aggiungere il TELETRASPORTO!!;)
             begin
               c:=readkey;
               case c of
                  #75:dir:=dir-1;
                  #77:dir:=dir+1;                          //FRECCE!!!!!!!!!!! :D:D:D
                  #72:throttle;
               end;
             end;
          ' ':fire;
     end;
       with me do
          begin
               if abs(vx)<20 then vx:=0;
               if abs(vy)<20 then vy:=0;
               if vx>375 then vx:=375;
               if vy>375 then vy:=375;
               if vx<-375 then vx:=-375;
               if vy<-375 then vy:=-375;
               if dir=0 then dir:=16;
               if dir=17 then dir:=1;
          end;
end;

function died:boolean;
begin
     died:=false;
     if me.lev=0 then died:=true;
end;

function win:boolean;
begin
     win:=true;
     for i:=1 to 16 do
         if ast[i].lev>0 then win:=false;
end;

procedure timetogo;
begin
     textbackground(blue);
     textcolor(yellow);
     clrscr;
     if died then writeln('LOSER');
     if win then writeln('YOU WIN!');
     writeln;
     writeln('press q to quit, any other key to try again...');
     c:=readkey;
end;

begin
     repeat
           randomize;
           loadshuttles;
           loadasters;
           title;
           difficultychoice;
           init;
           writescreen;
           remember;
           repeat
                 repeat
                       t:=t+1;
                       crashtest;
                       deletescreen;
                       writescreen;
                       remember;
                       move;
                 until keypressed or died or win;
                 if not(died or win) then
                    begin
                         c:=readkey;
                         verifychoice;
                    end;
           until (c='q')or died or win;
           timetogo;
     until (c='q')
end.
