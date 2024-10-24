program natale_6;
uses crt;
const N=3;
      C=7;
var mat:array[1..C,1..N] of integer;
    sommarighe:array[1..C]of integer;
    sommacolonne:array[1..N]of integer;
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

function colonnaminore:integer;
begin
     colonnaminore:=1;
     for i:=2 to N do
         if sommacolonne[i]<sommacolonne[colonnaminore] then colonnaminore:=i;
end;

function rigamaggiore:integer;
begin
     rigamaggiore:=1;
     for i:=2 to C do
         if sommarighe[i]>sommarighe[rigamaggiore] then rigamaggiore:=i;
end;

procedure verifica;
begin
     for i:=1 to N do
         for j:=1 to C do
             begin
                  sommacolonne[i]:=sommacolonne[i]+mat[j,i];
                  sommarighe[j]:=sommarighe[j]+mat[j,i];
             end;
     writeln;
     writeln;
     writeln('colonna la quale somma e'' minore: ',colonnaminore);
     writeln;
     writeln('riga la quale somma e'' maggiore: ',rigamaggiore);
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
