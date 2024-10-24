program natale_1;
uses crt;
const k=10;
var i,j:integer;
    mat:array[1..k,1..k]of integer;

procedure twoinvasion;
begin
     for i:=1 to k do
         for j:=1 to k do
             mat[i,j]:=2;
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
twoinvasion;
wwrite;
keepopen;
end.
