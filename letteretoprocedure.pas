program procedurelettere;
uses crt;
var da,a:text;
    riga:string;
    i:integer;
begin
assign(a,'f:\pas\lettere.txt');
rewrite(a);
for i:=65 to 90 do
    begin
    writeln(a,'procedure let_'+chr(i)+' (x,y:integer);');
    writeln(a,'begin');
    assign(da,'f:\pas\draws\'+chr(i)+'.txt');
    reset(da);
    riga:='nothing';
    while riga<>'' do
          begin
               readln(da,riga);
               writeln(a,riga);
          end;
    close(da);
    writeln(a,'end;');
    end;
    writeln('press any key if you are a genius...');
repeat until keypressed;
end.

