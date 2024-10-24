program codicefiscale;       //CCC LSN 96H26 D325 E 
uses crt;                    //http://www.paginainizio.com/service/strutturacodicefiscale.htm
var code:array[0..15]of char;

procedure title;
begin
     writeln('*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+');
     writeln('*+*+QUESTO PROGRAMMA VERIFICA LA CORRETTEZZA DI UN CODICE FISCALE INSERITO+*+*+*');
     writeln('*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+');
END;
procedure dispari(var n,q:integer;b:boolean);
begin
     case code[q] of
          '0': n:=n+1;
          '2': n:=n+5;
          '3': n:=n+7;
          '4': n:=n+9;
          '5': n:=n+13;
          '6': n:=n+15;
          '7': n:=n+17;
          '8': n:=n+19;
          '9': n:=n+21;
          'A': n:=n+1;
          'C': n:=n+5;
          'D': n:=n+7;
          'E': n:=n+9;
          'F': n:=n+13;
          'G': n:=n+15;
          'H': n:=n+17;
          'I': n:=n+19;
          'J': n:=n+21;
          'K': n:=n+2;
          'L': n:=n+4;
          'M': n:=n+18;
          'N': n:=n+20;
          'O': n:=n+11;
          'P': n:=n+3;
          'Q': n:=n+6;
          'R': n:=n+8;
          'S': n:=n+12;
          'T': n:=n+14;
          'U': n:=n+16;
          'V': n:=n+10;
          'W': n:=n+22;
          'X': n:=n+25;
          'Y': n:=n+24;
          'Z': n:=n+23;
     end;
end;

procedure pari(var n,q:integer);
begin
     if(ord(code[q])>=65)and(ord(code[q])<=90) then n:=n+ord(code[q])-65
                                               else n:=n+ord(code[q])-48;
end;

function check:boolean;
var num,i:integer;
    b:boolean;
begin
     check:=true;
     num:=0;
     for i:=0 to 14 do
         if (i+1) mod 2=0 then pari(num,i)
                      else dispari(num,i,b);
     num:=num mod 26;
     if chr(num+65)<>code[15]then check:=false;
end;

procedure input;
var code_str:string;
    i:integer;
begin
     writeln('inserire codice fiscale:');
     readln(code_str);
     for i:=0 to 15 do code[i]:=code_str[i+1];
end;

procedure output;
begin
     if check=TRUE then writeln('codice corretto!')
              else writeln('codice NON corretto!');
end;

procedure ask;
begin
     writeln('0 per uscire, 1 per inserire un altro codice fiscale');
     readln(code[0]);
end;

begin
     title;
     repeat
           input;
           output;
           ask;
     until code[0]='0';
end.




