program temperaturemanager;
uses crt;
var source:text;
    temp:array[1..2]of array[1..31] of integer;
    percorso:string;
    c,k,i,j:integer;
    com:char;

procedure load;
begin
     clrscr;
     k:=0;
     repeat
        if k=1 then writeln('file non trovato!');
        writeln('inserisci il percorso del file temperature (estensione automatica .txt)');
        readln(percorso);
        percorso:=percorso+'.txt';
        assign(source,percorso);
        {$I-}
        reset(source);
        {$I+}
        k:=1;
     until (IOResult=0);
     for i:=1 to 2 do
         for j:=1 to 31 do
             readln(source,temp[i][j]);
end;

procedure seeall;
begin
     clrscr;
     writeln('tutte le temperature:');
     writeln;
     for i:=1 to 20 do writeln('giorno ',i,': max ', temp[1][i],', min ',temp[2][i]);
     writeln('premi un tasto qualsiasi per continuare...');
     repeat until keypressed;
     for i:=21 to 31 do writeln('giorno ',i,': max ', temp[1][i],', min ',temp[2][i]);
     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     com:=readkey;
     repeat until keypressed;
     com:=readkey;
end;

procedure req(var day:integer);
begin
     clrscr;
     writeln('di che giorno vuoi i dati?');
     writeln;
     write('giorno: ');
     repeat;
     readln(day);
     until (day>=1)and(day<=31);
end;

procedure seeday;
var day:integer;
begin
     req(day);
     writeln('min:',temp[1][day],', max:',temp[2][day]);
     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     repeat until keypressed;
     com:=readkey;
end;

function esc(min,max:integer):integer;
begin
     esc:=max-min;
end;

procedure maxesc;
var massima:integer;
begin
     clrscr;
     massima:=0;
     for i:=1 to 31 do
         if massima<esc(temp[1][i],temp[2][i]) then
                                               massima:=esc(temp[1][i],temp[2][i]);
     for i:=1 to 31 do
         if massima=esc(temp[1][i],temp[2][i]) then
                                               writeln('escursione termica maggiore avvenuta il giorno ',i,', ',massima,'gradi');

     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     repeat until keypressed;
     com:=readkey;
end;

procedure minesc;
var minima:integer;
begin
     clrscr;
     minima:=esc(temp[1][1],temp[2][1]);
     for i:=2 to 31 do
         if minima>esc(temp[1][i],temp[2][i]) then
                                               minima:=esc(temp[1][i],temp[2][i]);
     for i:=1 to 31 do
         if minima=esc(temp[1][i],temp[2][i]) then
                                               writeln('escursione termica minore avvenuta il giorno ',i,', ',minima,'gradi');

     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     repeat until keypressed;
     com:=readkey;
end;

procedure dayesc;
var day:integer;
begin
     req(day);
     writeln('il giorno ',day,' c''e'' stata un escursione di ',esc(temp[1][day],temp[2][day]),' gradi');
     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     repeat until keypressed;
     com:=readkey;
end;

function media(t:array of integer):integer;
begin
     media:=0;
     for i:=0 to 30 do media:=media+t[i];
     media:=media div 31;
end;

procedure mediamax;
begin
     clrscr;
     writeln('la media delle temperature massime di questo mese e'' di ', media(temp[2]),' gradi');
     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     repeat until keypressed;
     com:=readkey;
end;

procedure mediamin;
begin
     clrscr;
     writeln('la media delle temperature minime di questo mese e'' di ', media(temp[1]),' gradi');
     writeln;
     writeln('premi un tasto qualsiasi per tornare al menu''...');
     repeat until keypressed;
     com:=readkey;
end;

procedure verifychoice;
begin
     clrscr;
     writeln('1 per visualizzare i dati');
     writeln('2 per vedere i dati di un determinato giorno');
     writeln('3 per calcolare la massima escursione');
     writeln('4 per calcolare la minima escursione');
     writeln('5 per ottenere l''escursione termica di un determinato giorno');
     writeln('6 per visualizzare la media delle temperature massime');
     writeln('7 per visualizzare la media delle temperature minime');
     writeln;
     writeln('0 per uscire');
     writeln;
     write('la tua scelta: ');
     readln(c);
     case c of
          1:seeall;
          2:seeday;
          3:maxesc;
          4:minesc;
          5:dayesc;
          6:mediamax;
          7:mediamin;
     end;
end;

begin
textbackground(blue);
clrscr;
textcolor(lightgreen);
load;
repeat
      verifychoice;
until c=0;
end.
