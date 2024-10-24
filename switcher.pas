program switch;
uses crt;
var ln,patch:string;
    line:array[1..1000]of string;
    source:text;
    i,n:integer;

procedure modify;
begin
     rewrite(source);
     for i:=1 to n do
         writeln(source,line[i]);
end;

procedure load;
begin
     writeln('patch: ');
     readln(patch);
     assign(source,patch+'.txt');
     reset(source);
     n:=0;
//     for i:=1 to 1000 do
//         line[i]:='';
     repeat
           n:=n+1;
           readln(source,ln);
           for i:=length(ln) downto 1 do
               line[n]:=line[n]+ln[i];
     until eof(source);
     modify;
     close(source);
     writeln;
     writeln('DONE! :)');
     delay(1000);
end;

begin
     load;
end.
