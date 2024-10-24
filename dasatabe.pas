program dasatabe;
uses crt;
var source:text;
    att:array[1..50]of array[1..3] of shortint;
    attname:array[1..3]of string;
    name:array[1..50]of string;
    loc:array[1..8]of array[1..50]of integer;
    cursor:array[1..8]of integer;
    i,k,data,atts,_1,_2,_3,_1_2,_2_3,_1_3,_1_2_3,_0:integer;
    percorso:string;
    c:char;
    reload:boolean;
begin
  reload:=false;
  repeat
    textcolor(lightgray);
    textbackground(black);
    clrscr;
    for i:=1 to 50 do
        begin
             for k:=1 to 3 do att[i][k]:=0;
             name[i]:='';
             attname[i]:='';
             for k:=1 to 8 do loc[k][i]:=0;
             if i<=8 then cursor[i]:=0;
        end;
    writeln('inserisci il percorso del database (l''estensione e'' aggiunta automaticamente)');
    if reload=false then readln(percorso);
    assign(source,percorso+'.dst');
    reset(source);
    readln(source,data);
    readln(source,atts);
    for i:=1 to atts do readln(source,attname[i]);
    for i:=1 to data do
        begin
             readln(source,name[i]);
             for k:=1 to atts do readln(source,att[i][k]);
             if att[i][1]=1 then
                begin
                     _1:=_1+1;
                     cursor[1]:=cursor[1]+1;loc[1][cursor[1]]:=i;
                     if att[i][2]=1 then
                        begin
                             _1_2:=_1_2+1;
                             cursor[4]:=cursor[4]+1;loc[4][cursor[4]]:=i;
                        end;
                     if att[i][3]=1 then
                        begin
                             _1_3:=_1_3+1;
                             cursor[6]:=cursor[6]+1;loc[6][cursor[6]]:=i;
                        end;
                end;
             if att[i][2]=1 then
                begin
                     _2:=_2+1;
                     cursor[2]:=cursor[2]+1;loc[2][cursor[2]]:=i;
                     if att[i][3]=1 then
                        begin
                             _2_3:=_2_3+1;
                             cursor[5]:=cursor[5]+1;loc[5][cursor[5]]:=i;
                        end;
                     if (att[i][1]=1)and(att[i][3]=1) then
                        begin
                        _1_2_3:=_1_2_3+1;
                        cursor[7]:=cursor[7]+1;loc[7][cursor[7]]:=i;
                        end;
                end;
             if att[i][3]=1 then
                begin
                     _3:=_3+1;
                     cursor[3]:=cursor[3]+1;loc[3][cursor[3]]:=i;
                end;
             if (att[i][1]=0)and(att[i][2]=0)and(att[i][3]=0) then
                begin
                     _0:=_0+1;
                     cursor[8]:=cursor[8]+1;loc[8][cursor[8]]:=i;
                end;
        end;
    close(source);
    clrscr;
    writeln(attname[1],': ',_1,' elementi');
    if cursor[1]>0 then
       begin
         for i:=1 to cursor[1] do write(name[loc[1][i]],' ');
         writeln;
       end;
    writeln;
    writeln(attname[2],': ',_2,' elementi');
    if cursor[2]>0 then
       begin
         for i:=1 to cursor[2] do write(name[loc[2][i]],' ');
         writeln;
       end;
    writeln;
    writeln(attname[3],': ',_3,' elementi');
    if cursor[3]>0 then
       begin
         for i:=1 to cursor[3] do write(name[loc[3][i]],' ');
         writeln;
       end;
    writeln;
    writeln(attname[1],' e ', attname[2],': ',_1_2,' elementi');
    if cursor[4]>0 then
       begin
         for i:=1 to cursor[4] do write(name[loc[4][i]],' ');
         writeln;
       end;
    writeln;
    writeln(attname[2],' e ',attname[3],': ',_2_3,' elementi');
    if cursor[5]>0 then
       begin
         for i:=1 to cursor[5] do write(name[loc[5][i]],' ');
         writeln;
       end;
    writeln;
    writeln(attname[1],' e ',attname[3],': ',_1_3,' elementi');
    if cursor[6]>0 then
       begin
         for i:=1 to cursor[6] do write(name[loc[6][i]],' ');
         writeln;
       end;
    writeln;
    writeln(attname[1],', ',attname[2],' e ',attname[3],': ',_1_2_3,' elementi');
    if cursor[7]>0 then
       begin
         for i:=1 to cursor[7] do write(name[loc[7][i]],' ');
         writeln;
       end;
    writeln;
    writeln('Nessun attributo: ',_0,' elementi');
    if cursor[8]>0 then
       begin
         for i:=1 to cursor[8] do write(name[loc[8][i]],' ');
         writeln;
       end;
    gotoxy(50,1);
    write('premere spazio per cofermare,');
    gotoxy(50,2);
    write('''a'' e ''d'' per scegliere');
    reload:=false;
    i:=2;
    k:=0;
    textcolor(black);
    repeat
          textbackground(lightgray);
          gotoxy(50,4); write('altro database...');
          gotoxy(70,4); write('uscita');
          gotoxy(50,6); write('ricarica');
          if i=1 then
                repeat
                      k:=k+1;
                      if k mod 1500<750 then  textbackground(yellow)
                                   else  textbackground(lightgray);
                      gotoxy(50,4);
                      write('altro database...');
                until keypressed;
          if i=2 then
                repeat
                      k:=k+1;
                      if k mod 2000<1000 then  textbackground(yellow)
                                   else  textbackground(lightgray);
                      gotoxy(70,4);
                      write('uscita');
                until keypressed;
          if i=3 then
                repeat
                      k:=k+1;
                      if k mod 2000<1000 then  textbackground(yellow)
                                   else  textbackground(lightgray);
                      gotoxy(50,6);
                      write('ricarica');
                until keypressed;
          c:=readkey;
          if c='a' then i:=i-1;
          if c='d' then i:=i+1;
          if i=0 then i:=3;
          if i=4 then i:=1;
    until c=' ';
    if i=3 then reload:=true;
  until i=2;
end.
