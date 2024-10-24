program mat;
uses crt;
var m:array[1..10,1..10]of integer;
    i,j:integer;
    media:real;

procedure randomm;
begin
     for i:=1 to 10 do
         for j:=1 to 10 do
             m[i,j]:=random(100);
end;

procedure medida;
begin
     for i:=1 to 10 do
         for j:=1 to 10 do
             media:=media+m[i,j];
     media:=media/100;
     writeln('la media e'':',media:4:2);
end;

procedure writemat(p:boolean);
begin
     for i:=1 to 10 do
         begin
              for j:=1 to 10 do
                  begin
                       if p=true then
                          begin
                             if m[i,j]<media then textcolor(green);
                             if m[i,j]>=media then textcolor(red);
                          end;
                       write(m[i,j],' ');
                  end;
              writeln;
         end;
writeln;
end;
begin
randomm;
writemat(false);
medida;
writemat(true);
repeat until keypressed;
end.
