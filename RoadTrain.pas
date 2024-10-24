program e_la_strada_si_apree;
uses crt;
var
   strada:text;
   pixel:array[1..80]of array[1..500] of shortint;
   percorso:string;
   i,k,x,y,kill,xo,yo:integer;
begin
     clrscr;
     readln(percorso);
     assign(strada,percorso);
     reset(strada);
     clrscr;
     for i:=1 to 25 do
         for k:=1 to 500 do
             begin
                  readln(strada,pixel[k][i]);
                  gotoxy(k,i);
                  if pixel[k][i]=1 then textbackground(black)
                                   else textbackground(blue);
                  write(' ');
             end;

