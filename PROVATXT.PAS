Program provatesto;
uses crt;
var testo: text;
    records:array[1..10]of integer;
    j:integer;
begin
     assign(testo,'E:\pas\testo.txt');
     reset(testo);
     for j:=1 to 10 do readln(testo,records[j]);
     records[3]:=50;
     rewrite(testo);
     for j:=1 to 10 do writeln(testo,records[j]);
     close(testo);
     repeat until keypressed;
end.
