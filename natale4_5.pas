program natale_4_5;
uses crt;
const k=3;
var i,j:integer;
    mat:array[1..k,1..k]of integer;
    c:char;

procedure inputt;
begin
     for i:=1 to k do
         for j:=1 to k do
             begin
                  write('locazione ',i,',',j,',:');
                  readln(mat[i,j]);
             end;
end;


procedure randomm;
begin
     for i:=1 to k do
         for j:=1 to k do
             mat[i,j]:=random(99)+1;
end;


procedure ask(b:boolean);
begin
     clrscr;
     write('1 per randomizzare, 2 per inserire manualmente i dati');
     if b
        then
            write(': ')
        else
            write(', 0 per uscire: ');
     repeat
           readln(i);
     until (i=1)or(i=2)or(not b and(i=0));
     case i of
     1:inputt;
     2:randomm;
     end;
end;

procedure wwrite;
begin
     clrscr;
     for i:=1 to k do
         for j:=1 to k do
             begin
                  gotoxy(i*3,j*2);
                  write(mat[i,j]);
             end;
end;

procedure verifica;
var b:array[1..2]of boolean;
begin
     i:=0;
     b[1]:=false;
     b[2]:=false;
     repeat
           i:=i+1;
           j:=0;
           repeat
                 j:=j+1;
                 if (i<>j)then
                    if (mat[i,j]<>0)then b[1]:=true;
           until (j=k)or(b[1]=true);
     until (i=k)or (b[1]=true);
     i:=0;
     if b[1]=true then
        repeat
              i:=i+1;
              if mat[i,i]<>1 then b[2]:=true;
        until (i=k)or(b[2]=true);
     writeln;
     write('la matrice ');
     if b[1]=true then write('NON ');
     write('E'' diagonale');
     writeln;
     write('la matrice ');
     if b[2]=true then write('NON ');
     write('E'' unitaria');
end;

procedure keepopen;
begin
     repeat until keypressed;
     c:=readkey;
end;

begin
     randomize;
     ask(true);
         repeat
               wwrite;
               verifica;
               keepopen;
               ask(false);
         until i=0;
end.
