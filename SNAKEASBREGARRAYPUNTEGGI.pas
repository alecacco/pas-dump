program snake;
uses crt;
const maxlong=300;
var gravity,borders,exc,c:char;
    checkpp,kill,contapunti,velocity,punteggio,xtest,ytest,i,k,j,xx,yy,xs,xl,xp,xpp,xb,ys,yl,yp,ypp,yb:longint;
    x,y:array[1..maxlong]of integer;
    savepoint:text;
    records:array[1..10]of integer;
    recname:array[1..10]of string[8];
    name:string;
procedure nuovipunteggi;
begin
     rewrite(savepoint);
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
     writeln(savepoint,'noname');
     writeln(savepoint,'0');
end;
procedure ordinapunteggi;
begin
     gotoxy(10,18);
     textbackground(black);
     write('type your name(max 8 characters): ');
     read(name);
     records[10]:=punteggio;
     recname[10]:=name;
     for i:=1 to 9 do
         for j:=i+1 to 10 do
             if records[i]>records[j] then
                begin
                     k:=records[i];
                     records[i]:=records[j];
                     records[j]:=k;
                     name:=recname[i];
                     recname[i]:=recname[j];
                     recname[j]:=name;
                end;
     rewrite(savepoint);
     for j:=1 to 10 do
         begin
              writeln(savepoint, recname[11-j]);
              writeln(savepoint, records[11-j]);
         end;
end;
procedure test_diverso;
begin
     kill:=0;
     for j:=1 to maxlong do if ((x[j]=xtest)and(y[j]=ytest))or(xtest<=1)or(xtest>=80)or(ytest>=24)or(ytest<=1) then kill:=1;
end;
procedure titolazione;
begin
     textbackground(black);
     clrscr;
     textbackground(green);
     textcolor(red);
     gotoxy(30,7);
     write('::::');
     gotoxy(35,7);
     write(':::');
     gotoxy(42,7);
     write(':::');
     gotoxy(33,8);
     write(':::');
     gotoxy(37,8);
     write('::::::');
     gotoxy(44,8);
     write(':');
     gotoxy(44,9);
     write(':');
     gotoxy(44,10);
     write(':');
     gotoxy(30,10);
     write(':S:N:A:K:E:');
     textbackground(black);
     textcolor(lightgray);
end;
procedure bordi;
begin
textbackground(blue);
     clrscr;
     for i:= 1 to 80 do if borders='n' then write ('_')
                                       else write('*');
     for i:= 1 to 22 do if borders='n' then writeln ('|')
                                       else writeln('*');
     for i:= 1 to 23 do
       begin
         gotoxy(80,i);
         if borders='n' then write ('|')
                        else write('*');
       end;
     for i:=1 to 80 do
       begin
         gotoxy(i,24);
         if borders='n' then write ('_')
                        else write('*');
       end;
end;
begin
     (*ciclo di ripetizione per ricominciare dopo il game over*)
     repeat
      (*titolazione*)
       titolazione;
       gotoxy(36,14);
       write('by CaCCo AleSSandRo');
       c:='r';
       (*assegnazione velocità, scelta forza di gravità, scelta bordi*)
       repeat
       if (velocity>100)and(velocity<maxlong+100) then contapunti:=velocity-103 //trucco per partire con una certa lunghezza
                       else contapunti:=0;
       gotoxy(20,17);
       write('Scegli il grado di difficolta'' (1-100):');
       for i:=59 to 80 do write(' ');
       gotoxy(60,17);
       readln(velocity);
       until (velocity<=100)and(velocity>0);
       repeat
       gotoxy(27,18);
       write('G-Force (y/s/n):');
       for i:=27 to 80 do write(' ');
       gotoxy(44,18);
       readln(gravity);
       until (gravity='s')or(gravity='S')or(gravity='y')or(gravity='Y')or(gravity='n')or(gravity='N');
       repeat
       gotoxy(27,19);
       write('Bordi (y/s/n):');
       for i:=27 to 80 do write(' ');
       gotoxy(42,19);
       readln(borders);
       until (borders='s')or(borders='S')or(borders='y')or(borders='Y')or(borders='n')or(borders='N');
     (*disegno bordi con condizione per cambiarli se uccidono il serpente o se lo fanno passare*)
     bordi;
     (*inizio assegnazione variabili D:*)
     for i:=1 to maxlong do
       begin
         x[i]:=0;
         y[i]:=0;
       end;
     xx:=40;
     yy:=11;
     xl:=0;
     yl:=0;
     xs:=0;
     ys:=0;
     i:=0;
     k:=1; //altrimenti la velocità viene incrementata di uno in partenza per contapunti mod 3=0
     kill:=0;
     punteggio:=0;
     for j:=1 to maxlong do
         begin
              x[j]:=0;
              y[j]:=0;
         end;
     (*scrittura caratteri di introduzione alla direzione*)
     gotoxy(40,9);
     write('A');
     gotoxy(40,13);
     write('V');
     gotoxy(38,11);
     write('<');
     gotoxy(42,11);
     write('>');
     repeat
     exc:=c;  // ricordo precedente scelta della direzione
     repeat
     c:=readkey;  //scelta della direzione
     until (c='a')or(c='s')or(c='w')or(c='d')or(c='A')or(c='S')or(c='D')or(c='W')or(c='q')or(c='Q')or(c='r')or(c='R');
                repeat
                      i:=i+1;  //incremento variabile temporale
                      kill:=0;
                      (*scrittura punto normale*)
                      if ((xx=xp)and(yy=yp))or(i=1) then
                      begin
                           k:=k+1;
                           if i<>1 then contapunti:=contapunti+1;
                           repeat
                                 xp:=random(2+79);
                                 yp:=random(2+23);
                                 xtest:=xp;
                                 ytest:=yp;
                                 kill:=0;
                                 test_diverso;
                           until (kill=0)and(xp<24)and(xp>1)and(yp>1)and(yp<80);
                           gotoxy(xp,yp);
                           textcolor(lightgray);
                           write('@');
                           if i<>1 then punteggio:=punteggio+1;
                      end;
                      (*randomizzazione superpunto*)
                      if (i mod 500=0)or(i=51) then
                         begin
                           if i<>51 then k:=k+1;
                           repeat
                                 xpp:=random(2+79);
                                 ypp:=random(2+23);
                                 xtest:=xpp;
                                 ytest:=ypp;
                                 kill:=0;
                                 test_diverso;
                           until kill=0;
                           end;
                      (*aumento punteggio alla presa del superpunto e cancellazione se non preso*)
                      if (((xs=xpp)and(ys=ypp))or(i mod 500=150))and(i>50) then
                         begin
                              gotoxy(xpp,ypp);
                              if(xs=xpp)and(ys=ypp)then
                                  begin
                                       punteggio:=punteggio+5;
                                       checkpp:=0;
                                  end;
                              if checkpp=1 then write(' ');
                              xpp:=0;
                              ypp:=0;
                              gotoxy(xx,yy);
                         end;
                      (*creazione superpunto*)
                      if (i mod 500<150)and(i>50)and(xpp<>0)and(ypp<>0) then
                      begin
                           gotoxy(xpp,ypp);
                           if i mod 2=0 then textcolor(green)
                                        else textcolor(white);
                           write('$');
                           checkpp:=1;
                           gotoxy(xx,yy);
                           textcolor(lightgray);
                      end;
                      (* aumento velocità in base al parametro k che si incrementa alla presa di tutti i punti, anche speciali*)
                      if (velocity<100)and(k mod 3=0) then
                         begin
                              velocity:=velocity+1;
                              k:=k+1;
                         end;
                      (*randomizzazione bomba*)
                      if (i mod 300=0)or(i=76) then
                         repeat
                               xb:=random(2+78);
                               yb:=random(2+21);
                               kill:=0;
                               xtest:=xb;
                               ytest:=yb;
                               test_diverso;
                               ytest:=yb+1;
                               test_diverso;
                               ytest:=yb+2;
                               test_diverso;
                               xtest:=xb-1;
                               test_diverso;
                               xtest:=xb+1;
                               test_diverso;
                         until (xb<79)and(xb>2)and(yb<22)and(yb>1)and(xb<>xx)and(xb<>xs)and(xb<>xl)and(yb<>yy)and(yb<>ys)and(yb<>yl)and(kill=0);
                      (*cancellazione bomba*)
                      if (i mod 300=100)and(i>75) then
                         begin
                              gotoxy(xb,yb);
                              write(' ');
                              gotoxy(xb,yb+1);
                              write(' ');
                              gotoxy(xb-1,yb+2);
                              write('   ');
                              xb:=0;
                              yb:=0;
                              gotoxy(xx,yy);
                         end;
                      (*scrittura bomba*)
                      if (i mod 300<100)and(i>75) then
                         begin
                              gotoxy(xb,yb);
                              if i mod 2=0 then write('*')
                                           else write(' ');
                              gotoxy(xb,yb+1);
                              write('|');
                              gotoxy(xb-1,yb+2);
                              write('(_)');
                              gotoxy(xx,yy);
                         end;
                      (*scelta direzione, se è opposta alla precedente non viene eseguita*)
                      if (exc='d')and(c='a') then c:='d';
                      if (exc='a')and(c='d') then c:='a';
                      if (exc='w')and(c='s') then c:='w';
                      if (exc='s')and(c='w') then c:='s';
                      if (c='w')or(c='W') then yy:=yy-1;
                      if (c='a')or(c='A') then xx:=xx-1;
                      if (c='d')or(c='D') then xx:=xx+1;
                      if (c='s')or(c='S') then yy:=yy+1;
                      (*delay per la velocità, modificato se gravità attivata*)
                      if (gravity='s')or(gravity='S')or(gravity='y')or(gravity='Y') then
                         begin
                         if c='s' then delay(110-velocity);
                         if c='w' then delay(150-velocity);
                         if (c='a')or(c='d') then delay(115-velocity);
                         end
                         else delay(115-velocity);
                      (*se i bordi sono disattivati, allora teletrasporto da parte a parte*)
                      if borders='n' then
                         begin
                              if xx=1 then xx:=79;
                              if xx=80 then xx:=2;
                              if yy=1 then yy:=23;
                              if yy=24 then yy:=2;
                         end;
                      (*cancellazione caratteri di introduzione alla direzione*)
                      if i=1 then
                         begin
                              gotoxy(40,9);
                              write(' ');
                              gotoxy(40,13);
                              write(' ');
                              gotoxy(38,11);
                              write(' ');
                              gotoxy(42,11);
                              write(' ');
                         end;
                      (*scritta caratteri del serpente*)
                      gotoxy(xx,yy);
                      textbackground(green);
                      textcolor(red);
                      write(':');       //scritta punta del serpente
                      xl:=x[1];
                      yl:=y[1];
                      x[1]:=x[2];
                      y[1]:=y[2];
                      gotoxy(xl,yl);
                      textbackground(blue);
                      if (xl<>0)and(yl<>0) then write(' ');
                      for j:=2 to contapunti+3 do
                          begin
                               x[j]:=x[j+1];
                               y[j]:=y[j+1];
                          end;
                      x[j+1]:=xs;
                      y[j+1]:=ys;
                      xs:=xx;
                      ys:=yy;
                      (*scrittura punteggio e velocità attuale*)
                      gotoxy(1,1);
                      textcolor(lightgray);
                      write('Punteggio:',punteggio);
                      gotoxy(67,1);
                      write('Velocita'': ', velocity);
                      (*scritta gravità a lato*)
                      if (gravity='s')or(gravity='S')or(gravity='y')or(gravity='Y') then
                      begin
                           for j:=8 to 14 do
                               begin
                                    gotoxy(80,j);
                                    if j=8  then write('G');
                                    if j=9  then write('r');
                                    if j=10 then write('a');
                                    if j=11 then write('v');
                                    if j=12 then write('i');
                                    if j=13 then write('t');
                                    if j=14 then write('y');
                               end;
                           (* le frecce si muovono se si va in giù*)
                           for j:=0 to 3 do
                               if (c='s')or(c='S') then
                                  begin
                                       gotoxy(80,15+j);
                                       if i mod 4=j then write('V')
                                                    else write(' ');
                                  end
                                  else
                                  begin
                                       gotoxy(80,15+j);
                                       write('V');
                                  end;
                      end;
                      gotoxy(xx,yy);
                      xtest:=xx;
                      ytest:=yy;
                      kill:=0;
                      test_diverso;
                      for j:=1 to maxlong do if (xx=x[j])and(yy=y[j]) then kill:=1;
                      if ((xx=xl)and(yy=yl))or(((xx=80)or(xx=1)or(yy=1)or(yy=24))and((borders='y')or(borders='s')))or((xx=xb)and(yy=yb))or((xx=xb)and(yy=yb+1))or((xx=xb)and(yy=yb+2))or((xx=xb-1)and(yy=yb+2))or((xx=xb+1)and(yy=yb+2)) then kill:=1;
                until (keypressed) or (kill=1)
                (*(sopra) condizioni di ripetizione del movimento se non viene premuto alcun tasto e condizioni di uscita se il serpente si tocca o tocca i bordi se ci sono*)
     until (c='q')or(kill=1);
     (*(sopra)condizioni di uscita se il serpente si tocca o tocca i bordi se ci sono, oppure se si preme 'q'*)
     (*scrittura schermata game over*)
     kill:=0;
     repeat
     textcolor(lightgray);
     bordi;
     gotoxy(2,2);
     for i:=1 to 23 do
         begin
         textbackground(i+3);
         for j:=2 to 79 do write(' ');
         gotoxy(2,i+1);
         end;
     gotoxy(35,12);
     textbackground(red);
     write('GAME OVER');
     gotoxy(33,15);
     write('Punteggio: ',punteggio);
     gotoxy(15,20);
     writeln('press ''q'' to quit, ''r'' to restart,''p'' for records');      //informazione di scelta per l'utente
     assign(savepoint,'E:\pas\punteggi.txt');
     {sI-}
     reset(savepoint);
     {sI+}
     if IOResult<>0 then nuovipunteggi;
     for j:=1 to 10 do
         begin
              readln(savepoint,recname[j]);
              readln(savepoint,records[j]);
         end;
     if kill=0 then if punteggio>records[10] then ordinapunteggi;
     close(savepoint);
     (*lettura scelta dell'utente per uscire o giocare nuovamente*)              
     repeat
     c:=readkey;
     until (c='q')or(c='r')or(c='p');
     if c='p' then
        begin
             titolazione;
             for j:=1 to 5 do
                 begin
                      gotoxy(15,16+j);
                      write(recname[j],': ',records[j]);
                      gotoxy(50,16+j);
                      write(recname[j],': ',records[j]);
                 end;
             gotoxy(25,23);
             write('press enter to go back...');
             textcolor(black);
             repeat until keypressed;
             readln;
        end;
     until (c='q')or(c='r');
     until(c='q');   //il programma termina solo se viene premuto 'q'
     textbackground(black);
     textcolor(lightgray);
     clrscr;
     gotoxy(38,12);
     write('Bye!');//saluto :)
     delay(1000);
end.
