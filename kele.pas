program rachele;
uses crt;
var a:string;
begin
     repeat
           readln(a);
           writeln('variabile a: ',a);
           if a='cancella' then
              if random(2)=0
                 then
                     clrscr
                 else
                     writeln('no');
     until (a='esci');
end.
