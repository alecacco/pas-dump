program nomiecognomi;
uses crt;
const k=12;
var nome,cognome:array[1..k]of string;
    i,j:integer;
    car:char;
procedure richiesta;
          begin
               writeln('inserisci i nomi e cognomi');
               for i:=1 to k do
                   begin
                        write('nome ',i,': ');
                        readln(nome[i]);
                        write('cognome ',i,': ');
                        readln(cognome[i]);
                   end;
          end;
procedure ordina;
var parallel:array[1..k]of string;
    c:integer;

    temp:string;
          begin
               for i:=1 to k do
                 begin
                   j:=0;
                   while cognome[i][j+1]<>'' do
                      begin
                         j:=j+1;
                         c:=64;
                         repeat
                               c:=c+1;
                               car:=chr(c);
                               if cognome[i][j]=(car) then parallel[i][j]:=c-64;
                         until cognome[i][j]=(car);
                      end;
                 end;
               for i:=1 to k-1 do
                   for j:=i+1 to k do
                     begin
                       if parallel[i]>parallel[j] then
                          begin
                               temp:=cognome[i];
                               cognome[i]:=cognome[j];
                               cognome[j]:=temp;
                               temp:=nome[i];
                               nome[i]:=nome[j];
                               nome[j]:=temp;
                          end;
                     end;
          end;
procedure visualizza;
          begin
               for i:=1 to k do
                   writeln(i,': ',cognome[i],nome[i]);
          end;
begin
richiesta;
ordina;
visualizza;
end.
