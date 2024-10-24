program dasanew;
uses crt;
var source:text;
    att:array[1..50]of array[1..50] of shortint;
    attname:array[1..50]of string;
    name:array[1..50]of string;
    i,k,data,atts:integer;
    percorso:string;
    c:char;
begin
  repeat
    for i:=1 to 50 do
        begin
             for k:=1 to 50 do att[i][k]:=0;
             name[i]:='';
             attname[i]:='';
        end;
    writeln('inserisci gli attributi che caratterizzeranno i records (massimo 3 attributi)');
    writeln;
    atts:=0;
    repeat
          atts:=atts+1;
          write('nome attributo? ');
          readln(attname[atts]);
          writeln;
          writeln('vuoi aggiungerne un altro? (s/n)');
          repeat
                c:=readkey;
          until (c='s')or(c='n')or(c='S')or(c='N');
    until (c='n')or(c='N')or(atts=50);
    writeln;
    writeln('inserisci i records');
    writeln;
    data:=0;
    repeat
          data:=data+1;
          writeln;
          writeln('inserisci il record nome del record (massimo 50) e caratterizzalo (s/n)');
          readln(name[data]);
          i:=0;
          repeat
             i:=i+1;
             write(attname[i],': ');
             repeat
                readln(c);
             until (c='s')or(c='n')or(c='S')or(c='N');
             if (c='n')or(c='N') then att[data][i]:=0
                                 else att[data][i]:=1;
          until i=atts;
          writeln('vuoi aggiungere un altro record? (s/n)');
          repeat
                c:=readkey;
          until (c='s')or(c='n')or(c='S')or(c='N');

    until (c='n')or(c='N')or(i=50);
    writeln('inserisci il percorso del database da creare');
    writeln('(l''estensione sara'' aggiunta automaticamente)');
    readln(percorso);
    assign(source,percorso+'.dst');
    rewrite(source);
    writeln(source,data);
    writeln(source,atts);
    for i:=1 to atts do writeln(source,attname[i]);
    for i:=1 to data do
        begin
             writeln(source,name[i]);
             for k:=1 to atts do writeln(source,att[i][k]);
        end;
    close(source);
    writeln;
    writeln('salvataggio completato con successo!');
    delay(1500);
    writeln;
    writeln('vuoi creare un nuovo database? (s/n)');
    repeat
          c:=readkey;
    until (c='s')or(c='n')or(c='S')or(c='N');
  until (c='n')or(c='N');
end.
