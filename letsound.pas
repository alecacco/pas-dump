program mpbeep;
uses crt,windows;
var notes,time:array[1..1000]of integer;
    i,k,t:integer;
    c:char;

procedure resetall;
begin
     for i:=1 to 1000 do
         begin
              time[i]:=0;
              notes[i]:=0;
         end;
end;

procedure savve;
var
   source:text;
   percorso:string;
begin
     writeln('inserisci il percorso del file');
     percorso:='F:\pas\provasuono.mpb';
     assign(source,percorso);
     rewrite(source);
     for i:=1 to 1000 do
         begin
              writeln(source,notes[i]);
              writeln(source,time[i]);
              if time[i+1]=0 then break;
         end;
     close(source);
end;


procedure play;
begin
clrscr;
for i:=1 to 1000 do
    begin
    writeln(notes[i],', ',time[i]);
    beep(notes[i],time[i]);
    if notes[i+1]=0 then break;
    end;
end;


procedure load;
var
   source:text;
   percorso:string;
begin
     writeln('inserisci il percorso del file');
     readln(percorso);
     assign(source,percorso);
     reset(source);
     for i:=1 to 1000 do
         begin
              readln(source,notes[i]);
              readln(source,time[i]);
              if eof(source) then break;
         end;
     close(source);
end;


procedure compose;
var nota,tempo:integer;
begin
clrscr;
(*repeat
      k:=k+1;
      write('nota ',k,': ');
      read(i);
      beep (i,100);
      if i<>0 then
         begin
           write('tempo ',k,': ');
           read(t);
         end;
      if (t<>-1)and(t<>0) then
         begin
           notes[k]:=i;
           time[k]:=t;
         end;
      if t=0 then
         begin
           k:=k-1;
           writeln('   deleted');
         end;
until false;  *)
i:=0;
repeat
      i:=i+1;
      write('note',i,': ');
      readln(nota);
      write('time',i,': ');
      readln(tempo);
      if note

until i=1000;
clrscr;
writeln('do you want to play composition?');
c:=readkey;
if c='s' then play;
clrscr;
writeln('do you want to save composition?');
c:=readkey;
if c='s' then savve;
end;

begin
     repeat
           resetall;
           clrscr;
           writeln('mpbeep');
           writeln('press ''c'' to compose, ''o'' to open an existing .mpb file, ''q'' to exit program');
           c:=readkey;
           case c of
                'c':compose;
                'o':
                    begin
                         load;
                         play;
                    end;
           end;
     until c='q';
end.
