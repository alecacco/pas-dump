program natale_6;
uses crt;
const N=3;
      C=7;
var mat:array[1..C,1..N] of integer;
    materie:array[1..C]of real;
    alunni:array[1..N]of real;
    i,j:integer;

procedure inputt;
begin
     for i:=1 to N do
         for j:=1 to C do
             begin
                  write('alunno ',i,',materia ',j,',:');
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

procedure wwrite;
begin
     clrscr;
     for i:=1 to C do
         for j:=1 to N do
             begin
                  gotoxy(j*3,i*2);
                  write(mat[i,j]);
             end;
end;

procedure verifica;
begin
     for i:=1 to N do
         for j:=1 to C do
             begin
                  alunni[i]:=alunni[i]+mat[i,j];
                  materie[j]:=materie[j]+mat[i,j];
             end;
     writeln;
     writeln;
     for i:=1 to N do writeln('media materia',i,': ',(alunni[i]/C):4:2);
     writeln;
     for i:=1 to C do writeln('media alunno',i,': ',(materie[i]/N):4:2);
end;

procedure keepopen;
begin
     repeat until keypressed;
end;

begin
         randomize;
         ask;
         wwrite;
         verifica;
         keepopen;
end.
