program compiler;
uses crt;
var i,q,k,j,bk,f,n:integer;
    pixel:array[1..80]of array[1..24]of array[1..2]of integer;
    pixletter:array[1..80]of array[1..24]of char;
    bitmap:array[1..2]of text;
    attpercorso,percorso:array[1..2] of string;
begin
     clrscr;
   for f:=1 to 3 do
   begin
     percorso[1]:='f:\pas\nuova cartella';
     percorso[2]:='f:\pas\numbers';
   case f of
        1:n:=45;
        2:n:=37;
        3:n:=29;
   end;
   for q:=48 to 57 do
   begin
     attpercorso[1]:=percorso[1]+'\'+chr(q)+'.pyl';
     attpercorso[2]:=percorso[2]+'\'+chr(q)+'_'+chr(f+48)+'.txt';
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
                    writeln(bitmap[2],'gotoxy(',i,'+',n,',51+',k,');');
                    writeln(bitmap[2],'write('' '');');
                 end;
             end;
         for i:=1 to 2 do close(bitmap[i]);
     writeln('done ',q-48,'!');
     end;
   end;
     delay(1000);
end.



