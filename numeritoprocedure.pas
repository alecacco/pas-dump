program procedurelettere;
uses crt;
var da,a:text;
    riga:string;
    i,j:integer;
begin
assign(a,'f:\pas\numeri.txt');
rewrite(a);
for j:=49 to 51 do
for i:=48 to 57 do
    begin
    writeln(a,'procedure let_'+chr(i)+'_'+chr(j)+';');
    writeln(a,'begin');
    assign(da,'f:\pas\numbers\'+chr(i)+'_'+chr(j)+'.txt');
    reset(da);
    while not eof(da) do
          begin
               readln(da,riga);
               writeln(a,riga);
          end;
    close(da);
    writeln(a,'end;');
    writeln(a);
    end;
    writeln('press any key if you are a genius...');
repeat until keypressed;
end.

