//ordinamento
program order;
uses crt;
const
     k=80;
var
   v:array[1..k]of integer;
   i,j,temp:integer;
begin
     randomize;
     for i:=1 to k do
         v[i]:=random(1000);
     for i:=1 to k-1 do
         for j:=i+1 to k do
             if v[i]>v[j] then
                begin
                     temp:=v[i];
                     v[i]:=v[j];
                     v[j]:=temp;
                end;
     for i:=1 to k do writeln (v[i],'  ');
     repeat until keypressed;
end.
