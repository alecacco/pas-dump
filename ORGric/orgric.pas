(*programma per la gestione di un ricettario
commissionato da marco mainente*)
program orgric;
uses crt,sysutils,dos;
type
    data=record
         d,m,y:string;
    end;
    book=record
         chap,rating:integer;
         name:string;
         ing,proc,com:array[1..50]of string;
         done:boolean;
         datains:data;
    end;

var
    sc,msc,k,i,j,part:integer;
    c:char;
    commands:array[1..5] of string;
    minicommands:array[1..2]of string;
    quitpar:boolean;
    books:array[1..10000]of book;
    list:array[1..10000] of integer;
    request,ricloc:string;
    selbook:integer;
	index:array[1..10000]of string;

//procedura di scrittura giustificata a dimensioni personalizzate
procedure jwrite(s:string; x,y,width,height:integer; var endx,endy:integer;endxdet,endydet:boolean);
var spos,vspos,p,wend:integer;
    noheightlimit:boolean;
begin
	spos:=0;
    if height=0 then noheightlimit:=true
                else noheightlimit:=false;
	height:=height+y;
    if s<>'' then
	  repeat
		gotoxy(x,y);
		p:=0;
        wend:=0;
		repeat	
			spos:=spos+1;
			p:=p+1;
			write(s[spos]);
            if (s[spos]=' ')or (p=1) then
               begin
                    wend:=p+1;
                    vspos:=spos+1;
                    repeat
                          vspos:=vspos+1;
                          wend:=wend+1;
                    until (s[vspos]=' ')or(vspos=length(s));
                    wend:=wend-1;
                    if vspos-spos>width then wend:=0;
               end;
		until (p=width)or(wend>width)or(spos=length(s));
		if (p=width)or(wend>width) then
                             begin
                                  y:=y+1;
                                  wend:=0;
                             end;
 	  until (spos=length(s))or((y=height)and(not noheightlimit));
    if endxdet then endx:=x+width;
    if endydet then endy:=y;
    if p=width then endy:=endy-1;
end;

//scrittura dello sfondo base del programma
procedure title;
begin
textbackground(3);
clrscr;
gotoxy(2,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(3,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(4,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(5,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(6,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(7,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(8,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(11,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(12,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(13,1);
textbackground(0);
textcolor(0);
write(' ');
gotoxy(31,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(32,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(33,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(34,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(35,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(36,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(37,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(38,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(39,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(40,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(41,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(42,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(43,1);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(44,1);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(45,1);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(46,1);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(47,1);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(48,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(49,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(50,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(51,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(52,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(53,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(54,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(55,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(56,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(57,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(58,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(59,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(60,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(61,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(62,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(63,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(64,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(65,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(66,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(67,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(68,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(69,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(70,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(71,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(72,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(73,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(74,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(75,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(76,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(77,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(78,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(79,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(80,1);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(2,2);
textbackground(0);
write(' ');
gotoxy(3,2);
write(' ');
gotoxy(4,2);
write(' ');
gotoxy(5,2);
write(' ');
gotoxy(6,2);
write(' ');
gotoxy(7,2);
write(' ');
gotoxy(8,2);
write(' ');
gotoxy(10,2);
textbackground(0);
write(' ');
gotoxy(11,2);
write(' ');
gotoxy(12,2);
write(' ');
gotoxy(13,2);
write(' ');
gotoxy(14,2);
write(' ');
gotoxy(24,2);
textbackground(1);
write(' ');
gotoxy(25,2);
write(' ');
gotoxy(26,2);
write(' ');
gotoxy(27,2);
write(' ');
gotoxy(28,2);
write(' ');
gotoxy(29,2);
write(' ');
gotoxy(30,2);
write(' ');
gotoxy(31,2);
write(' ');
gotoxy(32,2);
write(' ');
gotoxy(33,2);
write(' ');
gotoxy(34,2);
write(' ');
gotoxy(35,2);
write(' ');
gotoxy(36,2);
write(' ');
gotoxy(37,2);
write(' ');
gotoxy(38,2);
write(' ');
gotoxy(39,2);
write(' ');
gotoxy(40,2);
write(' ');
gotoxy(41,2);
write(' ');
gotoxy(42,2);
write(' ');
gotoxy(43,2);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(44,2);
textbackground(0);
write(' ');
gotoxy(45,2);
write(' ');
gotoxy(46,2);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(47,2);
textcolor(6);
write(' ');
gotoxy(48,2);
textcolor(0);
write(' ');
gotoxy(54,2);
textbackground(5);
textcolor(6);
write(' ');
gotoxy(55,2);
write(' ');
gotoxy(56,2);
write(' ');
gotoxy(65,2);
textbackground(4);
write(' ');
gotoxy(66,2);
write(' ');
gotoxy(67,2);
write(' ');
gotoxy(79,2);
textbackground(4);
write(' ');
gotoxy(80,2);
write(' ');
gotoxy(2,3);
textbackground(0);
write(' ');
gotoxy(3,3);
write(' ');
gotoxy(7,3);
textbackground(0);
write(' ');
gotoxy(8,3);
write(' ');
gotoxy(10,3);
textbackground(0);
write(' ');
gotoxy(11,3);
write(' ');
gotoxy(13,3);
textbackground(0);
write(' ');
gotoxy(14,3);
write(' ');
gotoxy(17,3);
textbackground(0);
write(' ');
gotoxy(18,3);
write(' ');
gotoxy(19,3);
write(' ');
gotoxy(20,3);
write(' ');
gotoxy(21,3);
write(' ');
gotoxy(24,3);
textbackground(1);
write(' ');
gotoxy(42,3);
textbackground(1);
write(' ');
gotoxy(44,3);
textbackground(0);
textcolor(6);
write(' ');
gotoxy(45,3);
write(' ');
gotoxy(47,3);
textbackground(4);
write(' ');
gotoxy(51,3);
textbackground(1);
textcolor(6);
write(' ');
gotoxy(52,3);
write(' ');
gotoxy(54,3);
textbackground(5);
textcolor(6);
write(' ');
gotoxy(55,3);
write(' ');
gotoxy(56,3);
write(' ');
gotoxy(57,3);
textbackground(7);
write(' ');
gotoxy(66,3);
textbackground(4);
write(' ');
gotoxy(80,3);
textbackground(4);
write(' ');
gotoxy(2,4);
textbackground(0);
write(' ');
gotoxy(3,4);
write(' ');
gotoxy(7,4);
textbackground(0);
write(' ');
gotoxy(8,4);
write(' ');
gotoxy(10,4);
textbackground(0);
write(' ');
gotoxy(11,4);
write(' ');
gotoxy(16,4);
textbackground(0);
write(' ');
gotoxy(17,4);
write(' ');
gotoxy(18,4);
write(' ');
gotoxy(19,4);
write(' ');
gotoxy(20,4);
write(' ');
gotoxy(21,4);
write(' ');
gotoxy(22,4);
write(' ');
gotoxy(24,4);
textbackground(1);
write(' ');
gotoxy(42,4);
textbackground(1);
write(' ');
gotoxy(44,4);
textbackground(0);
textcolor(6);
write(' ');
gotoxy(45,4);
write(' ');
gotoxy(47,4);
textbackground(4);
write(' ');
gotoxy(51,4);
textbackground(1);
textcolor(6);
write(' ');
gotoxy(52,4);
write(' ');
gotoxy(53,4);
textbackground(6);
write(' ');
gotoxy(54,4);
textbackground(5);
write(' ');
gotoxy(55,4);
write(' ');
gotoxy(56,4);
write(' ');
gotoxy(57,4);
textbackground(7);
write(' ');
gotoxy(58,4);
textbackground(6);
textcolor(0);
write(' ');
gotoxy(59,4);
write(' ');
gotoxy(60,4);
write(' ');
gotoxy(61,4);
write(' ');
gotoxy(62,4);
write(' ');
gotoxy(63,4);
write(' ');
gotoxy(64,4);
write(' ');
gotoxy(66,4);
textbackground(4);
write(' ');
gotoxy(80,4);
textbackground(4);
write(' ');
gotoxy(2,5);
textbackground(0);
write(' ');
gotoxy(3,5);
write(' ');
gotoxy(7,5);
textbackground(0);
write(' ');
gotoxy(8,5);
write(' ');
gotoxy(10,5);
textbackground(0);
write(' ');
gotoxy(11,5);
write(' ');
gotoxy(16,5);
textbackground(0);
write(' ');
gotoxy(17,5);
write(' ');
gotoxy(21,5);
textbackground(0);
write(' ');
gotoxy(22,5);
write(' ');
gotoxy(24,5);
textbackground(1);
write(' ');
gotoxy(42,5);
textbackground(1);
write(' ');
gotoxy(44,5);
textbackground(0);
textcolor(6);
write(' ');
gotoxy(45,5);
write(' ');
gotoxy(47,5);
textbackground(4);
write(' ');
gotoxy(49,5);
textbackground(2);
textcolor(6);
write(' ');
gotoxy(50,5);
write(' ');
gotoxy(51,5);
textbackground(1);
write(' ');
gotoxy(52,5);
write(' ');
gotoxy(53,5);
textbackground(6);
write(' ');
gotoxy(54,5);
textbackground(5);
write(' ');
gotoxy(55,5);
write(' ');
gotoxy(56,5);
write(' ');
gotoxy(57,5);
textbackground(7);
write(' ');
gotoxy(58,5);
textbackground(5);
textcolor(0);
write(' ');
gotoxy(59,5);
write(' ');
gotoxy(60,5);
write(' ');
gotoxy(61,5);
write(' ');
gotoxy(62,5);
write(' ');
gotoxy(63,5);
write(' ');
gotoxy(64,5);
write(' ');
gotoxy(65,5);
write(' ');
gotoxy(66,5);
textbackground(4);
write(' ');
gotoxy(80,5);
write(' ');
gotoxy(2,6);
textbackground(0);
write(' ');
gotoxy(3,6);
write(' ');
gotoxy(7,6);
write(' ');
gotoxy(8,6);
write(' ');
gotoxy(10,6);
write(' ');
gotoxy(11,6);
write(' ');
gotoxy(16,6);
write(' ');
gotoxy(17,6);
write(' ');
gotoxy(21,6);
write(' ');
gotoxy(22,6);
write(' ');
gotoxy(24,6);
textbackground(1);
write(' ');
gotoxy(42,6);
write(' ');
gotoxy(44,6);
textbackground(0);
textcolor(6);
write(' ');
gotoxy(45,6);
write(' ');
gotoxy(47,6);
textbackground(4);
write(' ');
gotoxy(49,6);
textbackground(2);
textcolor(6);
write(' ');
gotoxy(50,6);
write(' ');
gotoxy(51,6);
textbackground(1);
write(' ');
gotoxy(52,6);
write(' ');
gotoxy(53,6);
textbackground(6);
write(' ');
gotoxy(54,6);
textbackground(5);
write(' ');
gotoxy(55,6);
write(' ');
gotoxy(56,6);
write(' ');
gotoxy(57,6);
textbackground(7);
write(' ');
gotoxy(58,6);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(59,6);
write(' ');
gotoxy(60,6);
write(' ');
gotoxy(61,6);
write(' ');
gotoxy(62,6);
write(' ');
gotoxy(66,6);
textbackground(4);
write(' ');
gotoxy(80,6);
write(' ');
gotoxy(2,7);
textbackground(0);
write(' ');
gotoxy(3,7);
write(' ');
gotoxy(4,7);
write(' ');
gotoxy(5,7);
write(' ');
gotoxy(6,7);
write(' ');
gotoxy(7,7);
write(' ');
gotoxy(8,7);
write(' ');
gotoxy(10,7);
textbackground(0);
write(' ');
gotoxy(11,7);
write(' ');
gotoxy(16,7);
write(' ');
gotoxy(17,7);
write(' ');
gotoxy(18,7);
write(' ');
gotoxy(19,7);
write(' ');
gotoxy(20,7);
write(' ');
gotoxy(21,7);
write(' ');
gotoxy(22,7);
write(' ');
gotoxy(24,7);
textbackground(1);
write(' ');
gotoxy(42,7);
write(' ');
gotoxy(44,7);
textbackground(0);
textcolor(6);
write(' ');
gotoxy(45,7);
write(' ');
gotoxy(47,7);
textbackground(4);
write(' ');
gotoxy(49,7);
textbackground(2);
textcolor(6);
write(' ');
gotoxy(50,7);
write(' ');
gotoxy(51,7);
textbackground(1);
write(' ');
gotoxy(52,7);
write(' ');
gotoxy(53,7);
textbackground(6);
write(' ');
gotoxy(54,7);
textbackground(5);
write(' ');
gotoxy(55,7);
write(' ');
gotoxy(56,7);
write(' ');
gotoxy(57,7);
textbackground(7);
write(' ');
gotoxy(59,7);
textbackground(0);
write(' ');
gotoxy(60,7);
write(' ');
gotoxy(61,7);
write(' ');
gotoxy(62,7);
write(' ');
gotoxy(63,7);
write(' ');
gotoxy(64,7);
write(' ');
gotoxy(66,7);
textbackground(4);
write(' ');
gotoxy(80,7);
write(' ');
gotoxy(2,8);
textbackground(0);
write(' ');
gotoxy(3,8);
write(' ');
gotoxy(4,8);
write(' ');
gotoxy(5,8);
write(' ');
gotoxy(6,8);
write(' ');
gotoxy(7,8);
write(' ');
gotoxy(8,8);
write(' ');
gotoxy(10,8);
textbackground(0);
write(' ');
gotoxy(11,8);
write(' ');
gotoxy(17,8);
write(' ');
gotoxy(18,8);
write(' ');
gotoxy(19,8);
write(' ');
gotoxy(20,8);
write(' ');
gotoxy(21,8);
write(' ');
gotoxy(22,8);
write(' ');
gotoxy(24,8);
textbackground(1);
write(' ');
gotoxy(25,8);
write(' ');
gotoxy(26,8);
write(' ');
gotoxy(27,8);
write(' ');
gotoxy(28,8);
write(' ');
gotoxy(29,8);
write(' ');
gotoxy(30,8);
write(' ');
gotoxy(31,8);
write(' ');
gotoxy(32,8);
write(' ');
gotoxy(33,8);
write(' ');
gotoxy(34,8);
write(' ');
gotoxy(35,8);
write(' ');
gotoxy(36,8);
write(' ');
gotoxy(37,8);
write(' ');
gotoxy(38,8);
write(' ');
gotoxy(39,8);
write(' ');
gotoxy(40,8);
write(' ');
gotoxy(41,8);
write(' ');
gotoxy(42,8);
write(' ');
gotoxy(43,8);
textbackground(4);
textcolor(6);
write(' ');
gotoxy(44,8);
textbackground(0);
write(' ');
gotoxy(45,8);
write(' ');
gotoxy(46,8);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(47,8);
textcolor(6);
write(' ');
gotoxy(48,8);
textcolor(0);
write(' ');
gotoxy(49,8);
textbackground(2);
textcolor(6);
write(' ');
gotoxy(50,8);
write(' ');
gotoxy(51,8);
textbackground(1);
write(' ');
gotoxy(52,8);
write(' ');
gotoxy(53,8);
textbackground(6);
write(' ');
gotoxy(54,8);
textbackground(5);
write(' ');
gotoxy(55,8);
write(' ');
gotoxy(56,8);
write(' ');
gotoxy(57,8);
textbackground(7);
write(' ');
gotoxy(58,8);
textbackground(2);
write(' ');
gotoxy(59,8);
write(' ');
gotoxy(60,8);
write(' ');
gotoxy(61,8);
write(' ');
gotoxy(62,8);
write(' ');
gotoxy(63,8);
write(' ');
gotoxy(64,8);
write(' ');
gotoxy(65,8);
textbackground(4);
textcolor(0);
write(' ');
gotoxy(66,8);
write(' ');
gotoxy(80,8);
textbackground(4);
write(' ');
gotoxy(1,9);
textcolor(0);
write(' ');
gotoxy(2,9);
write(' ');
gotoxy(3,9);
write(' ');
gotoxy(4,9);
write(' ');
gotoxy(5,9);
write(' ');
gotoxy(6,9);
write(' ');
gotoxy(7,9);
write(' ');
gotoxy(8,9);
write(' ');
gotoxy(9,9);
write(' ');
gotoxy(10,9);
write(' ');
gotoxy(11,9);
write(' ');
gotoxy(12,9);
write(' ');
gotoxy(13,9);
write(' ');
gotoxy(14,9);
write(' ');
gotoxy(15,9);
write(' ');
gotoxy(16,9);
write(' ');
gotoxy(17,9);
write(' ');
gotoxy(18,9);
write(' ');
gotoxy(19,9);
write(' ');
gotoxy(20,9);
write(' ');
gotoxy(21,9);
textbackground(0);
write(' ');
gotoxy(22,9);
write(' ');
gotoxy(23,9);
textbackground(4);
write(' ');
gotoxy(24,9);
write(' ');
gotoxy(25,9);
write(' ');
gotoxy(26,9);
write(' ');
gotoxy(27,9);
write(' ');
gotoxy(28,9);
write(' ');
gotoxy(29,9);
write(' ');
gotoxy(30,9);
write(' ');
gotoxy(31,9);
write(' ');
gotoxy(32,9);
write(' ');
gotoxy(33,9);
write(' ');
gotoxy(34,9);
write(' ');
gotoxy(35,9);
write(' ');
gotoxy(36,9);
write(' ');
gotoxy(37,9);
write(' ');
gotoxy(38,9);
write(' ');
gotoxy(39,9);
write(' ');
gotoxy(40,9);
write(' ');
gotoxy(41,9);
write(' ');
gotoxy(42,9);
write(' ');
gotoxy(43,9);
textcolor(6);
write(' ');
gotoxy(44,9);
write(' ');
gotoxy(45,9);
write(' ');
gotoxy(46,9);
write(' ');
gotoxy(47,9);
write(' ');
gotoxy(48,9);
textcolor(0);
write(' ');
gotoxy(49,9);
textcolor(6);
write(' ');
gotoxy(50,9);
write(' ');
gotoxy(51,9);
textcolor(0);
write(' ');
gotoxy(52,9);
write(' ');
gotoxy(53,9);
write(' ');
gotoxy(54,9);
write(' ');
gotoxy(55,9);
write(' ');
gotoxy(56,9);
write(' ');
gotoxy(57,9);
write(' ');
gotoxy(58,9);
write(' ');
gotoxy(59,9);
write(' ');
gotoxy(60,9);
write(' ');
gotoxy(61,9);
write(' ');
gotoxy(62,9);
write(' ');
gotoxy(63,9);
write(' ');
gotoxy(64,9);
write(' ');
gotoxy(65,9);
write(' ');
gotoxy(66,9);
write(' ');
gotoxy(80,9);
textbackground(4);
write(' ');
gotoxy(10,10);
textbackground(1);
write(' ');
gotoxy(11,10);
write(' ');
gotoxy(12,10);
write(' ');
gotoxy(13,10);
write(' ');
gotoxy(14,10);
write(' ');
gotoxy(16,10);
textbackground(0);
write(' ');
gotoxy(17,10);
write(' ');
gotoxy(21,10);
write(' ');
gotoxy(22,10);
write(' ');
gotoxy(23,10);
textbackground(4);
write(' ');
gotoxy(24,10);
write(' ');
gotoxy(25,10);
write(' ');
gotoxy(26,10);
write(' ');
gotoxy(27,10);
write(' ');
gotoxy(28,10);
write(' ');
gotoxy(29,10);
write(' ');
gotoxy(30,10);
write(' ');
gotoxy(31,10);
write(' ');
gotoxy(32,10);
write(' ');
gotoxy(33,10);
textcolor(6);
write(' ');
gotoxy(34,10);
write(' ');
gotoxy(35,10);
textcolor(0);
write(' ');
gotoxy(36,10);
write(' ');
gotoxy(37,10);
write(' ');
gotoxy(38,10);
write(' ');
gotoxy(39,10);
write(' ');
gotoxy(40,10);
write(' ');
gotoxy(41,10);
write(' ');
gotoxy(42,10);
write(' ');
gotoxy(66,10);
textbackground(4);
write(' ');
gotoxy(80,10);
write(' ');
gotoxy(10,11);
textbackground(1);
write(' ');
gotoxy(11,11);
write(' ');
gotoxy(12,11);
write(' ');
gotoxy(13,11);
write(' ');
gotoxy(14,11);
write(' ');
gotoxy(15,11);
write(' ');
gotoxy(16,11);
textbackground(0);
write(' ');
gotoxy(17,11);
write(' ');
gotoxy(18,11);
write(' ');
gotoxy(19,11);
write(' ');
gotoxy(20,11);
write(' ');
gotoxy(21,11);
write(' ');
gotoxy(22,11);
write(' ');
gotoxy(24,11);
textbackground(5);
write(' ');
gotoxy(25,11);
write(' ');
gotoxy(31,11);
textbackground(4);
write(' ');
gotoxy(66,11);
write(' ');
gotoxy(80,11);
write(' ');
gotoxy(10,12);
textbackground(1);
write(' ');
gotoxy(11,12);
write(' ');
gotoxy(14,12);
write(' ');
gotoxy(15,12);
write(' ');
gotoxy(17,12);
textbackground(0);
write(' ');
gotoxy(18,12);
write(' ');
gotoxy(19,12);
write(' ');
gotoxy(20,12);
write(' ');
gotoxy(21,12);
write(' ');
gotoxy(24,12);
textbackground(5);
write(' ');
gotoxy(25,12);
write(' ');
gotoxy(31,12);
textbackground(4);
write(' ');
gotoxy(66,12);
write(' ');
gotoxy(67,12);
write(' ');
gotoxy(79,12);
write(' ');
gotoxy(80,12);
write(' ');
gotoxy(10,13);
textbackground(1);
write(' ');
gotoxy(11,13);
write(' ');
gotoxy(14,13);
write(' ');
gotoxy(15,13);
write(' ');
gotoxy(17,13);
textbackground(6);
write(' ');
gotoxy(18,13);
write(' ');
gotoxy(19,13);
write(' ');
gotoxy(24,13);
textbackground(5);
write(' ');
gotoxy(25,13);
write(' ');
gotoxy(31,13);
textbackground(4);
write(' ');
gotoxy(66,13);
write(' ');
gotoxy(67,13);
write(' ');
gotoxy(68,13);
write(' ');
gotoxy(69,13);
write(' ');
gotoxy(70,13);
write(' ');
gotoxy(71,13);
write(' ');
gotoxy(72,13);
write(' ');
gotoxy(73,13);
write(' ');
gotoxy(74,13);
write(' ');
gotoxy(75,13);
write(' ');
gotoxy(76,13);
write(' ');
gotoxy(77,13);
write(' ');
gotoxy(78,13);
write(' ');
gotoxy(79,13);
write(' ');
gotoxy(80,13);
write(' ');
gotoxy(10,14);
textbackground(1);
write(' ');
gotoxy(11,14);
write(' ');
gotoxy(12,14);
write(' ');
gotoxy(13,14);
write(' ');
gotoxy(14,14);
write(' ');
gotoxy(17,14);
textbackground(6);
write(' ');
gotoxy(18,14);
write(' ');
gotoxy(19,14);
write(' ');
gotoxy(22,14);
textbackground(7);
write(' ');
gotoxy(23,14);
write(' ');
gotoxy(24,14);
write(' ');
gotoxy(25,14);
write(' ');
gotoxy(26,14);
write(' ');
gotoxy(27,14);
write(' ');
gotoxy(31,14);
textbackground(4);
write(' ');
gotoxy(80,14);
write(' ');
gotoxy(10,15);
textbackground(1);
write(' ');
gotoxy(11,15);
write(' ');
gotoxy(12,15);
write(' ');
gotoxy(13,15);
write(' ');
gotoxy(17,15);
textbackground(6);
write(' ');
gotoxy(18,15);
write(' ');
gotoxy(19,15);
write(' ');
gotoxy(21,15);
textbackground(7);
write(' ');
gotoxy(22,15);
write(' ');
gotoxy(23,15);
write(' ');
gotoxy(24,15);
write(' ');
gotoxy(25,15);
write(' ');
gotoxy(26,15);
write(' ');
gotoxy(27,15);
write(' ');
gotoxy(28,15);
write(' ');
gotoxy(31,15);
textbackground(4);
write(' ');
gotoxy(80,15);
write(' ');
gotoxy(10,16);
textbackground(1);
write(' ');
gotoxy(11,16);
write(' ');
gotoxy(12,16);
write(' ');
gotoxy(13,16);
write(' ');
gotoxy(14,16);
write(' ');
gotoxy(17,16);
textbackground(6);
write(' ');
gotoxy(18,16);
write(' ');
gotoxy(19,16);
write(' ');
gotoxy(21,16);
textbackground(7);
write(' ');
gotoxy(22,16);
write(' ');
gotoxy(24,16);
textbackground(5);
write(' ');
gotoxy(25,16);
write(' ');
gotoxy(27,16);
textbackground(7);
write(' ');
gotoxy(28,16);
write(' ');
gotoxy(31,16);
textbackground(4);
write(' ');
gotoxy(80,16);
write(' ');
gotoxy(10,17);
textbackground(1);
write(' ');
gotoxy(11,17);
write(' ');
gotoxy(13,17);
write(' ');
gotoxy(14,17);
write(' ');
gotoxy(17,17);
textbackground(6);
write(' ');
gotoxy(18,17);
write(' ');
gotoxy(19,17);
write(' ');
gotoxy(21,17);
textbackground(7);
write(' ');
gotoxy(22,17);
write(' ');
gotoxy(24,17);
textbackground(5);
write(' ');
gotoxy(25,17);
write(' ');
gotoxy(31,17);
textbackground(4);
write(' ');
gotoxy(80,17);
write(' ');
gotoxy(10,18);
textbackground(1);
write(' ');
gotoxy(11,18);
write(' ');
gotoxy(13,18);
write(' ');
gotoxy(14,18);
write(' ');
gotoxy(15,18);
write(' ');
gotoxy(17,18);
textbackground(6);
write(' ');
gotoxy(18,18);
write(' ');
gotoxy(19,18);
write(' ');
gotoxy(21,18);
textbackground(7);
write(' ');
gotoxy(22,18);
write(' ');
gotoxy(24,18);
textbackground(5);
write(' ');
gotoxy(25,18);
write(' ');
gotoxy(31,18);
textbackground(4);
write(' ');
gotoxy(80,18);
write(' ');
gotoxy(10,19);
textbackground(1);
write(' ');
gotoxy(11,19);
write(' ');
gotoxy(14,19);
write(' ');
gotoxy(15,19);
write(' ');
gotoxy(17,19);
textbackground(6);
write(' ');
gotoxy(18,19);
write(' ');
gotoxy(19,19);
write(' ');
gotoxy(21,19);
textbackground(7);
write(' ');
gotoxy(22,19);
write(' ');
gotoxy(24,19);
textbackground(5);
write(' ');
gotoxy(25,19);
write(' ');
gotoxy(31,19);
textbackground(4);
write(' ');
gotoxy(80,19);
write(' ');
gotoxy(10,20);
textbackground(1);
write(' ');
gotoxy(11,20);
write(' ');
gotoxy(14,20);
write(' ');
gotoxy(15,20);
write(' ');
gotoxy(17,20);
textbackground(6);
write(' ');
gotoxy(18,20);
write(' ');
gotoxy(19,20);
write(' ');
gotoxy(21,20);
textbackground(7);
write(' ');
gotoxy(22,20);
write(' ');
gotoxy(24,20);
textbackground(5);
write(' ');
gotoxy(25,20);
write(' ');
gotoxy(31,20);
textbackground(4);
write(' ');
gotoxy(80,20);
write(' ');
gotoxy(17,21);
textbackground(6);
write(' ');
gotoxy(18,21);
write(' ');
gotoxy(19,21);
write(' ');
gotoxy(21,21);
textbackground(7);
write(' ');
gotoxy(22,21);
write(' ');
gotoxy(24,21);
textbackground(5);
write(' ');
gotoxy(25,21);
write(' ');
gotoxy(31,21);
textbackground(4);
write(' ');
gotoxy(80,21);
write(' ');
gotoxy(17,22);
textbackground(6);
write(' ');
gotoxy(18,22);
write(' ');
gotoxy(19,22);
write(' ');
gotoxy(21,22);
textbackground(7);
write(' ');
gotoxy(22,22);
write(' ');
gotoxy(24,22);
textbackground(5);
write(' ');
gotoxy(25,22);
write(' ');
gotoxy(27,22);
textbackground(7);
write(' ');
gotoxy(28,22);
write(' ');
gotoxy(31,22);
textbackground(4);
write(' ');
gotoxy(80,22);
write(' ');
textbackground(3);
textcolor(0);
gotoxy(2,23);
write('A');
gotoxy(3,23);
write('l');
gotoxy(4,23);
write('e');
gotoxy(5,23);
write('s');
gotoxy(6,23);
write('s');
gotoxy(7,23);
write('a');
gotoxy(8,23);
write('n');
gotoxy(9,23);
write('d');
gotoxy(10,23);
write('r');
gotoxy(11,23);
write('o');
gotoxy(21,23);
textbackground(7);
write(' ');
gotoxy(22,23);
write(' ');
gotoxy(23,23);
write(' ');
gotoxy(24,23);
textbackground(5);
write(' ');
gotoxy(25,23);
write(' ');
gotoxy(26,23);
textbackground(7);
write(' ');
gotoxy(27,23);
write(' ');
gotoxy(28,23);
write(' ');
gotoxy(31,23);
textbackground(4);
write(' ');
gotoxy(32,23);
write(' ');
gotoxy(79,23);
write(' ');
gotoxy(80,23);
write(' ');
gotoxy(5,24);
textbackground(3);
write(' ');
textcolor(0);
gotoxy(9,24);
write('C');
gotoxy(10,24);
write('a');
gotoxy(11,24);
write('c');
gotoxy(12,24);
write('c');
gotoxy(13,24);
write('o');
gotoxy(22,24);
textbackground(7);
write(' ');
gotoxy(23,24);
write(' ');
gotoxy(24,24);
textbackground(5);
write(' ');
gotoxy(25,24);
write(' ');
gotoxy(26,24);
textbackground(7);
write(' ');
gotoxy(27,24);
write(' ');
gotoxy(31,24);
textbackground(4);
write(' ');
gotoxy(32,24);
write(' ');
gotoxy(33,24);
write(' ');
gotoxy(34,24);
write(' ');
gotoxy(35,24);
write(' ');
gotoxy(36,24);
write(' ');
gotoxy(37,24);
write(' ');
gotoxy(38,24);
write(' ');
gotoxy(39,24);
write(' ');
gotoxy(40,24);
write(' ');
gotoxy(41,24);
write(' ');
gotoxy(42,24);
write(' ');
gotoxy(43,24);
write(' ');
gotoxy(44,24);
write(' ');
gotoxy(45,24);
write(' ');
gotoxy(46,24);
write(' ');
gotoxy(47,24);
write(' ');
gotoxy(48,24);
write(' ');
gotoxy(49,24);
write(' ');
gotoxy(50,24);
write(' ');
gotoxy(51,24);
write(' ');
gotoxy(52,24);
write(' ');
gotoxy(53,24);
write(' ');
gotoxy(54,24);
write(' ');
gotoxy(55,24);
write(' ');
gotoxy(56,24);
write(' ');
gotoxy(57,24);
write(' ');
gotoxy(58,24);
write(' ');
gotoxy(59,24);
write(' ');
gotoxy(60,24);
write(' ');
gotoxy(61,24);
write(' ');
gotoxy(62,24);
write(' ');
gotoxy(63,24);
write(' ');
gotoxy(64,24);
write(' ');
gotoxy(65,24);
write(' ');
gotoxy(66,24);
write(' ');
gotoxy(67,24);
write(' ');
gotoxy(68,24);
write(' ');
gotoxy(69,24);
write(' ');
gotoxy(70,24);
write(' ');
gotoxy(71,24);
write(' ');
gotoxy(72,24);
write(' ');
gotoxy(73,24);
write(' ');
gotoxy(74,24);
write(' ');
gotoxy(75,24);
write(' ');
gotoxy(76,24);
write(' ');
gotoxy(77,24);
write(' ');
gotoxy(78,24);
write(' ');
gotoxy(79,24);
write(' ');
gotoxy(80,24);
write(' ');
textbackground(3);
textcolor(red);
jwrite('ricettario in uso: '+ricloc,26,4,15,4,i,j,false,false);
{gotoxy(29,4);
write('copyright');
gotoxy(26,5);
write('Cacco Alessandro');
gotoxy(31,6);
write('2013');           }
textcolor(lightgreen);
gotoxy(3,21);
write('developed by');
gotoxy(6,22);
write('by');
textcolor(black);
end;

//funzione che restituisce il patch della directory corrente
function currentdir:string;
begin
     getdir (0,currentdir);
end;

//funzione di paragone parziale di due stringhe
function compare(term1,term2:string; long:integer):boolean;
var p:integer;
begin
     compare:=true;
     for p:=1 to long do
         if term1[p]<>term2[p] then compare:=false;
end;

//funzione di verifica se una stringa è un numero
function isnum(req:string):boolean;
begin
     isnum:=true;
     for i:=1 to length(req)do
         if (req[i]<>'0')
            and(req[i]<>'1')
            and(req[i]<>'2')
            and(req[i]<>'3')
            and(req[i]<>'4')
            and(req[i]<>'5')
            and(req[i]<>'6')
            and(req[i]<>'7')
            and(req[i]<>'8')
            and(req[i]<>'9')
            then isnum:=false;
     if length(req)=0 then isnum:=false;
end;

//procedura che legge nella directory corrente una file in cui c'è scritto il patch dell'ultimo ricettario.
//se questo non è presente viene creato e viene impostato al ricettario "default.ypr"
//se il ricettario, qualunque sia, non è presente, viene creato e/o caricato il ricettario "default.ypr"
procedure getricloc;
var ricettario:text;
begin
     assign(ricettario,currentdir+'\default.ypr');
     {$I-}
     reset(ricettario);
     {$I+}
     if IOResult<>0 then rewrite(ricettario);
     close(ricettario);
     assign(ricettario,currentdir+'\ricettario.set');
     {$I-}
     reset(ricettario);
     {$I+}
     if IOResult=0 then readln(ricettario,ricloc)
                   else
                       begin
                            rewrite(ricettario);
                            writeln(ricettario,currentdir+'\default.ypr');
                       end;
     close(ricettario);
     assign(ricettario,ricloc);
     {$I-}
     reset(ricettario);
     {$I+}
     if IOResult<>0 then ricloc:=currentdir+'\default.ypr';
     close(ricettario);
end;

//procedura che salva su file il ricettario appena chiuso, sovrascrivendo eventuali file già presenti
procedure savericloc;
var ricettario:text;
begin
     assign(ricettario,currentdir+'\ricettario.set');
     rewrite(ricettario);
     writeln(ricettario,ricloc);
     close(ricettario);
end;

//procedura che resetta uno specifico record di ricetta(book)
procedure resetbook(which:integer);
var line:string;	
    p:integer;
begin
     with books[which] do
              begin
                   str(which,line);
				   index[which]:='-index'+line+'-';
				   name:='-no name-';
                   for p:=1 to 50 do
                       begin
                            ing[p]:='**!no ingredients!**';
                            proc[p]:='**!no procedure specified!**';
                            com[p]:='**!no comment!**';
                       end;
                   chap:=0;
                   done:=false;
                   datains.y:='--';
                   datains.m:='--';
                   datains.d:='--';
                   rating:=0;
              end;
end;

//procedura che scrive un dato messaggio a contrasto elevato, sull'ultima riga, allineato a destra. 
//(utilizzata per avvisi all'utente)
procedure shortmessage(s:string);
begin
     gotoxy(56+24-length(s),25);
     textbackground(7);
     textcolor(12);
     write(s);
end;

//procedura di caricamento di un ricettario nel programma
procedure loadric(where:string);
var ric:text;
    line:string;
    s,b:integer;
begin
     shortmessage('CARICAMENTO in corso...');
	 for i:=1 to 10000 do resetbook(i);
     s:=0;
     b:=0;
	 assign(ric,where);
     reset(ric);
     while not eof(ric) do
     begin
     	   readln(ric,line);
           if compare('>chap',line,5) then 
				begin
					s:=s+1;
					readln(ric,line);
					if line[1]<>'>' then index[s]:=line;
				end;
           if compare('>book',line,4+1)then
              begin
                   b:=b+1;
                   books[b].chap:=s;
              end;
           if compare('>ing',line,3+1)then
              begin
                   readln(ric,line);
                   i:=0;
                   while (line<>'>ending')or(i=50) do
                         begin
                              i:=i+1;
                              books[b].ing[i]:=line;
                              readln(ric,line);
                         end;
              end;
           if compare('>proc',line,4+1)then
              begin
                   readln(ric,line);
                   i:=0;
                   while (line<>'>endproc')or(i=50) do
                         begin
                              i:=i+1;
                              books[b].proc[i]:=line;
                              readln(ric,line);
                         end;
              end;
           if compare('>com',line,4)then
              begin
                   readln(ric,line);
                   i:=0;
                   while (line<>'>endcom')or(i=50) do
                         begin
                              i:=i+1;
                              books[b].com[i]:=line;
                              readln(ric,line);
                         end;
              end;
           if compare('>name',line,4+1)then
              begin
                   readln(ric,line);
                   books[b].name:=line;
              end;
           if compare('>rating',line,7)then
              begin
                   readln(ric,line);
                   val(line,books[b].rating);
              end;
           if compare('>done',line,4+1)then
              begin
                   books[b].done:=true;
              end;
           if compare('>datains',line,7+1)then
              begin
                   readln(ric,line);
                   books[b].datains.d:=line;
                   readln(ric,line);
                   books[b].datains.m:=line;
                   readln(ric,line);
                   books[b].datains.y:=line;
              end;
     end;
     close(ric);
     gotoxy(56,25);
     textbackground(3);
     write('                       ');
end;

//funzione atta a individuare la presenza di libri in un dato capitolo NUMERICO
function anybookthere(s:integer):boolean;
begin
     anybookthere:=false;
     for j:=1 to 10000 do
         if books[j].chap=s then anybookthere:=true;
end;

//procedura che salva l'intero ricettario su file
procedure saveric(where:string);
var ric:text;
begin
     shortmessage('SALVATAGGIO in corso...');
     assign(ric,where);
     rewrite(ric);
     for i:=1 to 10000 do
       begin
         if anybookthere(i) then 
			begin
				writeln(ric,'>chap');
				writeln(ric,index[i]);
			end;
         for j:=1 to 10000 do
             if books[j].chap=i then
                begin
                     writeln(ric,'>book');
                     if books[j].name<>'-no name-' then
                        begin
                             writeln(ric,'>name');
                             writeln(ric,books[j].name);
                        end;
                     if books[j].ing[1]<>'**!no ingredients!**' then
                        begin
                             writeln(ric,'>ing');
                             k:=1;
                             while books[j].ing[k]<>'**!no ingredients!**' do
                               begin
                                   writeln(ric,books[j].ing[k]);
                                   k:=k+1;
                               end;
                             writeln(ric,'>ending');
                        end;
                     if books[j].proc[1]<>'**!no procedure specified!**' then
                        begin
                             writeln(ric,'>proc');
                             k:=1;
                             while books[j].proc[k]<>'**!no procedure specified!**' do
                               begin
                                   writeln(ric,books[j].proc[k]);
                                   k:=k+1;
                               end;
                             writeln(ric,'>endproc');
                        end;
                     if books[j].com[1]<>'**!no comment!**' then
                        begin
                             writeln(ric,'>com');
                             k:=1;
                             while books[j].com[k]<>'**!no comment!**' do
                               begin
                                   writeln(ric,books[j].com[k]);
                                   k:=k+1;
                               end;
                             writeln(ric,'>endcom');
                        end;
                     if books[j].rating<>0 then
                        begin
                             writeln(ric,'>rating');
                             writeln(ric,books[j].rating);
                        end;
                     if books[j].done then
                        begin
                             writeln(ric,'>done');
                             writeln(ric,books[j].done);
                        end;
                     if (books[j].datains.y<>'--')or(books[j].datains.m<>'--')or(books[j].datains.d<>'--') then
                        writeln(ric,'>datains');
                     if books[j].datains.d<>'--' then writeln(ric,books[j].datains.d) else writeln;
                     if books[j].datains.m<>'--' then writeln(ric,books[j].datains.m) else writeln;
                     if books[j].datains.y<>'--' then writeln(ric,books[j].datains.y) else writeln;

                end;
       end;
     close(ric);
     gotoxy(56,25);
     textbackground(3);
     write('                       ');
end;

//funzione di taglio selettivo di una stringa
function cutstr(s:string; scut,ecut:integer):string;
var p:integer;
begin
	cutstr:='';
	if scut>length(s) then scut:=length(s);
	if ecut>length(s) then ecut:=length(s);
	for p:=scut to ecut do 
		cutstr:=cutstr+s[p];
end;

//procedura che scrive a video in un preciso box le informazioni del libro selezionato (selbook)
procedure writebookbox;
begin
     textcolor(lightred);
     jwrite(upcase(index[books[selbook].chap]),68,3,11,3,i,j,false,true);
     textcolor(lightgreen);
     jwrite(books[selbook].name,68,j+2,11,10-j,i,j,false,false);
     textcolor(yellow);
     gotoxy(71,12);
     for i:=1 to books[selbook].rating do write('*');

end;

//procedura di caricamento voci del menù secondario
procedure loadminicommands;
begin
     case sc of
          3:
            begin
                 minicommands[1]:='---cerca per nome---';
                 minicommands[2]:='-cerca per capitolo-';
            end;
          5:
            begin
                 minicommands[1]:='------salvare-------';
                 minicommands[2]:='----non salvare-----';
            end;
          4:
            begin
                 minicommands[1]:='---non cancellare---';
                 minicommands[2]:='-----cancellare-----';
            end;
     end;
end;

//procedura di caricamento voci del menù primario
procedure loadcommands(ch:integer);
begin
case ch of
   0:
         begin
              commands[1]:='--visione generale--';
              commands[2]:='-ins. nuova ricetta-';
              commands[3]:='---cerca ricetta----';
              commands[4]:='-cambia  ricettario-';
              commands[5]:='-------uscita-------';
         end;
   1:
        begin
              commands[1]:='--visione ricetta---';
              commands[2]:='--modifica ricetta--';
              commands[3]:='---sposta ricetta---';
              commands[4]:='--cancella ricetta--';
              commands[5]:='------indietro------';
        end;
   end;
end;

//procedura che crea il menù interattivo secondario, alla destra del primario (per scelte binarie)
procedure minimenu(wat:string);
begin
    loadminicommands;
    gotoxy(35,11+(sc*2));
    textbackground(6);
    write(commands[sc]);
    gotoxy(58,15);
    textcolor(lightgreen);
    textbackground(3);
    write(wat);
    textcolor(lightgray);
    textbackground(black);
    msc:=1;
    textcolor(black);
    while keypressed do c:=readkey;
    repeat
          k:=1;
          textbackground(lightgray);
          for i:=1 to 2 do
              begin
                   gotoxy(58,15+(i*2));
                   write(minicommands[i]);
              end;
          repeat
              k:=k+1;
              gotoxy(58,15+(msc*2));
              case msc of
                1: begin
                      if k mod 2=1 then  textbackground(lightgray);
                      if k mod 2=0 then
                         case sc of
                              3: textbackground(yellow)
                              else
                              textbackground(green);
                         end;
                   end;
                2: begin
                      if k mod 2=1 then  textbackground(lightgray);
                      if k mod 2=0 then
                         case sc of
                              3: textbackground(yellow)
                              else
                              textbackground(red);
                         end;
                    end;
              end;
              write(minicommands[msc]);
			  i:=0;
			  repeat
				delay(100);
				i:=i+1;
	          until keypressed or (i=5);
          until keypressed;
          c:=readkey;
          if c=#0 then
             begin
                  c:=readkey;
                  case c of
                       #72:c:='w';
                       #80:c:='s';
                       #77:c:=' ';
					   #75:c:='q';
                  end;
             end;
		  if c=#13 then c:=' ';
          if upcase(c)='W' then msc:=msc-1;
          if upcase(c)='S' then msc:=msc+1;
          if upcase(c)='D' then c:=' ';
          if msc=0 then msc:=2;
          if msc=3 then msc:=1;
    until c=' ';
    textbackground(3);
    for i:=1 to 2 do
        begin
             gotoxy(58,15+(i*2));
             for j:=1 to 20 do write(' ');
        end;
end;

//procedura che crea il menù interattivo primario, al centro della console (per scelte multiple di 5 opzioni)
procedure menu;
begin
    textcolor(lightgray);
    textbackground(black);
    clrscr;
    title;
    if part=1 then writebookbox;
    textcolor(lightgray);
    textbackground(black);
    sc:=1;
    textcolor(black);
    if keypressed then c:=readkey;
    if keypressed then c:=readkey;
    repeat
          k:=1;
          textbackground(lightgray);
          for i:=1 to 5 do
              begin
                   gotoxy(35,11+(i*2));
                   write(commands[i]);
              end;
          repeat
              k:=k+1;
              case sc of
                1: begin
                      if k mod 2=0 then  textbackground(yellow);
                      if k mod 2=1 then  textbackground(lightgray);
                   end;
                2: begin
                      if k mod 2=0 then  textbackground(yellow);
                      if k mod 2=1 then  textbackground(lightgray);
                   end;
                3: begin
                      if k mod 2=0 then  textbackground(yellow);
                      if k mod 2=1 then  textbackground(lightgray);
                   end;
                4: begin
                      if k mod 2=1 then  textbackground(lightgray);
                      if k mod 2=0 then
                         case part of
                              0: textbackground(yellow);
                              1: textbackground(red);
                         end;
                   end;
                5: begin
                      if k mod 2=1 then  textbackground(lightgray);
                      if k mod 2=0 then
                         case part of
                              0: textbackground(red);
                              1: textbackground(lightgreen);
                         end;
                    end;
              end;
              gotoxy(35,11+(sc*2));
              write(commands[sc]);
			  i:=0;
			  repeat
				delay(100);
				i:=i+1;
	          until keypressed or (i=5);
          until keypressed;
          c:=readkey;
          if c=#0 then
             begin
                  c:=readkey;
                  case c of
                       #72:c:='w';
                       #80:c:='s';
                       #77:c:=' ';
					   #75:c:='q';
                  end;
             end;
          if (upcase(c)='Q')or(upcase(c)='B') then sc:=5;
		  if c=#13 then c:=' ';
          if upcase(c)='W' then sc:=sc-1;
          if upcase(c)='S' then sc:=sc+1;
          if upcase(c)='D' then c:=' ';
          if sc=0 then sc:=5;
          if sc=6 then sc:=1;
    until c=' ';
end;

//procedura che resetta la lista di ricette da visualizzare in elenco
procedure resetlist;
begin
     for j:=1 to 10000 do
         list[j]:=0;
end;

//procedura che scrive a video informazioni riguardanti la lista visualizzata e che permette di selezionare una precisa ricetta
procedure listoptions;
var numreq:integer;
begin
     textcolor(yellow);
     gotoxy(35,1);
     if sc=1   then write('TUTTE LE RICETTE')
               else
                 begin
                    write('RICERCA RICETTA');
                    gotoxy(1,3);
                    write('parametro di ricerca: "',request,'"');
                    case msc of
                         2:write(' - capitolo');
                         1:write(' - nome');
                    end;
                 end;
    gotoxy(43,3);
    textcolor(lightred);
    write('scelta: ');
    textcolor(yellow);
	repeat
		repeat
          gotoxy(51,3);
          write('       ');
          gotoxy(51,3);
          readln(request);
		until isnum(request);
        val(request,numreq);
        selbook:=list[numreq];
    until (list[numreq]<>0)or(numreq=0);
    if numreq<>0 then part:=1
                 else part:=0;
end;

//procedura che visualizza la lista di ricette caricata
procedure showlist;
begin
     textbackground(blue);
     clrscr;
     textcolor(lightgreen);
     gotoxy(1,4);
     for i:=1 to 80 do
         write(chr(196));
     gotoxy(1,4);
     write(chr(218));
     gotoxy(7,4);
     write(chr(194));
     gotoxy(14,4);
     write(chr(194));
     gotoxy(23,4);
     write(chr(194));
     gotoxy(42+18,4);
     write(chr(194));
     gotoxy(54+18,4);
     write(chr(194)); 
     gotoxy(62+18,4);
     write(chr(191));
     gotoxy(1,5);
     writeln(chr(179),'     ',chr(179),'  ID  ',chr(179),'capitolo',chr(179),'                nome                ',chr(179),'aggiunta il',chr(179),'provata',chr(179));
     gotoxy(1,6);
     for i:=1 to 80 do
         write(chr(196));
     gotoxy(1,6);
     write(chr(195));
     gotoxy(7,6);
     write(chr(197));
     gotoxy(14,6);
     write(chr(197));
     gotoxy(23,6);
     write(chr(197));
     gotoxy(42+18,6);
     write(chr(197));
     gotoxy(54+18,6);
     write(chr(197)); 
     gotoxy(62+18,6);
     write(chr(180));
      i:=0;
     if list[1]<>0 then
        repeat
           i:=i+1;
           with books[list[i]] do
              begin
				gotoxy(1,6+i);
				write(chr(179),i);
				gotoxy(7,6+i);
				write(chr(179),list[i]);
				gotoxy(14,6+i);
				write(chr(179),index[chap]);
				gotoxy(23,6+i);
				write(chr(179),cutstr(name,1,36-rating));
                textcolor(yellow);
                for j:=1 to rating do write('*');
                textcolor(lightgreen);
				gotoxy(42+18,6+i);
				write(chr(179),' ',datains.d,'/',datains.m,'/',datains.y);
				gotoxy(54+18,6+i);
				write(chr(179)); 
				if done
					then write('   si''  ',chr(179))
					else write('   no   ',chr(179)); 
				gotoxy(62+18,6+i);
				write(chr(179));
              end;
        until (list[i+1]=0)or(i=10000);
     gotoxy(1,7+i);
	 write(chr(192));
     for j:=2 to 79 do
         write(chr(196));
	 write(chr(217));
     gotoxy(1,6+1+i);
     write(chr(192));
     gotoxy(7,6+1+i);
     write(chr(193));
     gotoxy(14,6+1+i);
     write(chr(193));
     gotoxy(23,6+1+i);
     write(chr(193));
     gotoxy(42+18,6+1+i);
     write(chr(193));
     gotoxy(54+18,6+1+i);
     write(chr(193)); 
     gotoxy(62+18,6+1+i);
     write(chr(217));
     gotoxy(1,1);
     listoptions
end;

//procedura che permette di fare una richiesta di tipo stringa all'utente
//la richiesta ed il cursore vengono posizionati a destra del menù primario, al posto del secondario 
//precedentemente sostituiva il menù secondario
procedure ask(var req:string;towrite:string);
begin
     gotoxy(58,15);
     textcolor(yellow);
     textbackground(3);
     write(towrite);
     gotoxy(58,17);
     textcolor(lightgreen);
     readln(req);
     gotoxy(58,17);
     write('                      ');
end;

//procedura che permette di tornare al menù primario
procedure back;
begin
     part:=0;
end;

//procedura che carica in lista tutte le ricette e le fa visualizzare con la procedura "showlist;"
procedure viewall;
begin
     resetlist;
     j:=0;
     for i:=1 to 10000 do
       if books[i].chap<>0 then 
         begin
              j:=j+1;
              list[j]:=i;
         end;
     showlist;
end;

//funzione che indica la presenza di un dato capitolo STRINGA
function nobooksin(chapter:string):boolean;
var q:integer;
begin
     nobooksin:=true;
     q:=0;
     repeat
           q:=q+1;
     until (q=10000)or(index[books[q].chap]=chapter);
     if index[books[q].chap]=chapter then nobooksin:=false;
end;

//procedura che esporta su file temporaneo una ricetta, per crearla o modificarla
procedure tempout(which:integer);
var temp:text;
    y,m,d,w:word;
    q:integer;
begin
     assign(temp,currentdir+'\tempout.tmp');
     rewrite(temp);
     if books[which].chap=0 then
        begin
             writeln(temp,'capitolo: ');
             writeln(temp,'<scrivere qui il capitolo>');
             writeln(temp,'nome ricetta:');
             writeln(temp,'<scrivere qui il nome>');
             writeln(temp,'punteggio ricetta (0-5):');
             writeln(temp,'<scrivere qui il punteggio>');
             writeln(temp,'data di inserimento nel ricettario (modificabile):');
             writeln(temp,'giorno');
             getdate(y,m,d,w);
             writeln(temp,d);
             writeln(temp,'mese');
             writeln(temp,m);
             writeln(temp,'anno');
             writeln(temp,y);
             writeln(temp,'la ricetta è mai stata provata? (s/n)');
             writeln(temp,'<scrivere qui se la ricetta è stata gia'' provata(s) o no (n)');
             writeln(temp,'ingredienti della ricetta (uno per riga)');
             writeln(temp,'<ingrediente1>');
             writeln(temp,'<ingrediente2>');
             writeln(temp,'...');
             writeln(temp,'fine ingredienti');
             writeln(temp,'procedimento(è possibile scrivere su piu'' righe)');
             writeln(temp,'<blablabla>');
             writeln(temp,'....');
             writeln(temp,'fine procedimento');
             writeln(temp,'commento sulla ricetta(è possibile scrivere su piu'' righe):');
             writeln(temp,'<blablabla>');
             writeln(temp,'....');
             writeln(temp,'fine commenti');
        end
        else
        begin
             writeln(temp,'capitolo: ');
             writeln(temp,index[books[which].chap]);
             writeln(temp,'nome ricetta:');
             writeln(temp,books[which].name);
             writeln(temp,'punteggio ricetta (0-5):');
             writeln(temp,books[which].rating);
             writeln(temp,'data di inserimento nel ricettario (modificabile):');
             writeln(temp,'giorno');
             writeln(temp,books[which].datains.d);
             writeln(temp,'mese');
             writeln(temp,books[which].datains.m);
             writeln(temp,'anno');
             writeln(temp,books[which].datains.y);
             writeln(temp,'la ricetta è mai stata provata? (s/n)');
             if books[which].done then writeln(temp,'s')
                                  else writeln(temp,'n');
             writeln(temp,'ingredienti della ricetta (uno per riga)');
             q:=1;
             while books[which].ing[q]<>'**!no ingredients!**' do
                   begin
                   writeln(temp,books[which].ing[q]);
                   q:=q+1;
                   end;
             writeln(temp,'fine ingredienti');
             writeln(temp,'procedimento(è possibile scrivere su piu'' righe)');
             q:=1;
             while books[which].proc[q]<>'**!no procedure specified!**' do
                   begin
                   writeln(temp,books[which].proc[q]);
                   q:=q+1;
                   end;
             writeln(temp,'fine procedimento');
             writeln(temp,'commento sulla ricetta(è possibile scrivere su piu'' righe):');
             q:=1;
             while books[which].com[q]<>'**!no comment!**' do
                   begin
                   writeln(temp,books[which].com[q]);
                   q:=q+1;
                   end;
             writeln(temp,'fine commenti');
        end;
     close(temp);
     shortmessage('MODIFICA in corso, premere un tasto al termine...  ');
     exec(currentdir+'\getdiz\getdiz.exe',currentdir+'\tempout.tmp');
     while keypressed do c:=readkey;
end;

//procedura che reimporta il file temporaneo sopra citato e lo reinserisce nel programma sovrascrivendo il precedente
procedure tempin(which:integer);
var line:string;
    q:integer;
    temp:text;
begin
     resetbook(which);
     assign(temp,currentdir+'\tempout.tmp');
     reset(temp);
     readln(temp);
     readln(temp,line);
     q:=0;
     repeat
           q:=q+1;
     until (index[q]=line)or(nobooksin(index[q]));
     index[q]:=line;
     books[which].chap:=q;
     readln(temp);
     readln(temp,books[which].name);
     readln(temp);
     readln(temp,line);
     if isnum(line)then val(line,books[which].rating);
     readln(temp);
     readln(temp);
     readln(temp,books[which].datains.d);
     readln(temp);
     readln(temp,books[which].datains.m);
     readln(temp);
     readln(temp,books[which].datains.y);
     readln(temp);
     readln(temp,line);
     if upcase(line)='S' then books[which].done:=true
                            else books[which].done:=false;
     readln(temp);
     readln(temp,line);
     q:=1;
     while line<>'fine ingredienti' do
           begin
                books[which].ing[q]:=line;
                readln(temp,line);
                q:=q+1;
           end;
     readln(temp);
     readln(temp,line);
     q:=1;
     while line<>'fine procedimento' do
           begin
                books[which].proc[q]:=line;
                readln(temp,line);
                q:=q+1;
           end;
     readln(temp);
     readln(temp,line);
     q:=1;
     while line<>'fine commenti' do
           begin
                books[which].com[q]:=line;
                readln(temp,line);
                q:=q+1;
           end;
     close(temp);
     i:=0;
end;

//funzione che restituisce il primo capitolo NUMERICO libero
function firstfree:integer;
begin
     firstfree:=0;
     repeat
           firstfree:=firstfree+1;
     until books[firstfree].chap=0;
end;

//procedura che visualizza una ricetta
procedure viewbook;
var ingbottom:integer;
begin
     textbackground(1);
     clrscr;
     gotoxy(1,1);
     with books[selbook] do
          begin
               textbackground(1);
               textcolor(13);
               gotoxy(45,7);
               write('Data di inserimento: ');
               textcolor(7);
               write(datains.d,'/',datains.m,'/',datains.y);
               textcolor(12);
               gotoxy(45,10);
               write('Rating:');
               textcolor(14);
               for i:=1 to Rating do write (' *');
               textcolor(12);
               jwrite(upcase(name),9,4,80-16,2,i,j,false,false);
               gotoxy(9,7);
               writeln('Ingredienti:');
               textcolor(7);
               i:=1;
               j:=8;
               if ing[1]<>'**!no ingredients!**' then
                  repeat
                     j:=j+1;
                     gotoxy(9,j);
                     write(chr(16));
                     jwrite(ing[i],11,j,25,0,i,j,false,true);
                     i:=i+1;
                  until ing[i]='**!no ingredients!**';
               ingbottom:=j;
               i:=1;
               j:=7+8;
               gotoxy(45,j-2);
               textcolor(12);
               writeln('Commenti sulla ricetta:');
               textcolor(7);
               j:=j-1;
               if com[1]<>'**!no comment!**' then
                  repeat
                     j:=j+1;
                     jwrite(com[i],45,j,25,0,i,j,false,true);
                     i:=i+1;
                  until com[i]='**!no comment!**';
               if ingbottom>j then j:=ingbottom;
               gotoxy(9,j+3);
               textcolor(12);
               write('Procedimento:');
               textcolor(7);
               j:=j+4;
               i:=1;
               if proc[1]<>'**!no procedure specified!**' then
                  repeat
                     j:=j+1;
                     jwrite(proc[i],9,j,61,0,i,j,false,true);
                     i:=i+1;
                  until proc[i]='**!no procedure specified!**';
               if done then textcolor(10)
                       else textcolor(12);
               gotoxy(75,4);
               write(chr(219),chr(219),chr(219));
               gotoxy(75,5);
               write(chr(219),chr(219),chr(219));
          end;
     k:=j+4;
     if k<25 then k:=25;
     for j:=1 to k do
         for i:=1 to 80 do
                if ((i<=2)or(i>=79)or(j<=2)or(j>=k-1))then
                   begin
                        textbackground(11);
                        gotoxy(i,j);
                        write(' ');
                   end;
     textbackground(9);
     textcolor(10);
     gotoxy(40-(length(index[books[selbook].chap]) div 2),2);
     writeln(uppercase(index[books[selbook].chap]));
     gotoxy(8,k-1);
     textcolor(red);
     writeln('premi ''q'' per uscire');
     gotoxy(8,1);
     textcolor(red);
     writeln('premi ''q'' per uscire');
     gotoxy(1,1);
     repeat
           repeat until keypressed;
           c:=readkey;
     until c='q';
end;

//procedura che permette di creare una nuova ricetta esportandola, reimportandola al termine della modifica e inserendola nel programma
procedure newbook;
var p:integer;
begin
     p:=firstfree;
     tempout(p);
     tempin(p);
     part:=1;
     selbook:=p;
     viewbook;
end;

//procedura che permette di cambiare ricettario
procedure changeric;
var t:text;
    newricloc:string;
    test:boolean;
begin
     test:=false;
     saveric(ricloc);
     repeat
          ask(newricloc,'nuovo ricettario:');
          assign(t,newricloc+'.ypr');
          {$I-}
          reset(t);
          {$I+}
          if IORESULT=0 then test:=true;
     until test or(newricloc='q');
     if newricloc<>'q' then close(t);
     if newricloc<>'q' then
        begin
             ricloc:=newricloc+'.ypr';
             loadric(ricloc);
        end;
end;

//procedura di ricerca ricetta per capitolo
procedure findbychap;
begin
     resetlist;
     ask(request,'capitolo richiesto:');
     j:=0;
     for i:=1 to 10000 do
		for k:=1 to 50 do    	 
		  if compare(upcase(index[k]),upcase(request),length(request)) then
			with books[i] do
              begin
					if chap=k then
                      begin
                           j:=j+1;
                           list[j]:=i;
                      end;
              end;
     j:=0;
	 showlist;
end;

//procedura di ricerca ricetta per nome
procedure findbyname;
begin
     resetlist;
     repeat
           ask(request,'nome da cercare:');
     until length(request)>0;
     j:=0;
     for i:=1 to 10000 do
         with books[i] do
              begin
                   if compare(upcase(name),upcase(request),length(request))and(books[i].chap<>0) then
                      begin
                           j:=j+1;
                           list[j]:=i;
                      end;
              end;
     j:=1;
	 showlist;
end;

//procedura che permette di spostare da un capitolo all'altro una ricetta
procedure movebook;
begin
     ask(request,'nuovo capitolo:');
     gotoxy(58,12);
     write('                 ');
     gotoxy(58,13);
     write('                 ');
     i:=0;
     repeat
           i:=i+1;
     until (index[i]=request)or(nobooksin(index[i]));
     index[i]:=request;
     books[selbook].chap:=i;
end;

//procedura che permette la modifica di una ricetta , esportandola, reimportandola e sovrascrivendola alla precedente
procedure modbook;
begin
     tempout(selbook);
     tempin(selbook);
     viewbook;
end;

//procedura che cancella una ricetta dal programma
procedure delbook;
begin
     minimenu('sei sicuro?');
     if msc=2 then
        begin
             books[selbook].chap:=0;
             part:=0;
        end;
end;

//procedura che richiede il tipo di ricerca da effettuare utilizzando il menù secondario
procedure askfind;
begin
     minimenu('cerca ricetta:');
     if msc=1 then findbyname
              else findbychap;
end;

//procedura che verifica la scelta dell'utente effettuata nel menù principale
procedure verifychoice;
begin
     case part of
          0:
            case sc of
                 1:viewall;
                 2:newbook;
                 3:askfind;
                 4:changeric;
                 5:quitpar:=true;
            end;
          1:
            case sc of
                 1:viewbook;
                 2:modbook;
                 3:movebook;
                 4:delbook;
                 5:back;
            end;
     end;
end;

//procedura che richiede se salvare o meno le modifiche effettuate al ricettario, utilizzando il menù secondario
procedure asksave;
begin
     minimenu('salvare il ricettario?');
     if msc=1 then saveric(ricloc);
end;


//MAIN
begin
     quitpar:=false;
     getricloc;
     loadric(ricloc);
     repeat
           loadcommands(part);
           menu;
           verifychoice;
     until quitpar;
     asksave;
//     saveric(ricloc);
     savericloc;
end.
