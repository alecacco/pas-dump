program natale_10;
uses crt;
const N=4;
      M=5;
var mat1:array[1..N,1..M] of integer;
    mat2:array[1..M,1..N]of integer;
    mat:array[1..N,1..N]of integer;
    u,i,j:integer;

procedure inputt;
begin
     for i:=1 to N do
         for j:=1 to M do
             begin
                  write('matrice 1, colonna ',i,',riga ',j,',:');
                  readln(mat1[i,j]);
             end;
     writeln;
     for i:=1 to M do
         for j:=1 to N do
             begin
                  write('matrice 2, colonna ',i,',riga ',j,',:');
                  readln(mat2[i,j]);
             end;
     clrscr;
end;


procedure randomm;
begin
     for i:=1 to N do
         for j:=1 to M do
             mat1[i,j]:=random(10)+1;
     for i:=1 to M do
         for j:=1 to N do
             mat2[i,j]:=random(10)+1;
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


procedure modify;
begin
     for i:=1 to N do
         for j:=1 to N do
                  for u:=1 to M do
                      mat[i,j]:=mat[i,j]+(mat1[j,u]*mat2[u,j]);
end;


procedure wwrite;
begin
     writeln;
     writeln;
     for i:=1 to M do
         for j:=1 to N do
             begin
                  gotoxy((j*3)-2,(i*2)+1);
                  write(mat1[i,j]);
             end;
     for i:=1 to N do
         for j:=1 to M do
             begin
                  gotoxy((j*3)+(N*3)+2,(i*2)+1);
                  write(mat2[i,j]);
             end;
     modify;
     gotoxy(1,(M*2)+3);
     write('matrice prodotto:');
     for i:=1 to N do
         for j:=1 to N do
             begin
                  gotoxy((j*5)-4,(i*2)+(M*2)+3);
                  write(mat[i,j]);
             end;
end;

procedure keepopen;
begin
repeat until keypressed;
end;

begin
         randomize;
         ask;
         wwrite;
         keepopen;
end.
