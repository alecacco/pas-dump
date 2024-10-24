program natale_2;
uses crt;
const k=3;
var i,j:integer;
    mat:array[1..k,1..k]of integer;


procedure zeroinvasion;
begin
     for i:=1 to k do
         for j:=1 to k do;
             begin
             (*if i=j then mat[i,j]:=random(99)+1    //PARCHé NO TE FUNSIONI???
                    else *)mat[i,j]:=0;
             end;
     for i:=1 to k do mat[i,i]:=random(98)+1;
end;

procedure wwrite;
begin
     for i:=1 to k do
         for j:=1 to k do
             begin
                  gotoxy(i*3,j*2);
                  write(mat[i,j]);
             end;
end;

procedure keepopen;
begin
     repeat until keypressed;
end;


begin
randomize;
zeroinvasion;
wwrite;
keepopen;
end.
