program experimentgestion;
uses crt;
const
     j=20;
var
   v:array[1..j]of integer;
   i,sc,k:integer;
   c:char;
   commands:array[1..5]of string;


procedure caricamenu;
begin
              commands[1]:='-randomizza  valori-';
              commands[2]:='---carica da file---';
              commands[3]:='--inserisci valori--';
              commands[4]:='-------about--------';
              commands[5]:='-------uscita-------';
end;


procedure menu;
begin
    textcolor(lightgray);
    textbackground(black);
    clrscr;
    //title;
    textcolor(lightgray);
    textbackground(black);
    gotoxy(25,23);writeln('copyright Alessandro Cacco 2012');
    sc:=1;
    textcolor(black);
    repeat
          k:=749;
          textbackground(lightgray);
          for i:=1 to 5 do
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
                      if k mod 1500=750 then textbackground(green);
                   end;
                5: begin
                      if k mod 1500=0 then  textbackground(lightgray);
                      if k mod 1500=750 then textbackground(red);
                    end;
              end;
              write(commands[sc]);
          until keypressed;
          c:=readkey;
          if c='w' then sc:=sc-1;
          if c='s' then sc:=sc+1;
          if sc=0 then sc:=5;
          if sc=6 then sc:=1;
    until c=' ';
end;

begin
caricamenu;
menu;
end.
