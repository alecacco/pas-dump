program filecopy;
uses crt;
var files:array[1..2]of text;
    line:string;
    patch:array[1..2]of string;
    i:integer;

procedure ask;
begin
for i:=1 to 2 do
     begin
          writeln('file ',i,': ');
          readln(patch[i]);
          assign(files[i],patch[i]);
          if i=1 then reset(files[i])
                 else rewrite(files[2]);
     end;
end;

procedure copy;
begin
     repeat
           readln(files[1],line);
           writeln(files[2],line);
     until EOF(files[1]);
     for i:=1 to 2 do close(files[i]);
end;

procedure done;
begin
     writeln('fatto! :)');
     delay(2000);
end;

begin
     ask;
     copy;
     done;
end.
