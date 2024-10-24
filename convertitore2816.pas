program _2816converter;

uses crt;

var v:array [1..1000] of integer;
    num,base,j,i:integer;
    quit:boolean;

procedure divmod(base:integer; var num:integer; var quit:boolean);
  begin
       v[i]:=num mod base;
       num:=num div base;
       if num=0 then quit:=true;
  end;

procedure predivmod(num,base:integer;var quit:boolean);
  begin
     quit:=false;
     i:=0;
     repeat
           i:=i+1;
           divmod(base,num,quit);
     until quit=true;
  end;

procedure input(var num:integer);
  begin
     writeln;
     writeln;
     writeln;
     writeln('inserisci il numero da convertire (''0'' per uscire)');
     readln(num);
  end;

procedure inputbase(var base:integer);
begin
     writeln('inserisci la base in cui convertirlo(2-16)');
     repeat
           readln(base);
     until (base<=16)and(base>=2);
end;

procedure writeresults;
begin
     clrscr;
     writeln;
     writeln;
     writeln;
     write(num,'=');
     if base=16
        then
        for j:=1 to i do
            begin
                 case v[i+1-j] of
                      10:write('A');
                      11:write('B');
                      12:write('C');
                      13:write('D');
                      14:write('E');
                      15:write('F')
                      else write(v[i+1-j]);
                 end;
            end
        else
        for j:=1 to i do write(v[i+1-j]);
     writeln(' in base', base);
     writeln;
     writeln('premi un tasto per continuare...');
     repeat until keypressed;
     clrscr;
end;

begin
     repeat
           input(num);
           if num<>0 then
              begin
                   inputbase(base);
                   predivmod(num,base,quit);
                   writeresults;
              end;
     until num=0;
end.
