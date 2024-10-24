{legge n numeri, li memorizza in un vettore e ribalta il contenuto del vettore in un altro vettore; stampare tutti e 2}
program ribalto_vettore;
uses crt;
const dimensione=5;
var vettore1,vettore2:array[1..dimensione]of integer;
    i:integer;
begin
for i:=1 to dimensione do
    begin
           write('inserisci il ',i,'o numero: ');
           readln(vettore1[i]);
           vettore2[dimensione+1-i]:=vettore1[i];
    end;
for i:=1 to 3 do
    begin
         clrscr;
         gotoxy(40,12);
         write(4-i);
         delay(1000);
    end;
clrscr;
gotoxy(3,9);
write('vettore originale:');
gotoxy(3,16);
write('vettore ribaltato:');
for i:=1 to dimensione do
    begin
         gotoxy(21+(i*3),9);
         write(vettore1[i]);
         delay(250);
         gotoxy(21+(i*3),16);
         write(vettore2[i]);
         delay(250);
    end;
gotoxy((dimensione*3)+25,12);
write(':)');
readln;
end.
