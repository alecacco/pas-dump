program natale_8;
uses crt;
const N=3;
      C=7;
var mat:array[1..C,1..N] of integer;
    i,j:integer;

procedure inputt;
begin
     for i:=1 to N do
         for j:=1 to C do
             begin
                  write('riga ',i,',colonna ',j,',:');
                  readln(mat[i,j]);
             end;
end;


procedure randomm;
begin
     for i:=1 to N do
         for j:=1 to C do
             mat[j,i]:=random(10)+1;
end;


procedure ask;
begin
     clrscr;
     write('1 per randomizzare, 2 per inserire manualmente i dati:');
     repeat
           readln(i);
     until (i=1)or(i=2);
     if i=2 then inputt
            else randomm;
end;

procedure wwrite(b:boolean);
begin
     writeln;
     writeln;
     for i:=1 to C do
         for j:=1 to N do
             begin
                  if b=false then gotoxy(j*3,(i*2)+1)
                             else gotoxy(j*3,(i*2)+17);
                  write(mat[i,j]);
             end;
     writeln;
end;

procedure modify;
var num:integer;
begin
     writeln;
     write ('moltiplica tutto per: ');
     readln(num);
     for i:=1 to N do
         for j:=1 to C do
             mat[i,j]:=mat[i,j]*num;
end;

procedure keepopen;
begin
     repeat until keypressed;
end;

begin
         randomize;
         ask;
         wwrite(false);
         modify;
         wwrite(true);
         keepopen;
end.
