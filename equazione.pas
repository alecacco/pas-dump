program seconddegreeequation;
uses crt;
VAR o:char;
var a,b,c:integer;
var delta,x1,x2:real;
begin
     repeat
     clrscr;
     writeln('questo programma calcola le radici di un equazione di secondo grado.');
     writeln;
     write('inserisci il coefficiente ''a'': ');
     readln(a);
     write('inserisci il coefficiente ''b'': ');
     readln(b);
     write('inserisci il coefficiente ''c'': ');
     readln(c);
     if b mod 2 =1 then
        begin
             delta:=sqr(b)-4*a*c;
             if delta>=0 then
                begin
                  x1:=(-b-sqrt(delta))/2*a;
                  x2:=(-b+sqrt(delta))/2*a;
                end;
        end
        else
        begin
             delta:=(sqr(b)div 4)-a*c;
             if delta>=0 then
                begin
                  x1:=((-b/2)-sqrt(delta))/a;
                  x2:=((-b/2)+sqrt(delta))/a;
                end;
        end;
     if delta<0 then write('il delta è minore di 0: impossibile')
     else
     begin
          writeln('x1=',x1:4:2);
          writeln('x2=',x2:4:2);
     end;
     writeln;
     writeln('vuoi uscire? (s/n)');
     repeat
     o:=readkey;
     until (o='n')or(o='s')or(o='N')or(o='S');
     until (o='s')or(o='S');
end.
