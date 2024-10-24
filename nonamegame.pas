program TheGame;
uses crt;
var i,j,x,y,walk:integer;
    me: array[1..3,1..5,1..5] of boolean;
    c:char;
    exarea,area:array[1..80,1..25]of boolean;


// 00100
// 01110
// 10101
// 01010
// 10010

procedure setme;
begin
     for i:=1 to 5 do
         for j:=1 to 5 do
             me[2,i,j]:=false;
     me[2,3,1]:=true;
     me[2,2,2]:=true;
     me[2,3,2]:=true;
     me[2,4,2]:=true;
     me[2,1,3]:=true;
     me[2,3,3]:=true;
     me[2,5,3]:=true;
     me[2,2,4]:=true;
     me[2,4,4]:=true;
     me[2,1,5]:=true;
     me[2,4,5]:=true;
     for i:=1 to 5 do
         for j:=1 to 5 do
             me[1,i,j]:=false;
     me[1,3,1]:=true;
     me[1,2,2]:=true;
     me[1,3,2]:=true;
     me[1,4,2]:=true;
     me[1,1,3]:=true;
     me[1,3,3]:=true;
     me[1,5,3]:=true;
     me[1,2,4]:=true;
     me[1,4,4]:=true;
     me[1,1,5]:=true;
     me[1,5,5]:=true;
     for i:=1 to 5 do
         for j:=1 to 5 do
             me[3,i,j]:=false;
     me[3,3,1]:=true;
     me[3,2,2]:=true;
     me[3,3,2]:=true;
     me[3,4,2]:=true;
     me[3,1,3]:=true;
     me[3,3,3]:=true;
     me[3,5,3]:=true;
     me[3,2,4]:=true;
     me[3,4,4]:=true;
     me[3,2,5]:=true;
     me[3,4,5]:=true;
end;

procedure writeme;
begin
for i:=1 to 5 do
    for j:=1 to 5 do
        if (walk=2)or(walk=4) then area[x-1+i,y-1+j]:=me[2,i,j];
        if (walk=1)or(walk=3) then area[x-1+i,y-1+j]:=me[walk,i,j];
end;

procedure initareas;
begin
     for i:=1 to 80 do
         for j:=1 to 25 do
             begin
                  exarea[i,j]:=false;
                  area[i,j]:=false;
             end;
end;

procedure remember;
begin
     for i:=1 to 80 do
         for j:=1 to 25 do
             exarea[i,j]:=area[i,j];
     for i:=1 to 80 do
         for j:=1 to 25 do
             area[i,j]:=false;
end;

procedure refresh;
begin
     for i:=1 to 80 do
         for j:=1 to 25 do
             if exarea[i,j]<>area[i,j] then
                begin
                     gotoxy(i,j);
                     if area[i,j] then write('0')
                                  else write(' ');
                end;
     gotoxy(1,1);
     write('var walk = ',walk,'     ');
end;

procedure view;
begin
for i:=1 to 5 do
    for j:=1 to 5 do
        begin
             gotoxy(i+1,j+1);
             if me[1,i,j] then write('0');
        end;
for i:=1 to 5 do
    for j:=1 to 5 do
        begin
             gotoxy(i+7,j+1);
             if me[2,i,j] then write('0');
        end;
for i:=1 to 5 do
    for j:=1 to 5 do
        begin
             gotoxy(i+14,j+1);
             if me[3,i,j] then write('0');
        end;
end;

begin
     initareas;
     x:=9;
     y:=9;
     walk:=0;
     setme;
     repeat
           walk:=walk+1;
           view;
           if walk=5 then walk:=1;
           remember;
           (*modifiche*)
           writeme;
           (*fine modifiche*)
           refresh;
           repeat
           until keypressed;
           c:=readkey;
     until false
end.



