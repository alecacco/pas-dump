program pagella;
uses crt;
const k=12;
var
   c:integer;
   voti:array[1..k]of integer;
procedure randomizzazione;
var
   i:integer;
begin
     for i:=1 to k do voti[i]:=random(10);
end;
procedure inserimento;
var
   i:integer;
begin
     for i:=1 to k do
         repeat
               write(i,': ');
               readln(voti[i]);
         until (voti[i]<=10)and(voti[i]>=0);
end;
procedure sceltainserimento;
begin
     writeln('''1'' per inserire i voti da tastiera, ''2'' per generarne di casuali');
          repeat
                readln(c);
          until (c=1)or(c=2);
     case c of
          1:inserimento;
          2:randomizzazione;
     end;
end;
procedure mostravoti;
var i:integer;
begin
     for i:=1 to k do
         write(voti[i],' ');
     writeln;
end;
function massimo:integer;
var i:integer;
begin
     massimo:=0;
     for i:=1 to k do
         if voti[i]>massimo then massimo:=voti[i];
end;
function minimo:integer;
var i:integer;
begin
     minimo:=11;
     for i:=1 to k do
         if voti[i]<minimo then minimo:=voti[i];
end;
function media:real;
var i:integer;
begin
     for i:=1 to k do
         media:=media+voti[i];
     media:=media/k;
end;
procedure sceltaMaxMinMedia;
begin
     repeat
          writeln ('''1'' per visualizzare la media, ''2'' per il massimo, ''3'' per il minimo');
          repeat
                readln(c);
          until (c=1)or(c=2)or(c=3);
          case c of
               1:writeln(media:4);
               2:writeln(massimo:4);
               3:writeln(minimo:4);
          end;
          repeat
                writeln('vuoi ripetere la scelta? (1 se si'', 0 se no)');
                readln(c);
          until (c=1)or(c=0);
     until c=0;
end;
procedure ordinamentocrescente(var to_order:array of integer);
var i,j,temp:integer;
begin
     for i:=0 to k-1 do
         for j:=i+1 to k-1 do
             if to_order[i]>to_order[j] then
                begin
                     temp:=to_order[i];
                     to_order[i]:=to_order[j];
                     to_order[j]:=temp;
                end;
end;
procedure ordinamentodecrescente(var to_order:array of integer);
var i,j,temp:integer;
begin
     for i:=0 to k-1 do
         for j:=i+1 to k-1 do
             if to_order[i]<to_order[j] then
                begin
                     temp:=to_order[i];
                     to_order[i]:=to_order[j];
                     to_order[j]:=temp;
                end;
end;
procedure sceltaordinamento;
begin
     writeln('''1'' per ordinamento crescente, ''2'' per ordinamento decrescente');
     readln(c);
     case c of
          1:ordinamentocrescente(voti);
          2:ordinamentodecrescente(voti);
     end;
end;
procedure keepopen;
begin
     repeat until keypressed;
end;
begin
sceltainserimento;
mostravoti;
sceltaMaxMinMedia;
sceltaordinamento;
mostravoti;
keepopen;
end.
