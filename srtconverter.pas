program srt2txt;
uses crt;
var
   line:array[0..100]of string;
   path1,path2:string;
   file1,file2:text;
   i,j:integer;

begin
     writeln('original SRT file path:');
     readln(path1);
     writeln('final file path:');
     readln(path2);
     assign(file1,path1);
     assign(file2,path2);
     reset(file1);
     rewrite(file2);
     repeat
           for i:=1 to 2 do readln(file1,line[1]);
           i:=1;
           repeat
                 readln(file1,line[i]);
                 i:=i+1;
           until line[i-1]='';
           line[0]:='';
           for j:=1 to i-2 do line[0]:=line[0]+line[j]+' ';
           writeln(file2,line[0]);
     until eof(file1);
     close(file1);
     close(file2);
     writeln('done');
     readln();
end.
