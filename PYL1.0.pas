program acpaint;
uses crt;
var x,k,y,i,penna,dim,background_color,writing_color,letter_color:integer;
    c,letter:char;
    pixel:array[1..80]of array[1..24]of integer;
    bitmap:text;
begin
        textcolor(black);
        textbackground(white);
        clrscr;
        gotoxy(1,25);
        for i:=1 to 80 do write('-');
        x:=1;
        y:=1;
        penna:=0;
        dim:=1;
        background_color:=7;
        writing_color:=14;
        letter_color:=0;
        letter:=' ';
        repeat
        repeat
           if c='r' then
              begin
                c:=readkey;
                if c='n' then
                    begin
                       gotoxy(60,25);
                       for i:=1 to 10 do write('-');
                       gotoxy(60,25);
                       read(background_color);
                       gotoxy(1,1);
                    end;
                textbackground(background_color);
                gotoxy(1,1);
                for i:=1 to 80*24 do write(' ');
                gotoxy(1,1);
              end;
           textcolor(black);
           textbackground(white);
           gotoxy(1,25);
           write('carattere: ''');
           if c='l' then
              begin
                gotoxy(13,25);
                readln(letter);
                gotoxy(1,1);
              end;
           gotoxy(13,25);
           write(letter,'''-----');
           if c='t' then
              begin
                gotoxy(60,25);
                for i:=1 to 10 do write('-');
                gotoxy(60,25);
                read(letter_color);
                gotoxy(1,1);
              end;
           if c='c' then
              begin
                gotoxy(60,25);
                for i:=1 to 10 do write('-');
                gotoxy(60,25);
                read(writing_color);
                gotoxy(1,1);
              end;
           gotoxy(60,25);
           write('----');
           gotoxy(53,25);
           write('colore: ',background_color,', ',writing_color,', ',letter_color);
           if (c='+')and(dim<6)and(x<81-dim)and(y<25-dim) then dim:=dim+1;
           if (c='-')and(dim>1) then dim:=dim-1;
           if c='p' then penna:=penna+1;
           if penna=3 then penna:=0;
           for i:=30 to 45 do
               begin
                    gotoxy(i,25);
                    write('-');
               end;
           gotoxy(20,25);
           write('cursore: ');
           gotoxy(29,25);
           if penna=0 then write('neutro');
           if penna=1 then write('pennarello - ',dim);
           if penna=2 then write('gomma - ',dim);
           gotoxy(x,y);
           c:=readkey;
           until (c='a')or(c='w')or(c='s')or(c='d')or(c='q');
        if c='a' then x:=x-1;
        if c='s' then y:=y+1;
        if c='d' then x:=x+1;
        if c='w' then y:=y-1;
        if x=0 then x:=81-dim;
        if x=82-dim then x:=1;
        if y=0 then y:=25-dim;
        if y=26-dim then y:=1;
        gotoxy(x,y);
        textcolor(letter_color);
        if penna=1 then textbackground(writing_color);
        if penna=2 then textbackground(background_color);
        if penna<>0 then
           for i:=y to y-1+dim do
               for k:=x to x-1+dim do
                  begin
                     gotoxy(k,i);
                     if penna=1 then write(letter)
                                else write(' ');
                     if penna=1 then pixel[k][i]:=background_color;
                  end;
     until c='q';
end.

