program array_;
uses crt;
var v:array[1..10]of integer;
    i:integer;
    scelta:char;
begin
for i:=1 to 10 do
begin
write('inserisci il ',i,'o elemento: ');
readln(v[i]);
end;
repeat
clrscr;
write('quale elemento vuoi? ');
repeat
readln(i);
until (i<11)and(i>0);
writeln('il ',i,'o numero inserito e'' ',v[i]);
write('ne vuoi sapere un altro? ');
repeat
readln(scelta);
until (scelta='s')or(scelta='n');
until scelta='n';
end.
