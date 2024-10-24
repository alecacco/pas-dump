program contadinorusso;
uses crt;
var num1,num2,r:integer;

procedure scambiacond;
var temp:integer;
begin
     if num1>num2 then
        begin
             temp:=num1;
             num1:=num2;
             num2:=temp;
        end;
end;

procedure request;
begin
     writeln('inserisci i numeri che vuoi moltiplicare');
     readln(num1,num2);
     scambiacond;
end;

procedure a1;
begin
     num1:=num1-1;
     r:=num2+r;
//     tot:=(num1*num2)+r;
end;

procedure a2;
begin
     num1:=num1 div 2;
//     tot:=num1*num2;
     num2:=num2*2
end;

procedure a;
begin
     if num1 mod 2 =1
        then a1
        else a2;
end;
begin
     request;
     r:=0;
     while num1<>1 do a;
     writeln (num2+r);
     repeat until keypressed;
end.
