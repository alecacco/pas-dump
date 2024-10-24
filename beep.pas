program piano;
uses windows,crt;
var i,k,t:integer;
    memo,time:array[1..100000] of integer;
begin
k:=0;
repeat
      k:=k+1;
      write('nota ',k,': ');
      read(i);
      beep (i,100);
      if i<>0 then
         begin
           write('tempo ',k,': ');
           read(t);
         end;
      if (t<>-1)and(t<>0) then
         begin
           memo[k]:=i;
           time[k]:=t;
         end;
      if t=0 then
         begin
           k:=k-1;
           writeln('   deleted');
         end;
until i=0;
clrscr;
for i:=1 to k do
    begin
    writeln(memo[i],', ',time[i]);
    beep(memo[i],time[i]);
    end;
end.
