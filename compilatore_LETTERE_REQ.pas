program compiler;
uses crt;
var i,q,k,j,bk:integer;
    c:char;
    pixel:array[1..80]of array[1..24]of array[1..2]of integer;
    pixletter:array[1..80]of array[1..24]of char;
    bitmap:array[1..2]of text;
    attpercorso,percorso:array[1..2] of string;
begin
     clrscr;
     writeln('dovo sono i .pyl?');
     readln(percorso[1]);
     writeln('dove li vuoi trasformare in istruzioni?');
     readln(percorso[2]);
   repeat
   writeln('lettera?');
   readln(c);
   q:=ord(c);
   begin
     attpercorso[1]:=percorso[1]+'\'+chr(q)+'.pyl';
     attpercorso[2]:=percorso[2]+'\'+chr(q)+'.txt';
     for i:=1 to 2 do assign(bitmap[i],attpercorso[i]);
     reset(bitmap[1]);
     rewrite(bitmap[2]);
     for i:=1 to 24 do
         for k:=1 to 80 do readln(bitmap[1],pixel[k][i][1]);
     writeln(bitmap[2],'textbackground(0);');
     for i:=0 to 79 do
         for k:=0 to 23 do
             begin
               if pixel[i+1][k+1][1]=0 then
                 begin
                    writeln(bitmap[2],'gotoxy(',i,'+x,',k,'+y);');
                    writeln(bitmap[2],'write('' '');');
                 end;
             end;
         for i:=1 to 2 do close(bitmap[i]);
     writeln(c,' done!');
     end;
     writeln('un''altra?');
     readln(c)
     until c='0';
     delay(1000);
end.



