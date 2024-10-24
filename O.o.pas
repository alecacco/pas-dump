
unit ma_anche_pfui;

interface

type vect=array[1..20] of integer;

procedure esegui (var myres:vect);

implementation
uses wincrt;

var a,b,c:vect;
    i,j:integer;

procedure esegui(var myres:vect);
begin
randomize;

i:=1;
j:=1;

for i:=1 to 20 do
begin
a[i]:=random(50)+1;
b[i]:=random(50)+1;
end;

for i:=1 to 20 do
begin
if a[i] mod 3 = 0 then
begin
c[j]:=a[i];
j:= j+1;
end;
end;

j:=1;

for i:=1 to 20 do
begin
if b[i] mod 5 = 0 then
begin
c[j]:= c[j]*b[i];
j:=j+1
end;
end;

myres:=c;
end;

end.
