program pariedispari_array;
uses crt;
const max=5;
var v:array[1..3]of array[1..max]of integer;
    i,p,d:integer;
begin
     for i:=1 to max do
         begin
              write('inserisci il ',i,'o numero: ');
              readln(v[1][i]);
         end;
     p:=0;
     d:=0;
     for i:=1 to max do if v[1][i]mod 2=0 then
                                             begin
                                                  p:=p+1;
                                                  v[2][p]:=v[1][i];
                                             end
                                         else
                                             begin
                                                  d:=d+1;
                                                  v[3][d]:=v[1][i];
                                             end;
     clrscr;
     write('numeri inseriti: ');
     for i:=1 to max do write(v[1][i],', ');
     writeln;
     write('numeri dispari: ');
     for i:=1 to d do write(v[3][i],', ');
     writeln;
     write('numeri pari: ');
     for i:=1 to p do write(v[2][i],', ');
     repeat until keypressed;
end.
