program TheMatricoler;
uses crt;

type
     date=record
                day:integer;
                month:integer;
                year:integer;
     end;

     people=record
                code:string;
                surname:string;
                name:string;
                birthday:date;
                birthplace:string;
     end;

const
     k=2;

var
   gentaglia:array[1..k] of people;
   i:integer;

procedure load;
var source:text;
    patch:string;
begin
     writeln('type patch of source file (automatic extension)');
     readln(patch);
     patch:=patch+'.txt';
     assign(source,patch);
     reset(source);
     for i:=1 to k do
         begin
         with gentaglia[i] do
              begin
                   readln(source,code);
                   readln(source,surname);
                   readln(source,name);
                   readln(source,birthday.day);
                   readln(source,birthday.month);
                   readln(source,birthday.year);
                   readln(source,birthplace);
              end;
         readln(source);
         end;
     close(source);
end;

procedure wwrite;
begin
     for i:=1 to k do
              with gentaglia[i] do
                   begin
                        writeln('RECORD ',i,':');
                        writeln('matricola: ',code);
                        writeln('cognome: ',surname);
                        writeln('nome: ',name);
                        writeln('nato il: ',birthday.day,'/',birthday.month,'/',birthday.year,' a ', birthplace);
                   end;
     writeln;
     writeln('press any key to exit...');
end;


begin
     load;
     wwrite;
     repeat until keypressed;
end.

