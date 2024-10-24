program ois_converter;
uses crt;
var src:text;
    sketch:array[1..1000,1..1000]of char;
    s:string;
    i,j,x,y,l:integer;

procedure load;
begin
        writeln('where is the .ois file you want to load?');
        readln(s);
        assign(src,s);
        reset(src);
        x:=157;
        y:=89;
        for i:=1 to y do
            begin
                 readln(src,s);
                 for j:=1 to x do
                     sketch[j,i]:=s[j]
            end;
        close(src);
        clrscr;
        for i:=(157 div 2) to 157 do
            for j:=1 to 89 do
                begin
                     gotoxy(i,j);
                     write(sketch[i,j]);
                     gotoxy(157-i+1,j);
                     write(sketch[i,j]);
                end;
        repeat until keypressed;
end;

procedure txtsave;
begin
     l:=1;
     writeln('where do you want to save your .txt pascal instruction file?');
     readln(s);
     if s<>'nowhere' then
        begin
             s:=s+'.txt';
             assign(src,s);
             rewrite(src);
             write('give a name to your object-in-space: ');
             readln(s);
             writeln(src,'{put this in variables declaration}');
             writeln(src,'//var ',s,':array[1..',y,',1..',x,']of integer;');
             writeln(src,'{put this procedure in procedures position}');
             writeln(src,'procedure ',s,'_builder;');
             writeln(src,'begin');
             writeln(src,'for i:=1 to ',x,' do');
             writeln(src,'for j:=1 to ',y,' do');
             writeln(src,'begin');
             writeln(src,'paclab[j,i]:=0;');
             writeln(src,'pacdots[j,i]:=false;');
             writeln(src,'end;');
             for i:=1 to y do
                 for j:=(157 div 2) to x do
                     begin
                     if (sketch[j,i]<>'0')and(sketch[j,i]<>'7')and(sketch[j,i]<>'4') then
                        case sketch[j,i] of
                             'a':writeln(src,'paclab[',i,',',j,']',':=10;');
                             'b':writeln(src,'paclab[',i,',',j,']',':=11;');
                             'c':writeln(src,'paclab[',i,',',j,']',':=12;');
                             'd':writeln(src,'paclab[',i,',',j,']',':=13;');
                             'e':writeln(src,'paclab[',i,',',j,']',':=14;');
                             'f':writeln(src,'paclab[',i,',',j,']',':=15;')
                             else writeln(src,'paclab[',i,',',j,']',':=',sketch[j,i],';');
                        end;
                     if sketch[j,i]='7' then writeln(src,'pacdots[',i,',',j,']',':=true;');
                     if sketch[j,i]='7' then writeln(src,'pacdots[',i,',',157-j+1,']',':=true;');
                     if sketch[j,i]='4' then
                        begin
                             writeln(src,'sp[',l,'].x:=',j,';');
                             writeln(src,'sp[',l,'].y:=',i,';');
                             l:=l+1;
                             if j<>79 then
                                begin
                                     writeln(src,'sp[',l,'].x:=',157-j+1,';');
                                     writeln(src,'sp[',l,'].y:=',i,';');
                                     l:=l+1;
                                end;
                        end;
                     if sketch[j,i]<>'0' then
                        case sketch[j,i] of
                             'a':writeln(src,'paclab[',i,',',157-j+1,']',':=10;');
                             'b':writeln(src,'paclab[',i,',',157-j+1,']',':=11;');
                             'c':writeln(src,'paclab[',i,',',157-j+1,']',':=12;');
                             'd':writeln(src,'paclab[',i,',',157-j+1,']',':=13;');
                             'e':writeln(src,'paclab[',i,',',157-j+1,']',':=14;');
                             'f':writeln(src,'paclab[',i,',',157-j+1,']',':=15;');
                             else writeln(src,'paclab[',i,',',157-j+1,']',':=',sketch[j,i],';');
                        end;
                     end;
             writeln(src,'end;');
             close(src);
        end;
end;

begin
     load;
     txtsave;
     writeln('finito.');
     repeat until keypressed;
end.
