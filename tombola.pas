program tombola;
uses crt;
const
     k=5;
var v:array[1..k]of integer;
    i,j:integer;

function check(number:integer):boolean;
begin
     check:=false;
     for j:=1 to i-1 do if v[j]=number then check:=true;
end;

procedure randomm(var num:integer);
begin
     repeat
           num:=random(89)+1;
     until check(num)=false;
end;

procedure scrivi;
begin
clrscr;
for i:=1 to k do writeln('elemento ',i,': ',v[i]);
writeln;
writeln('premi un tasto per uscire...');
end;

begin
randomize;
for i:=1 to k do randomm(v[i]);
scrivi;
repeat until keypressed;
end.
