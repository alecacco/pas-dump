program ois_converter;
uses crt;
var src:text;
    sketch:array[1..1000,1..1000]of char;
    s:string;
    i,j,x,y:integer;

procedure draw;
begin
     writeln('how big your skatch will be (x/y)?');
     readln(x);
     writeln(' x ');
     readln(y);
     writeln('ok dude! let''s make your sketch.');
     for i:=3 downto 1 do
         begin
              write(i);
              delay(1000);
              delline;
         end;
     clrscr;
     for i:=1 to y do
         begin
              readln(s);
              for j:=1 to x do
                  sketch[j,i]:=s[j];
         end;
     writeln;
     writeln('end of the drawing space. where do you want to save your .ois file?');
     readln(s);
     if s<>'nowhere' then
        begin
             s:=s+'.ois';
             assign(src,s);
             rewrite(src);
             for i:=1 to y do
                 begin
                      for j:=1 to x do
                          begin
                               write(src,sketch[j,i]);
                          end;
                      writeln(src);
                 end;
             close(src);
        end
        else
        writeln('say goodbye to your art');
end;

procedure txtsave;
begin
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
             writeln(src,'var ',s,':array[1..',y,',1..',x,']of integer;');
             writeln(src,'{put this procedure in procedures position}');
             writeln(src,'procedure ',s,'_builder;');
             writeln(src,'begin');
             writeln(src,'for i:=1 to ',x,' do');
             writeln(src,'for j:=1 to ',y,' do');
             writeln(src,s,'[j,i]:=0;');
             for i:=1 to y do
                 for j:=(157 div 2){1} to x do
                     begin
                     if sketch[j,i]<>'0' then
                        case sketch[j,i] of
                             'a':writeln(src,s,'[',i,',',j,']',':=10;');
                             'b':writeln(src,s,'[',i,',',j,']',':=11;');
                             'c':writeln(src,s,'[',i,',',j,']',':=12;');
                             'd':writeln(src,s,'[',i,',',j,']',':=13;');
                             'e':writeln(src,s,'[',i,',',j,']',':=14;');
                             'f':writeln(src,s,'[',i,',',j,']',':=15;');
                             else writeln(src,s,'[',i,',',j,']',':=',sketch[j,i],';');
                        end;
                     if sketch[j,i]='7' then writeln(src,s,'[',i,',',j,']',':=',sketch[j,i],';');
                     if sketch[j,i]='7' then writeln(src,s,'[',i,',',157-j+1,']',':=',sketch[j,i],';');
                     if sketch[j,i]<>'0' then
                        case sketch[j,i] of
                             'a':writeln(src,s,'[',i,',',157-j+1,']',':=10;');
                             'b':writeln(src,s,'[',i,',',157-j+1,']',':=11;');
                             'c':writeln(src,s,'[',i,',',157-j+1,']',':=12;');
                             'd':writeln(src,s,'[',i,',',157-j+1,']',':=13;');
                             'e':writeln(src,s,'[',i,',',157-j+1,']',':=14;');
                             'f':writeln(src,s,'[',i,',',157-j+1,']',':=15;');
                             else writeln(src,s,'[',i,',',157-j+1,']',':=',sketch[j,i],';');
                        end;
                     end;
             writeln(src,'end;');
             close(src);
        end
        else
        writeln('say goodbye to your work of art');
end;

procedure load;
begin
        writeln('where is the .ois file you want to load?');
        readln(s);
        assign(src,s);
        reset(src);
        writeln('how big is your skatch (x/y)?');
        readln(x);
        writeln(' x ');
        readln(y);
        for i:=1 to y do
            begin
                 readln(src,s);
                 for j:=1 to x do
                     sketch[j,i]:=s[j]
            end;
        close(src);
        {clrscr;
        for i:=1 to x do
            for j:=1 to y do
                begin
                     gotoxy(i,j);
                     write(sketch[i,j]);
                end;   }
        repeat until keypressed;
end;

begin
     writeln('load or draw?');
     readln(s);
     if s='l' then load
              else if s='d' then draw;
     txtsave;
     writeln('finito.');
     repeat until keypressed;
end.
