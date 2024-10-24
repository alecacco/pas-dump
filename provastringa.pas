program prova;
uses crt;
var line:string;

function compare(term1,term2:string; long:integer):boolean;
var p:integer;
begin
     compare:=true;
     for p:=1 to long do
         if term1[p]<>term2[p] then compare:=false;
end;
begin
     line:='prova lollo';
     if compare('prova ',line,6) then write('yes');
     repeat until keypressed;
end.

