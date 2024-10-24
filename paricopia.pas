program filecopy;
uses crt;
var files:array[1..2]of text;
    line:integer;
    patch:array[1..2]of string;
    i:integer;

procedure ask;
begin
writeln('nel file 1 ci andranno tutti i numeri, nel file 2 solo i pari');
for i:=1 to 2 do
     begin
          writeln('file ',i,': ');
          readln(patch[i]);
          assign(files[i],patch[i]);
          rewrite(files[i]);
     end;
end;

procedure numeri;
begin
     writeln('premere un tasto qualsiasi per iniziare la generazione dei numeri nel file');
     repeat until keypressed;
     for i:=1 to 100 do
         writeln(files[1],random(100)+1);
end;

procedure copy;
begin
     reset(files[1]);
     repeat
           readln(files[1],line);
           if line mod 2 = 0 then writeln(files[2],line);
     until EOF(files[1]);
     for i:=1 to 2 do close(files[i]);
end;

procedure done;
begin
     writeln('fatto! :)');
     delay(2000);
end;

begin
     randomize;
     ask;
     numeri;
     copy;
     done;
end.
