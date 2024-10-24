{carte utilizzate:
       verdi  0-9 2x"+2"
       blu    0-9 2x"+2"
       rosse  0-9 2x"+2"
       gialle 0-9 2x"+2"
       nere   4x "+4"
}
program uno;
uses crt;
type
    card=record
        color:integer;
        ival:integer; //se è 0 allora viene consultato il valore stringa che determina se è +2 o +4
        sval:string;
        status:integer; //-1=scartata,0=mazzo,1=giocatore host,2=giocatore guest
    end;
var
   cards:array[1..52]of card;
   i,j:integer;

procedure init;
begin
     i:=random(52);
end;



begin

end.
