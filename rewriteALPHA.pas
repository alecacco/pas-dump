program rewritetxt;
uses crt;
var i,k:integer;
    attpercorso,percorso:string;
    giuseppe:text;
begin
     clrscr;
     writeln;
     writeln('This program will create a usable file for painting with ''Paint Your Life''.');
     writeln('Just type here where you want to put it :)');
     writeln;
     writeln('Remember, you have to be polite with me!');
     writeln;
     readln(percorso);
     for k:=48 to 57 do
     begin
     attpercorso:=percorso+chr(k);
     assign(giuseppe,attpercorso+'.pyl');
     rewrite(giuseppe);
     for i:=1 to 80*24 do writeln(giuseppe,'7');
     for i:=1 to 80*24 do writeln(giuseppe,'0');
     for i:=1 to 80*24 do writeln(giuseppe,' ');
     writeln(giuseppe,'7');
     close(giuseppe);
     end;
     writeln;
     writeln(percorso,' is ready to be painted!');
     writeln;
     write('Do you have something to say me?');
     i:=1;
     writeln;
(*     repeat
           if i=2 then writeln('what have you to say to people that do something for you? -.-''''');
           i:=i+1;
           readln(percorso);
     until (percorso='thank you')or(percorso='thanks');
     writeln;
     write('you''re welcome');
     if i=2 then write(' :)');
     if (i>2)and(i<5) then write(' u.u');
     if i>5 then write(' -.-''''');        *)
     delay(1000);
end.
