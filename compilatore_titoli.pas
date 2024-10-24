program compiler;
uses crt;
var i,k,j,bk:integer;
    pixel:array[1..80]of array[1..24]of array[1..2]of integer;
    pixletter:array[1..80]of array[1..24]of char;
    bitmap:array[1..2]of text;
    percorso:array[1..2] of string;
begin
     clrscr;
     writeln('This program will create a .txt file with the pascal instructions to make a title.');
     write('type where your picture is: ');
     readln(percorso[1]);
     write('type the .txt file where you want the instructions: ');
     readln(percorso[2]);
     for i:=1 to 2 do assign(bitmap[i],percorso[i]);
     reset(bitmap[1]);
     rewrite(bitmap[2]);
     for j:=1 to 2 do
         for i:=1 to 24 do
               for k:=1 to 80 do readln(bitmap[1],pixel[k][i][j]);
     for i:=1 to 24 do
         for k:=1 to 80 do readln(bitmap[1],pixletter[k][i]);
     readln(bitmap[1],bk);
     for i:=1 to 24 do
         for k:=1 to 80  do
            if not((pixletter[k][i]=' ')and(bk=pixel[k][i][1])) then
               begin
                    writeln(bitmap[2],'gotoxy(',k,',',i,');');
                    if (i>1)and(k>1) then
                       begin
                            if pixel[k-1][i][1]<>pixel[k][i][1] then writeln(bitmap[2],'textbackground(',pixel[k][i][1],');');
                            if pixel[k-1][i][2]<>pixel[k][i][2] then writeln(bitmap[2],'textcolor(',pixel[k][i][2],');');
                       end
                       else
                       begin
                            writeln(bitmap[2],'textbackground(',pixel[k][i][1],');');
                            writeln(bitmap[2],'textcolor(',pixel[k][i][2],');');
                       end;
                    writeln(bitmap[2],'write(''',pixletter[k][i],''');');
               end;
         for i:=1 to 2 do close(bitmap[i]);
     writeln('done!');
     delay(1000);
end.



