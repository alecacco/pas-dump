program tenpasttolate;
uses dos,crt,graph;
var driver,modo:smallint;
    exs,h,m,s,boh:word;
    hour,hh,mm,ss:string;

procedure rewrites(moms:integer);
var i:integer;
begin
     for i:=1 to moms do
         begin
              setlinestyle(0,0,1);
              setcolor(random(15)+1);
              line(1,1,1280,i*12);
         end;
end;

procedure rewritem(momm:integer);
var i:integer;
begin
     for i:=1 to momm do
         begin
              setlinestyle(0,0,3);
              setcolor(10);
              line(1,i*12,1280,1);
         end;
end;

procedure rewriteh(momh:integer);
var i:integer;
begin
     for i:=1 to momh do
         begin
              setlinestyle(0,0,3);
              setcolor(1);
              line(640,1,i*53,740);
         end;
end;


begin
     randomize;
     driver:=detect;
     initgraph(driver,modo,'');
     gettime(h,m,s,boh);
     str(m,mm);
     str(s,ss);
     str(h,hh);
     settextstyle(4,0,4);
     rewriteh(h);
     rewritem(m);
     rewrites(s);
     hour:='';
     repeat
           setcolor(black);
           outtextxy(515,500,hour);
           setlinestyle(0,0,1);
           setcolor(random(15)+1);
           line(1,1,1280,s*12);
           if (s=0) then
              begin
                   gettime(h,m,s,boh);
                   cleardevice;
                   rewriteh(h);
                   rewritem(m);
                   gettime(h,m,s,boh);
                   rewrites(s);
              end;
           str(m,mm);
           str(h,hh);
           str(s,ss);
           hour:=hh+':'+mm+':'+ss;
           setcolor(white);
           outtextxy(515,500,hour);
           exs:=s;
           repeat
                 gettime(h,m,s,boh);
           until (s>exs)or((s=0)and(exs=59));
     until keypressed;
end.
