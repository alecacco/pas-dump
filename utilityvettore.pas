program CACCOvettore;
uses crt;
const j=18;
var
   sc,k,i,part:integer;
   c:char;
   commands:array[1..5] of string;
   quit:boolean;
   vet:array[1..j]of string;

procedure title;
begin
gotoxy(5,2);
textbackground(2);
write(' ');
gotoxy(6,2);
write(' ');
gotoxy(7,2);
write(' ');
gotoxy(8,2);
write(' ');
gotoxy(9,2);
write(' ');
gotoxy(15,2);
textbackground(2);
write(' ');
gotoxy(16,2);
write(' ');
gotoxy(18,2);
textbackground(2);
write(' ');
gotoxy(19,2);
write(' ');
gotoxy(20,2);
write(' ');
gotoxy(21,2);
write(' ');
gotoxy(25,2);
textbackground(2);
write(' ');
gotoxy(26,2);
write(' ');
gotoxy(28,2);
textbackground(2);
write(' ');
gotoxy(29,2);
write(' ');
gotoxy(30,2);
write(' ');
gotoxy(31,2);
write(' ');
gotoxy(35,2);
textbackground(2);
write(' ');
gotoxy(36,2);
write(' ');
gotoxy(37,2);
write(' ');
gotoxy(38,2);
write(' ');
gotoxy(39,2);
write(' ');
gotoxy(42,2);
textbackground(2);
write(' ');
gotoxy(43,2);
write(' ');
gotoxy(49,2);
textbackground(2);
write(' ');
gotoxy(50,2);
write(' ');
gotoxy(4,3);
textbackground(2);
write(' ');
gotoxy(5,3);
write(' ');
gotoxy(6,3);
write(' ');
gotoxy(7,3);
write(' ');
gotoxy(8,3);
write(' ');
gotoxy(9,3);
write(' ');
gotoxy(10,3);
write(' ');
gotoxy(15,3);
textbackground(2);
write(' ');
gotoxy(16,3);
write(' ');
gotoxy(17,3);
write(' ');
gotoxy(18,3);
write(' ');
gotoxy(19,3);
write(' ');
gotoxy(20,3);
write(' ');
gotoxy(21,3);
write(' ');
gotoxy(22,3);
write(' ');
gotoxy(25,3);
textbackground(2);
write(' ');
gotoxy(26,3);
write(' ');
gotoxy(27,3);
write(' ');
gotoxy(28,3);
write(' ');
gotoxy(29,3);
write(' ');
gotoxy(30,3);
write(' ');
gotoxy(31,3);
write(' ');
gotoxy(32,3);
write(' ');
gotoxy(34,3);
textbackground(2);
write(' ');
gotoxy(35,3);
write(' ');
gotoxy(36,3);
write(' ');
gotoxy(37,3);
write(' ');
gotoxy(38,3);
write(' ');
gotoxy(39,3);
write(' ');
gotoxy(40,3);
write(' ');
gotoxy(43,3);
textbackground(2);
write(' ');
gotoxy(44,3);
write(' ');
gotoxy(48,3);
textbackground(2);
write(' ');
gotoxy(49,3);
write(' ');
gotoxy(3,4);
textbackground(2);
write(' ');
gotoxy(4,4);
write(' ');
gotoxy(5,4);
write(' ');
gotoxy(6,4);
write(' ');
gotoxy(7,4);
write(' ');
gotoxy(8,4);
write(' ');
gotoxy(9,4);
write(' ');
gotoxy(10,4);
write(' ');
gotoxy(11,4);
write(' ');
gotoxy(15,4);
textbackground(2);
write(' ');
gotoxy(16,4);
write(' ');
gotoxy(17,4);
write(' ');
gotoxy(18,4);
write(' ');
gotoxy(19,4);
write(' ');
gotoxy(21,4);
textbackground(2);
write(' ');
gotoxy(22,4);
write(' ');
gotoxy(25,4);
textbackground(2);
write(' ');
gotoxy(26,4);
write(' ');
gotoxy(27,4);
write(' ');
gotoxy(28,4);
write(' ');
gotoxy(29,4);
write(' ');
gotoxy(31,4);
textbackground(2);
write(' ');
gotoxy(32,4);
write(' ');
gotoxy(34,4);
textbackground(2);
write(' ');
gotoxy(35,4);
write(' ');
gotoxy(39,4);
textbackground(2);
write(' ');
gotoxy(40,4);
write(' ');
gotoxy(44,4);
textbackground(2);
write(' ');
gotoxy(45,4);
write(' ');
gotoxy(47,4);
textbackground(2);
write(' ');
gotoxy(48,4);
write(' ');
gotoxy(2,5);
textbackground(2);
write(' ');
gotoxy(3,5);
write(' ');
gotoxy(4,5);
write(' ');
gotoxy(5,5);
write(' ');
gotoxy(6,5);
write(' ');
gotoxy(7,5);
write(' ');
gotoxy(8,5);
write(' ');
gotoxy(9,5);
write(' ');
gotoxy(10,5);
write(' ');
gotoxy(11,5);
write(' ');
gotoxy(12,5);
write(' ');
gotoxy(15,5);
textbackground(2);
write(' ');
gotoxy(16,5);
write(' ');
gotoxy(17,5);
write(' ');
gotoxy(18,5);
write(' ');
gotoxy(25,5);
textbackground(2);
write(' ');
gotoxy(26,5);
write(' ');
gotoxy(27,5);
write(' ');
gotoxy(28,5);
write(' ');
gotoxy(39,5);
textbackground(2);
write(' ');
gotoxy(40,5);
write(' ');
gotoxy(45,5);
textbackground(2);
write(' ');
gotoxy(46,5);
write(' ');
gotoxy(47,5);
write(' ');
gotoxy(2,6);
textbackground(2);
write(' ');
gotoxy(3,6);
write(' ');
gotoxy(4,6);
write(' ');
gotoxy(5,6);
write(' ');
gotoxy(9,6);
textbackground(2);
write(' ');
gotoxy(10,6);
write(' ');
gotoxy(11,6);
write(' ');
gotoxy(12,6);
write(' ');
gotoxy(15,6);
textbackground(2);
write(' ');
gotoxy(16,6);
write(' ');
gotoxy(17,6);
write(' ');
gotoxy(25,6);
textbackground(2);
write(' ');
gotoxy(26,6);
write(' ');
gotoxy(27,6);
write(' ');
gotoxy(35,6);
textbackground(2);
write(' ');
gotoxy(36,6);
write(' ');
gotoxy(37,6);
write(' ');
gotoxy(38,6);
write(' ');
gotoxy(39,6);
write(' ');
gotoxy(40,6);
write(' ');
gotoxy(45,6);
textbackground(2);
write(' ');
gotoxy(46,6);
write(' ');
gotoxy(47,6);
write(' ');
gotoxy(54,6);
textbackground(4);
write(' ');
gotoxy(56,6);
textbackground(4);
write(' ');
gotoxy(58,6);
textbackground(4);
write(' ');
gotoxy(59,6);
write(' ');
gotoxy(60,6);
write(' ');
gotoxy(62,6);
textbackground(4);
write(' ');
gotoxy(64,6);
textbackground(4);
write(' ');
gotoxy(67,6);
textbackground(4);
write(' ');
gotoxy(69,6);
textbackground(4);
write(' ');
gotoxy(70,6);
write(' ');
gotoxy(71,6);
write(' ');
gotoxy(73,6);
textbackground(4);
write(' ');
gotoxy(75,6);
textbackground(4);
write(' ');
gotoxy(2,7);
textbackground(2);
write(' ');
gotoxy(3,7);
write(' ');
gotoxy(4,7);
write(' ');
gotoxy(10,7);
textbackground(2);
write(' ');
gotoxy(11,7);
write(' ');
gotoxy(12,7);
write(' ');
gotoxy(15,7);
textbackground(2);
write(' ');
gotoxy(16,7);
write(' ');
gotoxy(17,7);
write(' ');
gotoxy(25,7);
textbackground(2);
write(' ');
gotoxy(26,7);
write(' ');
gotoxy(27,7);
write(' ');
gotoxy(34,7);
textbackground(2);
write(' ');
gotoxy(35,7);
write(' ');
gotoxy(39,7);
textbackground(2);
write(' ');
gotoxy(40,7);
write(' ');
gotoxy(45,7);
textbackground(2);
write(' ');
gotoxy(46,7);
write(' ');
gotoxy(47,7);
write(' ');
gotoxy(54,7);
textbackground(4);
write(' ');
gotoxy(55,7);
write(' ');
gotoxy(56,7);
write(' ');
gotoxy(59,7);
textbackground(4);
write(' ');
gotoxy(62,7);
textbackground(4);
write(' ');
gotoxy(64,7);
textbackground(4);
write(' ');
gotoxy(65,7);
write(' ');
gotoxy(67,7);
textbackground(4);
write(' ');
gotoxy(70,7);
textbackground(4);
write(' ');
gotoxy(74,7);
textbackground(4);
write(' ');
gotoxy(2,8);
textbackground(2);
write(' ');
gotoxy(3,8);
write(' ');
gotoxy(4,8);
write(' ');
gotoxy(10,8);
textbackground(2);
write(' ');
gotoxy(11,8);
write(' ');
gotoxy(12,8);
write(' ');
gotoxy(15,8);
textbackground(2);
write(' ');
gotoxy(16,8);
write(' ');
gotoxy(17,8);
write(' ');
gotoxy(25,8);
textbackground(2);
write(' ');
gotoxy(26,8);
write(' ');
gotoxy(27,8);
write(' ');
gotoxy(34,8);
textbackground(2);
write(' ');
gotoxy(35,8);
write(' ');
gotoxy(36,8);
write(' ');
gotoxy(37,8);
write(' ');
gotoxy(38,8);
write(' ');
gotoxy(39,8);
write(' ');
gotoxy(40,8);
write(' ');
gotoxy(45,8);
textbackground(2);
write(' ');
gotoxy(46,8);
write(' ');
gotoxy(47,8);
write(' ');
gotoxy(2,9);
textbackground(2);
write(' ');
gotoxy(3,9);
write(' ');
gotoxy(4,9);
write(' ');
gotoxy(5,9);
write(' ');
gotoxy(6,9);
write(' ');
gotoxy(7,9);
write(' ');
gotoxy(8,9);
write(' ');
gotoxy(9,9);
write(' ');
gotoxy(10,9);
write(' ');
gotoxy(11,9);
write(' ');
gotoxy(12,9);
write(' ');
gotoxy(15,9);
textbackground(2);
write(' ');
gotoxy(16,9);
write(' ');
gotoxy(17,9);
write(' ');
gotoxy(25,9);
textbackground(2);
write(' ');
gotoxy(26,9);
write(' ');
gotoxy(27,9);
write(' ');
gotoxy(35,9);
textbackground(2);
write(' ');
gotoxy(36,9);
write(' ');
gotoxy(37,9);
write(' ');
gotoxy(38,9);
write(' ');
gotoxy(39,9);
write(' ');
gotoxy(41,9);
textbackground(2);
write(' ');
gotoxy(46,9);
textbackground(2);
write(' ');
gotoxy(2,10);
textbackground(2);
write(' ');
gotoxy(3,10);
write(' ');
gotoxy(4,10);
write(' ');
gotoxy(5,10);
write(' ');
gotoxy(6,10);
write(' ');
gotoxy(7,10);
write(' ');
gotoxy(8,10);
write(' ');
gotoxy(9,10);
write(' ');
gotoxy(10,10);
write(' ');
gotoxy(11,10);
write(' ');
gotoxy(12,10);
write(' ');
gotoxy(2,11);
textbackground(2);
write(' ');
gotoxy(3,11);
write(' ');
gotoxy(4,11);
write(' ');
gotoxy(5,11);
write(' ');
gotoxy(9,11);
textbackground(2);
write(' ');
gotoxy(10,11);
write(' ');
gotoxy(11,11);
write(' ');
gotoxy(12,11);
write(' ');
gotoxy(2,12);
textbackground(2);
write(' ');
gotoxy(3,12);
write(' ');
gotoxy(4,12);
write(' ');
gotoxy(10,12);
textbackground(2);
write(' ');
gotoxy(11,12);
write(' ');
gotoxy(12,12);
write(' ');
end;
procedure caricamenu(ch:integer);
begin
case ch of
   0:
         begin
              commands[1]:='-randomizza vettore-';
              commands[2]:='---carica da file---';
              commands[3]:='---inserisci vett.--';
              commands[4]:='-------about--------';
              commands[5]:='-------uscita-------';
         end;
   1:
        begin
              commands[1]:='---mostra vettore---';
              commands[2]:='-ordinam. crescente-';
              commands[3]:='ordinam.decrcescente';
              commands[4]:='--cerca un elemento-';
              commands[5]:='------indietro------';
        end;
   2:
        begin
              commands[1]:='                    ';
              commands[2]:='-ricerca dicotomica-';
              commands[3]:='ricerca x sentinella';
              commands[4]:='------indietro------';
              commands[5]:='                    ';
        end;
   end;
end;

procedure menu;
begin
    textcolor(lightgray);
    textbackground(black);
    clrscr;
    title;
    textcolor(lightgray);
    textbackground(black);
    gotoxy(25,23);writeln('copyright Alessandro Cacco 2012');
    if part<2 then sc:=1
              else sc:=2;
    textcolor(black);
    repeat
          k:=749;
          textbackground(lightgray);
          for i:=1 to 5 do
               if not((part=2)and((i=1)or(i=5))) then
                  begin
                       gotoxy(31,11+(i*2));
                       write(commands[i]);
                  end;
          repeat
              k:=k+1;
              gotoxy(31,11+(sc*2));
              case sc of
                1: begin
                      if k mod 1500=750 then  textbackground(yellow);
                      if k mod 1500=0 then  textbackground(lightgray);
                   end;
                2: begin
                      if k mod 1500=750 then  textbackground(yellow);
                      if k mod 1500=0 then  textbackground(lightgray);
                   end;
                3: begin
                      if k mod 1500=750 then  textbackground(yellow);
                      if k mod 1500=0 then  textbackground(lightgray);
                   end;
                4: begin
                      if k mod 1500=0 then  textbackground(lightgray);
                      if k mod 1500=750 then
                         case part of
                              0: textbackground(green);
                              1: textbackground(yellow);
                              2: textbackground(green);
                         end;
                   end;
                5: begin
                      if k mod 1500=0 then  textbackground(lightgray);
                      if k mod 1500=750 then
                         case part of
                              0: textbackground(red);
                              1: textbackground(lightgreen);
                         end;
                    end;
              end;
              write(commands[sc]);
          until keypressed;
          c:=readkey;
          if c='w' then sc:=sc-1;
          if c='s' then sc:=sc+1;
          if part=2 then
             begin
                  if sc=1 then sc:=4;
                  if sc=5 then sc:=2;
             end
             else
             begin
                  if sc=0 then sc:=5;
                  if sc=6 then sc:=1;
             end;
    until c=' ';
end;

procedure randomm;
var car,letters,Aa:integer;
begin
//     randomize;
     for i:=1 to j do
         begin
              letters:=random(20);
              letters:=letters+5;
              vet[i]:='';
              for k:=1 to letters do
                  begin
                       Aa:=random(100);
                       car:=random(25);
                       if Aa mod 2= 0 then car:=car+65
                                      else car:=car+97;
                       vet[i]:=vet[i]+chr(car);
                  end;
         end;
     part:=1;
end;

procedure load;
var source:text;
    percorso:string;
begin
     textbackground(white);
     clrscr;
     repeat
           writeln ('inserisci il percorso del file (l''aggiunta dell''estensione e'' automatica)');
           readln(percorso);
           percorso:=percorso+'.aru';
           assign(source,percorso);
           {$I-}
           reset(source);
           {$I+}
     until IOResult=0;
     for i:=1 to j do readln(source,vet[i]);
     close(source);
     part:=1;
end;

procedure save;
var source:text;
    percorso:string;
begin
     writeln ('inserisci il percorso dove salvare il file');
     writeln('l''aggiunta dell''estensione e'' automatica)');
     readln(percorso);
     percorso:=percorso+'.aru';
     assign(source,percorso);
     rewrite(source);
     for i:=1 to j do writeln(source,vet[i]);
     close(source);
end;

procedure typed;
begin
     textbackground(white);
     clrscr;
     for i:=1 to j do
         begin
              write('inserisci l''elemento ',i,': ');
              readln(vet[i]);
         end;
     writeln('vuoi salvarlo su file? (s/n)');
     repeat
           c:=readkey;
     until (c='s')or(c='n');
     if c='s' then save;
     part:=1;
end;

procedure about;
begin
     textbackground(white);
     clrscr;
     writeln('COPYRIGHT ALESSANDRO CACCO 2012');
     writeln('premi un tasto per tornare al menu''');
     repeat until keypressed;
     c:=readkey;
end;

procedure show;
begin
     textbackground(white);
     clrscr;
     for i:=1 to j do writeln(vet[i]);
     writeln;
     writeln('premi un tasto per tornare al menu''');
     repeat until keypressed;
     c:=readkey;
end;

procedure crescente(var toorder:array of string);
var temp:string;
begin
     textbackground(white);
     clrscr;
     for i:=0 to j-2 do
         for k:=i+1 to j-1 do
             if toorder[i]>toorder[k] then
                begin
                     temp:=toorder[i];
                     toorder[i]:=toorder[k];
                     toorder[k]:=temp;
                end;
     writeln('vettore ordinato correttamente in ordine crescente!');
     part:=1;
     delay(1000);
end;

procedure decrescente(var toorder:array of string);
var temp:string;
begin
     textbackground(white);
     clrscr;
     for i:=0 to j-2 do
         for k:=i+1 to j-1 do
             if toorder[i]<toorder[k] then
                begin
                     temp:=toorder[i];
                     toorder[i]:=toorder[k];
                     toorder[k]:=temp;
                end;
     writeln('vettore ordinato correttamente in ordine decrescente!');
     part:=1;
     delay(1000);
end;

procedure request(var x:string);
begin
textbackground(white);
clrscr;
write('inserisci la parola da ricercare: ');
readln(x);
writeln;
end;

procedure dicotomicsearch(tofind:array of string);
var esx,edx,m:integer;
    sentinella:boolean;
    n:string;
begin
     crescente(tofind);
     request(n);
     esx:=0;
     edx:=j-1;
    repeat
     begin
           m:=(edx+esx) div 2;
           if n<tofind[m] then edx:=m-1
                          else if n>tofind[m] then esx:=m+1
                                              else sentinella:=true;
     end;
     until (sentinella=true)or(esx>edx);
     if sentinella=true then writeln(n,' e'' stato trovato alla posizione ',m+1,' del vettore in ordine alfabetico')
                         else writeln('l''elemento ',n,' non e'' stato trovato.');
     writeln;
     writeln('premi un tasto per tornare indietro...');
     repeat until keypressed;
     c:=readkey;
     part:=2;
end;

procedure sentinelsearch(tofind:array of string);
var sentinella:boolean;
    n:string;
begin
     request(n);
     i:=0;
     sentinella:=false;
     repeat
           if tofind[i]=n then sentinella:=true;
           i:=i+1;
     until (sentinella=true)or(i=j-1);
     if sentinella=true then writeln(n,' e'' stato trovato alla posizione ',i,' del vettore')
                        else writeln('l''elemento ',n,' non e'' stato trovato.');
     writeln;
     writeln('premi un tasto per tornare indietro...');
     repeat until keypressed;
     c:=readkey;
     part:=2;
end;

procedure find;
begin
part:=part+1;
end;

procedure back;
begin
     part:=part-1;
end;

procedure verifychoice;
begin
     case sc of
          1: case part of
                  0: randomm;
                  1: show;
             end;
          2: case part of
                  0: load;
                  1: crescente(vet);
                  2: dicotomicsearch(vet);
             end;
          3: case part of
                  0: typed;
                  1: decrescente(vet);
                  2: sentinelsearch(vet);
             end;
          4: case part of
                  0: about;
                  1: find;
                  2: back;
             end;
          5: case part of
                  0: quit:=true;
                  1: back;
             end;
     end;
end;



begin
   repeat
      caricamenu(part);
      menu;
      verifychoice;
   until quit=true;
end.
