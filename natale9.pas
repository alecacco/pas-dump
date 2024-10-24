program natale_9;
uses crt;
const N=3;
      C=7;
var mat:array[1..3,1..C,1..N] of integer;
    i,j,u:integer;

procedure inputt;
begin
     for u:=1 to 2 do
       for i:=1 to C do
         for j:=1 to N do
             begin
                  write('matrice ',u,',colonna ',i,',riga ',j,',:');
                  readln(mat[u,i,j]);
             end;
     clrscr;
end;


procedure randomm;
begin
   for u:=1 to 2 do
     for i:=1 to C do
         for j:=1 to N do
             mat[u,i,j]:=random(10)+1;
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
     if b then writeln('matrice somma:');
     for i:=1 to C do
         for j:=1 to N do
             begin
                  if b=false then
                     begin
                          gotoxy(j*3,(i*2)+1);
                          write(mat[1,i,j]);
                          gotoxy((j*3)+(N*3)+4,(i*2)+1);
                          write(mat[2,i,j]);
                     end
                     else
                     begin
                          gotoxy(j*3,(i*2)+17);
                          write(mat[3,i,j]);
                     end;
             end;
end;

procedure modify;
begin
     for i:=1 to C do
         for j:=1 to N do
             mat[3,i,j]:=mat[1,i,j]+mat[2,i,j];
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
