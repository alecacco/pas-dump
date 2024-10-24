program spacesound;
uses windows;
begin
     repeat
             case f mod 4 of
                  0:beep(350,25);
                  1:beep(300,25);
                  2:beep(250,25);
                  3:beep(200,25);
             end;
     until false;
end.
