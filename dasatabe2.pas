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
begin
  repeat
    clrscr;
    for i:=1 to 50 do
        begin
             for k:=1 to 3 do att[i][k]:=0;
             name[i]:='';
             attname[i]:='';
             for k:=1 to 3 do loc[i][k]:=0;
             if i<=8 then cursor[i]:=0;
        end;
    writeln(i);
    readln(percorso);
    assign(source,percorso+'.dst');
    reset(source);
    readln(source,data);
    readln(source,atts);
    for i:=1 to atts do readln(attname[i]);
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
                             cursor[4]:=cursor[4]+1;loc[1][cursor[4]]:=i;
                        end;
                     if att[i][3]=1 then
                        begin
                             _1_3:=_1_3+1;
                             cursor[6]:=cursor[6]+1;loc[1][cursor[6]]:=i;
                        end;
                end;
             if att[i][2]=1 then
                begin
                     _2:=_2+1;
                     cursor[2]:=cursor[2]+1;loc[1][cursor[2]]:=i;
                     if att[i][3]=1 then
                        begin
                             _2_3:=_2_3+1;
                             cursor[5]:=cursor[5]+1;loc[1][cursor[5]]:=i;
                        end;
                     if (att[i][1]=1)and(att[i][3]=1) then
                        begin
                        _1_2_3:=_1_2_3+1;
                        cursor[7]:=cursor[7]+1;loc[1][cursor[7]]:=i;
                        end;
                end;
             if att[i][3]=1 then
                begin
                     _3:=_3+1;
                     cursor[3]:=cursor[3]+1;loc[1][cursor[3]]:=i;
                end;
             if (att[i][1]=0)and(att[i][2]=0)and(att[i][3]=0) then
                begin
                     _0:=_0+1;
                     cursor[8]:=cursor[8]+1;loc[1][cursor[8]]:=i;
                end;
        end;
    clrscr;
    writeln(attname[1],': ',_1,' elementi');
    for i:=1 to cursor[1] do write(loc[1][i],' ');
    writeln;
    writeln(attname[2],': ',_2,' elementi');
    for i:=1 to cursor[2] do write(loc[2][i],' ');
    writeln;
    writeln(attname[3],': ',_3,' elementi');
    for i:=1 to cursor[3] do write(loc[3][i],' ');
    writeln;
    writeln(attname[1],'e ', attname[2],': ',_1_2,' elementi');
    for i:=1 to cursor[4] do write(loc[4][i],' ');
    writeln;
    writeln(attname[2],'e ',attname[3],': ',_2_3,' elementi');
    for i:=1 to cursor[5] do write(loc[5][i],' ');
    writeln;
    writeln(attname[1],'e ',attname[3],': ',_1_3,' elementi');
    for i:=1 to cursor[6] do write(loc[6][i],' ');
    writeln;
    writeln(attname[1],', ',attname[2],'e ',attname[3],': ',_1_2_3,' elementi');
    for i:=1 to cursor[7] do write(loc[7][i],' ');
    writeln;
    writeln('Nessun attributo: ',_0,' elementi');
    for i:=1 to cursor[8] do write(loc[8][i],' ');
    writeln;
    writeln('premere spazio per cofermare, ''a'' e ''d'' per scegliere');
    i:=2;
    repeat
          repeat
                c:=readkey;
          until keypressed;
          if c='a' then i:=i-1;
          if c='d' then i:=i+1;
          if i=0 then i:=2;
          if i=3 then i:=1;
    until c=' ';
  until i=2;
end.
