program snake;
uses crt;
var gravity,borders,exc,c:char;
var checkpp,contapunti,velocity,punteggio,i,k,x,y,xs,xl,xp,xpp,xb,ys,yl,yp,ypp,yb,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,
    y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y30,y31,y32,y33,y34,y35,y36,y37,y38,y39,y40,y41,y42,y43,y44,y45,y46,y47,y48,y49,y50,y51,y52,y53,y54,y55,y56,y57,y58,y59,y60,y61,y62,y63,y64,y65,y66,y67,y68,y69,y70,y71,y72,y73,y74,y75,y76,y77,y78,y79,y80,y81,y82,y83,y84,y85,y86,y87,y88,y89,y90,y91,y92,y93,y94,y95,y96,y97,y98,y99,y100,y101,y102,y103,y104,y105,y106,y107,y108,y109,y110,y111,y112,y113,y114,y115,y116,y117,y118,y119,y120:longint;
begin
     (*titolazione*)
     clrscr;
     textbackground(green);
     textcolor(red);
     gotoxy(30,7);
     write('::::');
     gotoxy(35,7);
     write(':::');
     gotoxy(42,7);
     write(':::');
     gotoxy(33,8);
     write(':::');
     gotoxy(37,8);
     write('::::::');
     gotoxy(44,8);
     write(':');
     gotoxy(44,9);
     write(':');
     gotoxy(44,10);
     write(':');
     gotoxy(30,10);
     write(':S:N:A:K:E:');
     textbackground(black);
     textcolor(lightgray);
     gotoxy(36,14);
     write('by CaCCo AleSSandRo');
     c:='r';
     (*ciclo di ripetizione per ricominciare dopo il game over*)
     repeat
       (*assegnazione velocità, scelta forza di gravità, scelta bordi*)
       repeat
       if velocity>100 then contapunti:=velocity-103 //trucco per partire con una certa lunghezza
                       else contapunti:=0;
       gotoxy(20,17);
       write('Scegli il grado di difficolta'' (1-100):');
       for i:=59 to 80 do write(' ');
       gotoxy(60,17);
       readln(velocity);
       until (velocity<=100)and(velocity>0);
       repeat
       gotoxy(27,18);
       write('G-Force (y/s/n):');
       for i:=27 to 80 do write(' ');
       gotoxy(44,18);
       readln(gravity);
       until (gravity='s')or(gravity='S')or(gravity='y')or(gravity='Y')or(gravity='n')or(gravity='N');
       repeat
       gotoxy(27,19);
       write('Bordi (y/s/n):');
       for i:=27 to 80 do write(' ');
       gotoxy(42,19);
       readln(borders);
       until (borders='s')or(borders='S')or(borders='y')or(borders='Y')or(borders='n')or(borders='N');
     (*disegno bordi con condizione per cambiarli se uccidono il serpente o se lo fanno passare*)
     textbackground(blue);
     clrscr;
     for i:= 1 to 80 do if borders='n' then write ('_')
                                       else write('*');
     for i:= 1 to 22 do if borders='n' then writeln ('|')
                                       else writeln('*');
     for i:= 1 to 23 do
       begin
         gotoxy(80,i);
         if borders='n' then write ('|')
                        else write('*');
       end;
     for i:=1 to 80 do
       begin
         gotoxy(i,24);
         if borders='n' then write ('_')
                        else write('*');
       end;
     (*inizio assegnazione variabili D:*)
     x:=40;
     y:=11;
     xl:=0;
     yl:=0;
     x120:=0;
     y120:=0;
     x119:=0;
     y119:=0;
     x118:=0;
     y118:=0;
     x117:=0;
     y117:=0;
     x116:=0;
     y116:=0;
     x115:=0;
     y115:=0;
     x114:=0;
     y114:=0;
     x113:=0;
     y113:=0;
     x112:=0;
     y112:=0;
     x111:=0;
     y111:=0;
     x110:=0;
     y110:=0;
     x109:=0;
     y109:=0;
     x108:=0;
     y108:=0;
     x107:=0;
     y107:=0;
     x106:=0;
     y106:=0;
     x105:=0;
     y105:=0;
     x104:=0;
     y104:=0;
     x103:=0;
     y103:=0;
     x102:=0;
     y102:=0;
     x101:=0;
     y101:=0;
     x100:=0;
     y100:=0;
     x100:=0;
     y100:=0;
     x99:=0;
     y99:=0;
     x98:=0;
     y98:=0;
     x97:=0;
     y97:=0;
     x96:=0;
     y96:=0;
     x95:=0;
     y95:=0;
     x94:=0;
     y94:=0;
     x93:=0;
     y93:=0;
     x92:=0;
     y92:=0;
     x91:=0;
     y91:=0;
     x90:=0;
     y90:=0;
     x89:=0;
     y89:=0;
     x88:=0;
     y88:=0;
     x87:=0;
     y87:=0;
     x86:=0;
     y86:=0;
     x85:=0;
     y85:=0;
     x84:=0;
     y84:=0;
     x83:=0;
     y83:=0;
     x82:=0;
     y82:=0;
     x81:=0;
     y81:=0;
     x80:=0;
     y80:=0;
     x79:=0;
     y79:=0;
     x78:=0;
     y78:=0;
     x77:=0;
     y77:=0;
     x76:=0;
     y76:=0;
     x75:=0;
     y75:=0;
     x74:=0;
     y74:=0;
     x73:=0;
     y73:=0;
     x72:=0;
     y72:=0;
     x71:=0;
     y71:=0;
     x70:=0;
     y70:=0;
     x70:=0;
     y70:=0;
     x69:=0;
     y69:=0;
     x68:=0;
     y68:=0;
     x67:=0;
     y67:=0;
     x66:=0;
     y66:=0;
     x65:=0;
     y65:=0;
     x64:=0;
     y64:=0;
     x63:=0;
     y63:=0;
     x62:=0;
     y62:=0;
     x61:=0;
     y61:=0;
     x60:=0;
     y60:=0;
     x59:=0;
     y59:=0;
     x58:=0;
     y58:=0;
     x57:=0;
     y57:=0;
     x56:=0;
     y56:=0;
     x55:=0;
     y55:=0;
     x54:=0;
     y54:=0;
     x53:=0;
     y53:=0;
     x52:=0;
     y52:=0;
     x51:=0;
     y51:=0;
     x50:=0;
     y50:=0;
     x50:=0;
     y50:=0;
     x49:=0;
     y49:=0;
     x48:=0;
     y48:=0;
     x47:=0;
     y47:=0;
     x46:=0;
     y46:=0;
     x45:=0;
     y45:=0;
     x44:=0;
     y44:=0;
     x43:=0;
     y43:=0;
     x42:=0;
     y42:=0;
     x41:=0;
     y41:=0;
     x40:=0;
     y40:=0;
     x39:=0;
     y39:=0;
     x38:=0;
     y38:=0;
     x37:=0;
     y37:=0;
     x36:=0;
     y36:=0;
     x35:=0;
     y35:=0;
     x34:=0;
     y34:=0;
     x33:=0;
     y33:=0;
     x32:=0;
     y32:=0;
     x31:=0;
     y31:=0;
     x30:=0;
     y30:=0;
     x30:=0;
     y30:=0;
     x29:=0;
     y29:=0;
     x28:=0;
     y28:=0;
     x27:=0;
     y27:=0;
     x26:=0;
     y26:=0;
     x25:=0;
     y25:=0;
     x24:=0;
     y24:=0;
     x23:=0;
     y23:=0;
     x22:=0;
     y22:=0;
     x21:=0;
     y21:=0;
     x20:=0;
     y20:=0;
     x19:=0;
     y19:=0;
     x18:=0;
     y18:=0;
     x17:=0;
     y17:=0;
     x16:=0;
     y16:=0;
     x15:=0;
     y15:=0;
     x14:=0;
     y14:=0;
     x13:=0;
     y13:=0;
     x12:=0;
     y12:=0;
     x11:=0;
     y11:=0;
     x10:=0;
     y10:=0;
     x9:=0;
     y9:=0;
     x8:=0;
     y8:=0;
     x7:=0;
     y7:=0;
     x6:=0;
     y6:=0;
     x5:=0;
     y5:=0;
     x4:=0;
     y4:=0;
     x3:=0;
     y3:=0;
     x2:=0;
     y2:=0;
     x1:=0;
     y1:=0;
     xs:=0;
     ys:=0;
     i:=0;
     k:=1; //altrimenti la velocità viene incrementata di uno in partenza per contapunti mod 3=0
     punteggio:=0;
     (*scrittura caratteri di introduzione alla direzione*)
     gotoxy(40,9);
     write('A');
     gotoxy(40,13);
     write('V');
     gotoxy(38,11);
     write('<');
     gotoxy(42,11);
     write('>');
     (*randomizzazione di partenza bomba, superpunto e punto*)
     repeat
         xb:=random(2+79);
         yb:=random(2+23);
     until(xb>2)and(xb<79)and(yb>1)and(yb<21)and(xb<>xl)and(yb<>yl)and(xb<>x1)and(yb<>y1)and(xb<>x2)and(yb<>y2)and(xb<>x3)and(yb<>y3)and(xb<>x4)and(yb<>y4)and(xb<>x5)and(yb<>y5)and(xb<>x6)and(yb<>y6)and(xb<>x7)and(yb<>y7)and(xb<>x8)and(yb<>y8)and(xb<>x9)and(yb<>y9)and(xb<>x10)and(yb<>y10)and(xb<>x11)and(yb<>y11)and(xb<>x12)and(yb<>y12)and(xb<>x13)and(yb<>y13)and(xb<>x14)and(yb<>y14)and(xb<>x15)and(yb<>y15)and(xb<>x16)and(yb<>y16)and(xb<>x17)and(yb<>y17)and(xb<>x18)and(yb<>y18)and(xb<>x19)and(yb<>y19)and(xb<>x20)and(yb<>y20)and(xb<>x21)and(yb<>y21)and(xb<>x22)and(yb<>y22)and(xb<>x23)and(yb<>y23)and(xb<>x24)and(yb<>y24)and(xb<>x25)and(yb<>y25)and(xb<>x26)and(yb<>y26)and(xb<>x27)and(yb<>y27)and(xb<>x28)and(yb<>y28)and(xb<>x29)and(yb<>y29)and(xb<>x30)and(yb<>y30)and(xb<>x31)and(yb<>y31)and(xb<>x32)and(yb<>y32)and(xb<>x33)and(yb<>y33)and(xb<>x34)and(yb<>y34)and(xb<>x35)and(yb<>y35)and(xb<>x36)and(yb<>y36)and(xb<>x37)and(yb<>y37)and(xb<>x38)and(yb<>y38)and(xb<>x39)and(yb<>y39)and(xb<>x40)
          and(yb<>y40)and(xb<>x41)and(yb<>y41)and(xb<>x42)and(yb<>y42)and(xb<>x43)and(yb<>y43)and(xb<>x44)and(yb<>y44)and(xb<>x45)and(yb<>y45)and(xb<>x46)and(yb<>y46)and(xb<>x47)and(yb<>y47)and(xb<>x48)and(yb<>y48)and(xb<>x49)and(yb<>y49)and(xb<>x50)and(yb<>y50)and(xb<>x51)and(yb<>y51)and(xb<>x52)and(yb<>y52)and(xb<>x53)and(yb<>y53)and(xb<>x54)and(yb<>y54)and(xb<>x55)and(yb<>y55)and(xb<>x56)and(yb<>y56)and(xb<>x57)and(yb<>y57)and(xb<>x58)and(yb<>y58)and(xb<>x59)and(yb<>y59)and(xb<>x60)and(yb<>y60)and(xb<>x61)and(yb<>y61)and(xb<>x62)and(yb<>y62)and(xb<>x63)and(yb<>y63)and(xb<>x64)and(yb<>y64)and(xb<>x65)and(yb<>y65)and(xb<>x66)and(yb<>y66)and(xb<>x67)and(yb<>y67)and(xb<>x68)and(yb<>y68)and(xb<>x69)and(yb<>y69)and(xb<>x70)and(yb<>y70)and(xb<>x71)and(yb<>y71)and(xb<>x72)and(yb<>y72)and(xb<>x73)and(yb<>y73)and(xb<>x74)and(yb<>y74)and(xb<>x75)and(yb<>y75)and(xb<>x76)and(yb<>y76)and(xb<>x77)and(yb<>y77)and(xb<>x78)and(yb<>y78)and(xb<>x79)and(yb<>y79)and(xb<>x80)and(yb<>y80)and(xb<>x81)
          and(yb<>y81)and(xb<>x82)and(yb<>y82)and(xb<>x83)and(yb<>y83)and(xb<>x84)and(yb<>y84)and(xb<>x85)and(yb<>y85)and(xb<>x86)and(yb<>y86)and(xb<>x87)and(yb<>y87)and(xb<>x88)and(yb<>y88)and(xb<>x89)and(yb<>y89)and(xb<>x90)and(yb<>y90)and(xb<>x91)and(yb<>y91)and(xb<>x92)and(yb<>y92)and(xb<>x93)and(yb<>y93)and(xb<>x94)and(yb<>y94)and(xb<>x95)and(yb<>y95)and(xb<>x96)and(yb<>y96)and(xb<>x97)and(yb<>y97)and(xb<>x98)and(yb<>y98)and(xb<>x99)and(yb<>y99)and(xb<>x100)and(yb<>y100)and(xb<>x101)and(yb<>y101)and(xb<>x102)and(yb<>y102)and(xb<>x103)and(yb<>y103)and(xb<>x104)and(yb<>y104)and(xb<>x105)and(yb<>y105)and(xb<>x106)and(yb<>y106)and(xb<>x107)and(yb<>y107)and(xb<>x108)and(yb<>y108)and(xb<>x109)and(yb<>y109)and(xb<>x110)and(yb<>y110)and(xb<>x111)and(yb<>y111)and(xb<>x112)and(yb<>y112)and(xb<>x113)and(yb<>y113)and(xb<>x114)and(yb<>y114)and(xb<>x115)and(yb<>y115)and(xb<>x116)and(yb<>y116)and(xb<>x117)and(yb<>y117)and(xb<>x118)and(yb<>y118)and(xb<>x119)and(yb<>y119)and(xb<>x120)
          and(yb<>y120)and(xb<>xl)and(yb+1<>yl)and(xb<>x1)and(yb+1<>y1)and(xb<>x2)and(yb+1<>y2)and(xb<>x3)and(yb+1<>y3)and(xb<>x4)and(yb+1<>y4)and(xb<>x5)and(yb+1<>y5)and(xb<>x6)and(yb+1<>y6)and(xb<>x7)and(yb+1<>y7)and(xb<>x8)and(yb+1<>y8)and(xb<>x9)and(yb+1<>y9)and(xb<>x10)and(yb+1<>y10)and(xb<>x11)and(yb+1<>y11)and(xb<>x12)and(yb+1<>y12)and(xb<>x13)and(yb+1<>y13)and(xb<>x14)and(yb+1<>y14)and(xb<>x15)and(yb+1<>y15)and(xb<>x16)and(yb+1<>y16)and(xb<>x17)and(yb+1<>y17)and(xb<>x18)and(yb+1<>y18)and(xb<>x19)and(yb+1<>y19)and(xb<>x20)and(yb+1<>y20)and(xb<>x21)and(yb+1<>y21)and(xb<>x22)and(yb+1<>y22)and(xb<>x23)and(yb+1<>y23)and(xb<>x24)and(yb+1<>y24)and(xb<>x25)and(yb+1<>y25)and(xb<>x26)and(yb+1<>y26)and(xb<>x27)and(yb+1<>y27)and(xb<>x28)and(yb+1<>y28)and(xb<>x29)and(yb+1<>y29)and(xb<>x30)and(yb+1<>y30)and(xb<>x31)and(yb+1<>y31)and(xb<>x32)and(yb+1<>y32)and(xb<>x33)and(yb+1<>y33)and(xb<>x34)and(yb+1<>y34)and(xb<>x35)and(yb+1<>y35)and(xb<>x36)and(yb+1<>y36)and(xb<>x37)
          and(yb+1<>y37)and(xb<>x38)and(yb+1<>y38)and(xb<>x39)and(yb+1<>y39)and(xb<>x40)and(yb+1<>y40)and(xb<>x41)and(yb+1<>y41)and(xb<>x42)and(yb+1<>y42)and(xb<>x43)and(yb+1<>y43)and(xb<>x44)and(yb+1<>y44)and(xb<>x45)and(yb+1<>y45)and(xb<>x46)and(yb+1<>y46)and(xb<>x47)and(yb+1<>y47)and(xb<>x48)and(yb+1<>y48)and(xb<>x49)and(yb+1<>y49)and(xb<>x50)and(yb+1<>y50)and(xb<>x51)and(yb+1<>y51)and(xb<>x52)and(yb+1<>y52)and(xb<>x53)and(yb+1<>y53)and(xb<>x54)and(yb+1<>y54)and(xb<>x55)and(yb+1<>y55)and(xb<>x56)and(yb+1<>y56)and(xb<>x57)and(yb+1<>y57)and(xb<>x58)and(yb+1<>y58)and(xb<>x59)and(yb+1<>y59)and(xb<>x60)and(yb+1<>y60)and(xb<>x61)and(yb+1<>y61)and(xb<>x62)and(yb+1<>y62)and(xb<>x63)and(yb+1<>y63)and(xb<>x64)and(yb+1<>y64)and(xb<>x65)and(yb+1<>y65)and(xb<>x66)and(yb+1<>y66)and(xb<>x67)and(yb+1<>y67)and(xb<>x68)and(yb+1<>y68)and(xb<>x69)and(yb+1<>y69)and(xb<>x70)and(yb+1<>y70)and(xb<>x71)and(yb+1<>y71)and(xb<>x72)and(yb+1<>y72)and(xb<>x73)and(yb+1<>y73)and(xb<>x74)and(yb+1<>y74)
          and(xb<>x75)and(yb+1<>y75)and(xb<>x76)and(yb+1<>y76)and(xb<>x77)and(yb+1<>y77)and(xb<>x78)and(yb+1<>y78)and(xb<>x79)and(yb+1<>y79)and(xb<>x80)and(yb+1<>y80)and(xb<>x81)and(yb+1<>y81)and(xb<>x82)and(yb+1<>y82)and(xb<>x83)and(yb+1<>y83)and(xb<>x84)and(yb+1<>y84)and(xb<>x85)and(yb+1<>y85)and(xb<>x86)and(yb+1<>y86)and(xb<>x87)and(yb+1<>y87)and(xb<>x88)and(yb+1<>y88)and(xb<>x89)and(yb+1<>y89)and(xb<>x90)and(yb+1<>y90)and(xb<>x91)and(yb+1<>y91)and(xb<>x92)and(yb+1<>y92)and(xb<>x93)and(yb+1<>y93)and(xb<>x94)and(yb+1<>y94)and(xb<>x95)and(yb+1<>y95)and(xb<>x96)and(yb+1<>y96)and(xb<>x97)and(yb+1<>y97)and(xb<>x98)and(yb+1<>y98)and(xb<>x99)and(yb+1<>y99)and(xb<>x100)and(yb+1<>y100)and(xb<>x101)and(yb+1<>y101)and(xb<>x102)and(yb+1<>y102)and(xb<>x103)and(yb+1<>y103)and(xb<>x104)and(yb+1<>y104)and(xb<>x105)and(yb+1<>y105)and(xb<>x106)and(yb+1<>y106)and(xb<>x107)and(yb+1<>y107)and(xb<>x108)and(yb+1<>y108)and(xb<>x109)and(yb+1<>y109)and(xb<>x110)and(yb+1<>y110)and(xb<>x111)and(yb+1<>y111)
          and(xb<>x112)and(yb+1<>y112)and(xb<>x113)and(yb+1<>y113)and(xb<>x114)and(yb+1<>y114)and(xb<>x115)and(yb+1<>y115)and(xb<>x116)and(yb+1<>y116)and(xb<>x117)and(yb+1<>y117)and(xb<>x118)and(yb+1<>y118)and(xb<>x119)and(yb+1<>y119)and(xb<>x120)and(yb+1<>y120)and(xb<>xl)and(yb+2<>yl)and(xb<>x1)and(yb+2<>y1)and(xb<>x2)and(yb+2<>y2)and(xb<>x3)and(yb+2<>y3)and(xb<>x4)and(yb+2<>y4)and(xb<>x5)and(yb+2<>y5)and(xb<>x6)and(yb+2<>y6)and(xb<>x7)and(yb+2<>y7)and(xb<>x8)and(yb+2<>y8)and(xb<>x9)and(yb+2<>y9)and(xb<>x10)and(yb+2<>y10)and(xb<>x11)and(yb+2<>y11)and(xb<>x12)and(yb+2<>y12)and(xb<>x13)and(yb+2<>y13)and(xb<>x14)and(yb+2<>y14)and(xb<>x15)and(yb+2<>y15)and(xb<>x16)and(yb+2<>y16)and(xb<>x17)and(yb+2<>y17)and(xb<>x18)and(yb+2<>y18)and(xb<>x19)and(yb+2<>y19)and(xb<>x20)and(yb+2<>y20)and(xb<>x21)and(yb+2<>y21)and(xb<>x22)and(yb+2<>y22)and(xb<>x23)and(yb+2<>y23)and(xb<>x24)and(yb+2<>y24)and(xb<>x25)and(yb+2<>y25)and(xb<>x26)and(yb+2<>y26)and(xb<>x27)and(yb+2<>y27)and(xb<>x28)
          and(yb+2<>y28)and(xb<>x29)and(yb+2<>y29)and(xb<>x30)and(yb+2<>y30)and(xb<>x31)and(yb+2<>y31)and(xb<>x32)and(yb+2<>y32)and(xb<>x33)and(yb+2<>y33)and(xb<>x34)and(yb+2<>y34)and(xb<>x35)and(yb+2<>y35)and(xb<>x36)and(yb+2<>y36)and(xb<>x37)and(yb+2<>y37)and(xb<>x38)and(yb+2<>y38)and(xb<>x39)and(yb+2<>y39)and(xb<>x40)and(yb+2<>y40)and(xb<>x41)and(yb+2<>y41)and(xb<>x42)and(yb+2<>y42)and(xb<>x43)and(yb+2<>y43)and(xb<>x44)and(yb+2<>y44)and(xb<>x45)and(yb+2<>y45)and(xb<>x46)and(yb+2<>y46)and(xb<>x47)and(yb+2<>y47)and(xb<>x48)and(yb+2<>y48)and(xb<>x49)and(yb+2<>y49)and(xb<>x50)and(yb+2<>y50)and(xb<>x51)and(yb+2<>y51)and(xb<>x52)and(yb+2<>y52)and(xb<>x53)and(yb+2<>y53)and(xb<>x54)and(yb+2<>y54)and(xb<>x55)and(yb+2<>y55)and(xb<>x56)and(yb+2<>y56)and(xb<>x57)and(yb+2<>y57)and(xb<>x58)and(yb+2<>y58)and(xb<>x59)and(yb+2<>y59)and(xb<>x60)and(yb+2<>y60)and(xb<>x61)and(yb+2<>y61)and(xb<>x62)and(yb+2<>y62)and(xb<>x63)and(yb+2<>y63)and(xb<>x64)and(yb+2<>y64)and(xb<>x65)and(yb+2<>y65)and(xb<>x66)
          and(yb+2<>y66)and(xb<>x67)and(yb+2<>y67)and(xb<>x68)and(yb+2<>y68)and(xb<>x69)and(yb+2<>y69)and(xb<>x70)and(yb+2<>y70)and(xb<>x71)and(yb+2<>y71)and(xb<>x72)and(yb+2<>y72)and(xb<>x73)and(yb+2<>y73)and(xb<>x74)and(yb+2<>y74)and(xb<>x75)and(yb+2<>y75)and(xb<>x76)and(yb+2<>y76)and(xb<>x77)and(yb+2<>y77)and(xb<>x78)and(yb+2<>y78)and(xb<>x79)and(yb+2<>y79)and(xb<>x80)and(yb+2<>y80)and(xb<>x81)and(yb+2<>y81)and(xb<>x82)and(yb+2<>y82)and(xb<>x83)and(yb+2<>y83)and(xb<>x84)and(yb+2<>y84)and(xb<>x85)and(yb+2<>y85)and(xb<>x86)and(yb+2<>y86)and(xb<>x87)and(yb+2<>y87)and(xb<>x88)and(yb+2<>y88)and(xb<>x89)and(yb+2<>y89)and(xb<>x90)and(yb+2<>y90)and(xb<>x91)and(yb+2<>y91)and(xb<>x92)and(yb+2<>y92)and(xb<>x93)and(yb+2<>y93)and(xb<>x94)and(yb+2<>y94)and(xb<>x95)and(yb+2<>y95)and(xb<>x96)and(yb+2<>y96)and(xb<>x97)and(yb+2<>y97)and(xb<>x98)and(yb+2<>y98)and(xb<>x99)and(yb+2<>y99)and(xb<>x100)and(yb+2<>y100)and(xb<>x101)and(yb+2<>y101)and(xb<>x102)and(yb+2<>y102)and(xb<>x103)and(yb+2<>y103)
          and(xb<>x104)and(yb+2<>y104)and(xb<>x105)and(yb+2<>y105)and(xb<>x106)and(yb+2<>y106)and(xb<>x107)and(yb+2<>y107)and(xb<>x108)and(yb+2<>y108)and(xb<>x109)and(yb+2<>y109)and(xb<>x110)and(yb+2<>y110)and(xb<>x111)and(yb+2<>y111)and(xb<>x112)and(yb+2<>y112)and(xb<>x113)and(yb+2<>y113)and(xb<>x114)and(yb+2<>y114)and(xb<>x115)and(yb+2<>y115)and(xb<>x116)and(yb+2<>y116)and(xb<>x117)and(yb+2<>y117)and(xb<>x118)and(yb+2<>y118)and(xb<>x119)and(yb+2<>y119)and(xb<>x120)and(yb+2<>y120);
     repeat
         xpp:=random(2+79);
         ypp:=random(2+23);
     until (xpp>1)and(xpp<80)and(ypp>1)and(ypp<23)and(xpp<>xl)and(ypp<>yl)and(xpp<>x1)and(ypp<>y1)and(xpp<>x2)and(ypp<>y2)and(xpp<>x3)and(ypp<>y3)and(xpp<>x4)and(ypp<>y4)and(xpp<>x5)and(ypp<>y5)and(xpp<>x6)and(ypp<>y6)and(xpp<>x7)and(ypp<>y7)and(xpp<>x8)and(ypp<>y8)and(xpp<>x9)and(ypp<>y9)and(xpp<>x10)and(ypp<>y10)and(xpp<>x11)and(ypp<>y11)and(xpp<>x12)and(ypp<>y12)and(xpp<>x13)and(ypp<>y13)and(xpp<>x14)and(ypp<>y14)and(xpp<>x15)and(ypp<>y15)and(xpp<>x16)and(ypp<>y16)and(xpp<>x17)and(ypp<>y17)and(xpp<>x18)and(ypp<>y18)and(xpp<>x19)and(ypp<>y19)and(xpp<>x20)and(ypp<>y20)and(xpp<>x21)and(ypp<>y21)and(xpp<>x22)and(ypp<>y22)and(xpp<>x23)and(ypp<>y23)and(xpp<>x24)and(ypp<>y24)and(xpp<>x25)and(ypp<>y25)and(xpp<>x26)and(ypp<>y26)and(xpp<>x27)and(ypp<>y27)and(xpp<>x28)and(ypp<>y28)and(xpp<>x29)and(ypp<>y29)and(xpp<>x30)and(ypp<>y30)
           and(xpp<>x31)and(ypp<>y31)and(xpp<>x32)and(ypp<>y32)and(xpp<>x33)and(ypp<>y33)and(xpp<>x34)and(ypp<>y34)and(xpp<>x35)and(ypp<>y35)and(xpp<>x36)and(ypp<>y36)and(xpp<>x37)and(ypp<>y37)and(xpp<>x38)and(ypp<>y38)and(xpp<>x39)and(ypp<>y39)and(xpp<>x40)and(ypp<>y40)and(xpp<>x41)and(ypp<>y41)and(xpp<>x42)and(ypp<>y42)and(xpp<>x43)and(ypp<>y43)and(xpp<>x44)and(ypp<>y44)and(xpp<>x45)and(ypp<>y45)and(xpp<>x46)and(ypp<>y46)and(xpp<>x47)and(ypp<>y47)and(xpp<>x48)and(ypp<>y48)and(xpp<>x49)and(ypp<>y49)and(xpp<>x50)and(ypp<>y50)and(xpp<>x51)and(ypp<>y51)and(xpp<>x52)and(ypp<>y52)and(xpp<>x53)and(ypp<>y53)and(xpp<>x54)and(ypp<>y54)and(xpp<>x55)and(ypp<>y55)and(xpp<>x56)and(ypp<>y56)and(xpp<>x57)and(ypp<>y57)and(xpp<>x58)and(ypp<>y58)and(xpp<>x59)and(ypp<>y59)and(xpp<>x60)and(ypp<>y60)and(xpp<>x61)and(ypp<>y61)and(xpp<>x62)and(ypp<>y62)and(xpp<>x63)and(ypp<>y63)and(xpp<>x64)and(ypp<>y64)and(xpp<>x65)and(ypp<>y65)and(xpp<>x66)and(ypp<>y66)and(xpp<>x67)and(ypp<>y67)and(xpp<>x68)and(ypp<>y68)and(xpp<>x69)and(ypp<>y69)and(xpp<>x70)and(ypp<>y70)
           and(xpp<>x71)and(ypp<>y71)and(xpp<>x72)and(ypp<>y72)and(xpp<>x73)and(ypp<>y73)and(xpp<>x74)and(ypp<>y74)and(xpp<>x75)and(ypp<>y75)and(xpp<>x76)and(ypp<>y76)and(xpp<>x77)and(ypp<>y77)and(xpp<>x78)and(ypp<>y78)and(xpp<>x79)and(ypp<>y79)and(xpp<>x80)and(ypp<>y80)and(xpp<>x81)and(ypp<>y81)and(xpp<>x82)and(ypp<>y82)and(xpp<>x83)and(ypp<>y83)and(xpp<>x84)and(ypp<>y84)and(xpp<>x85)and(ypp<>y85)and(xpp<>x86)and(ypp<>y86)and(xpp<>x87)and(ypp<>y87)and(xpp<>x88)and(ypp<>y88)and(xpp<>x89)and(ypp<>y89)and(xpp<>x90)and(ypp<>y90)and(xpp<>x91)and(ypp<>y91)and(xpp<>x92)and(ypp<>y92)and(xpp<>x93)and(ypp<>y93)and(xpp<>x94)and(ypp<>y94)and(xpp<>x95)and(ypp<>y95)and(xpp<>x96)and(ypp<>y96)and(xpp<>x97)and(ypp<>y97)and(xpp<>x98)and(ypp<>y98)and(xpp<>x99)and(ypp<>y99)and(xpp<>x100)and(ypp<>y100)and(xpp<>x101)and(ypp<>y101)and(xpp<>x102)and(ypp<>y102)and(xpp<>x103)and(ypp<>y103)and(xpp<>x104)and(ypp<>y104)and(xpp<>x105)and(ypp<>y105)and(xpp<>x106)and(ypp<>y106)and(xpp<>x107)and(ypp<>y107)and(xpp<>x108)and(ypp<>y108)and(xpp<>x109)and(ypp<>y109)and(xpp<>x110)and(ypp<>y110)
           and(xpp<>x111)and(ypp<>y111)and(xpp<>x112)and(ypp<>y112)and(xpp<>x113)and(ypp<>y113)and(xpp<>x114)and(ypp<>y114)and(xpp<>x115)and(ypp<>y115)and(xpp<>x116)and(ypp<>y116)and(xpp<>x117)and(ypp<>y117)and(xpp<>x118)and(ypp<>y118)and(xpp<>x119)and(ypp<>y119)and(xpp<>x120)and(ypp<>y120);
     repeat
           xp:=random(2+79);
           yp:=random(2+23);
     until (xp>1)and(xp<80)and(yp>1)and(yp<23)and(xp<>xl)and(yp<>yl)and(xp<>x1)and(yp<>y1)and(xp<>x2)and(yp<>y2)and(xp<>x3)and(yp<>y3)and(xp<>x4)and(yp<>y4)and(xp<>x5)and(yp<>y5)and(xp<>x6)and(yp<>y6)and(xp<>x7)and(yp<>y7)and(xp<>x8)and(yp<>y8)and(xp<>x9)and(yp<>y9)and(xp<>x10)and(yp<>y10)and(xp<>x11)and(yp<>y11)and(xp<>x12)and(yp<>y12)and(xp<>x13)and(yp<>y13)and(xp<>x14)and(yp<>y14)and(xp<>x15)and(yp<>y15)and(xp<>x16)and(yp<>y16)and(xp<>x17)and(yp<>y17)and(xp<>x18)and(yp<>y18)and(xp<>x19)and(yp<>y19)and(xp<>x20)and(yp<>y20)and(xp<>x21)and(yp<>y21)and(xp<>x22)and(yp<>y22)and(xp<>x23)and(yp<>y23)and(xp<>x24)and(yp<>y24)and(xp<>x25)and(yp<>y25)and(xp<>x26)and(yp<>y26)and(xp<>x27)and(yp<>y27)and(xp<>x28)and(yp<>y28)and(xp<>x29)and(yp<>y29)and(xp<>x30)and(yp<>y30)
                 and(xp<>x31)and(yp<>y31)and(xp<>x32)and(yp<>y32)and(xp<>x33)and(yp<>y33)and(xp<>x34)and(yp<>y34)and(xp<>x35)and(yp<>y35)and(xp<>x36)and(yp<>y36)and(xp<>x37)and(yp<>y37)and(xp<>x38)and(yp<>y38)and(xp<>x39)and(yp<>y39)and(xp<>x40)and(yp<>y40)and(xp<>x41)and(yp<>y41)and(xp<>x42)and(yp<>y42)and(xp<>x43)and(yp<>y43)and(xp<>x44)and(yp<>y44)and(xp<>x45)and(yp<>y45)and(xp<>x46)and(yp<>y46)and(xp<>x47)and(yp<>y47)and(xp<>x48)and(yp<>y48)and(xp<>x49)and(yp<>y49)and(xp<>x50)and(yp<>y50)and(xp<>x51)and(yp<>y51)and(xp<>x52)and(yp<>y52)and(xp<>x53)and(yp<>y53)and(xp<>x54)and(yp<>y54)and(xp<>x55)and(yp<>y55)and(xp<>x56)and(yp<>y56)and(xp<>x57)and(yp<>y57)and(xp<>x58)and(yp<>y58)and(xp<>x59)and(yp<>y59)and(xp<>x60)and(yp<>y60)and(xp<>x61)and(yp<>y61)and(xp<>x62)and(yp<>y62)and(xp<>x63)and(yp<>y63)and(xp<>x64)and(yp<>y64)and(xp<>x65)and(yp<>y65)and(xp<>x66)and(yp<>y66)and(xp<>x67)and(yp<>y67)and(xp<>x68)and(yp<>y68)and(xp<>x69)and(yp<>y69)and(xp<>x70)and(yp<>y70)
                 and(xp<>x71)and(yp<>y71)and(xp<>x72)and(yp<>y72)and(xp<>x73)and(yp<>y73)and(xp<>x74)and(yp<>y74)and(xp<>x75)and(yp<>y75)and(xp<>x76)and(yp<>y76)and(xp<>x77)and(yp<>y77)and(xp<>x78)and(yp<>y78)and(xp<>x79)and(yp<>y79)and(xp<>x80)and(yp<>y80)and(xp<>x81)and(yp<>y81)and(xp<>x82)and(yp<>y82)and(xp<>x83)and(yp<>y83)and(xp<>x84)and(yp<>y84)and(xp<>x85)and(yp<>y85)and(xp<>x86)and(yp<>y86)and(xp<>x87)and(yp<>y87)and(xp<>x88)and(yp<>y88)and(xp<>x89)and(yp<>y89)and(xp<>x90)and(yp<>y90)and(xp<>x91)and(yp<>y91)and(xp<>x92)and(yp<>y92)and(xp<>x93)and(yp<>y93)and(xp<>x94)and(yp<>y94)and(xp<>x95)and(yp<>y95)and(xp<>x96)and(yp<>y96)and(xp<>x97)and(yp<>y97)and(xp<>x98)and(yp<>y98)and(xp<>x99)and(yp<>y99)and(xp<>x100)and(yp<>y100)and(xp<>x101)and(yp<>y101)and(xp<>x102)and(yp<>y102)and(xp<>x103)and(yp<>y103)and(xp<>x104)and(yp<>y104)and(xp<>x105)and(yp<>y105)and(xp<>x106)and(yp<>y106)and(xp<>x107)and(yp<>y107)and(xp<>x108)and(yp<>y108)and(xp<>x109)and(yp<>y109)and(xp<>x110)and(yp<>y110)
                 and(xp<>x111)and(yp<>y111)and(xp<>x112)and(yp<>y112)and(xp<>x113)and(yp<>y113)and(xp<>x114)and(yp<>y114)and(xp<>x115)and(yp<>y115)and(xp<>x116)and(yp<>y116)and(xp<>x117)and(yp<>y117)and(xp<>x118)and(yp<>y118)and(xp<>x119)and(yp<>y119)and(xp<>x120)and(yp<>y120);
     gotoxy(xp,yp);
     write('@');     //scrittura primo punto secondo randomizzazione iniziale
     repeat
     exc:=c;  // ricordo precedente scelta della direzione
     repeat
     c:=readkey;  //scelta della direzione
     until (c='a')or(c='s')or(c='w')or(c='d')or(c='A')or(c='S')or(c='D')or(c='W')or(c='q')or(c='Q')or(c='r')or(c='R');
                repeat
                      i:=i+1;  //incremento variabile temporale
                      (*scrittura punto normale*)
                      if (x=xp) and (y=yp)and(x<>0)and(y<>0) then
                      begin
                           k:=k+1;
                           contapunti:=contapunti+1;
                           repeat
                                 xp:=random(2+79);
                                 yp:=random(2+23);
                           until (xp>1)and(xp<80)and(yp>1)and(yp<23)and(xp<>xl)and(yp<>yl)and(xp<>x1)and(yp<>y1)and(xp<>x2)and(yp<>y2)and(xp<>x3)and(yp<>y3)and(xp<>x4)and(yp<>y4)and(xp<>x5)and(yp<>y5)and(xp<>x6)and(yp<>y6)and(xp<>x7)and(yp<>y7)and(xp<>x8)and(yp<>y8)and(xp<>x9)and(yp<>y9)and(xp<>x10)and(yp<>y10)and(xp<>x11)and(yp<>y11)and(xp<>x12)and(yp<>y12)and(xp<>x13)and(yp<>y13)and(xp<>x14)and(yp<>y14)and(xp<>x15)and(yp<>y15)and(xp<>x16)and(yp<>y16)and(xp<>x17)and(yp<>y17)and(xp<>x18)and(yp<>y18)and(xp<>x19)and(yp<>y19)and(xp<>x20)and(yp<>y20)and(xp<>x21)and(yp<>y21)and(xp<>x22)and(yp<>y22)and(xp<>x23)and(yp<>y23)and(xp<>x24)and(yp<>y24)and(xp<>x25)and(yp<>y25)and(xp<>x26)and(yp<>y26)and(xp<>x27)and(yp<>y27)and(xp<>x28)and(yp<>y28)and(xp<>x29)and(yp<>y29)and(xp<>x30)and(yp<>y30)
                                 and(xp<>x31)and(yp<>y31)and(xp<>x32)and(yp<>y32)and(xp<>x33)and(yp<>y33)and(xp<>x34)and(yp<>y34)and(xp<>x35)and(yp<>y35)and(xp<>x36)and(yp<>y36)and(xp<>x37)and(yp<>y37)and(xp<>x38)and(yp<>y38)and(xp<>x39)and(yp<>y39)and(xp<>x40)and(yp<>y40)and(xp<>x41)and(yp<>y41)and(xp<>x42)and(yp<>y42)and(xp<>x43)and(yp<>y43)and(xp<>x44)and(yp<>y44)and(xp<>x45)and(yp<>y45)and(xp<>x46)and(yp<>y46)and(xp<>x47)and(yp<>y47)and(xp<>x48)and(yp<>y48)and(xp<>x49)and(yp<>y49)and(xp<>x50)and(yp<>y50)and(xp<>x51)and(yp<>y51)and(xp<>x52)and(yp<>y52)and(xp<>x53)and(yp<>y53)and(xp<>x54)and(yp<>y54)and(xp<>x55)and(yp<>y55)and(xp<>x56)and(yp<>y56)and(xp<>x57)and(yp<>y57)and(xp<>x58)and(yp<>y58)and(xp<>x59)and(yp<>y59)and(xp<>x60)and(yp<>y60)and(xp<>x61)and(yp<>y61)and(xp<>x62)and(yp<>y62)and(xp<>x63)and(yp<>y63)and(xp<>x64)and(yp<>y64)and(xp<>x65)and(yp<>y65)and(xp<>x66)and(yp<>y66)and(xp<>x67)and(yp<>y67)and(xp<>x68)and(yp<>y68)and(xp<>x69)and(yp<>y69)and(xp<>x70)and(yp<>y70)
                                 and(xp<>x71)and(yp<>y71)and(xp<>x72)and(yp<>y72)and(xp<>x73)and(yp<>y73)and(xp<>x74)and(yp<>y74)and(xp<>x75)and(yp<>y75)and(xp<>x76)and(yp<>y76)and(xp<>x77)and(yp<>y77)and(xp<>x78)and(yp<>y78)and(xp<>x79)and(yp<>y79)and(xp<>x80)and(yp<>y80)and(xp<>x81)and(yp<>y81)and(xp<>x82)and(yp<>y82)and(xp<>x83)and(yp<>y83)and(xp<>x84)and(yp<>y84)and(xp<>x85)and(yp<>y85)and(xp<>x86)and(yp<>y86)and(xp<>x87)and(yp<>y87)and(xp<>x88)and(yp<>y88)and(xp<>x89)and(yp<>y89)and(xp<>x90)and(yp<>y90)and(xp<>x91)and(yp<>y91)and(xp<>x92)and(yp<>y92)and(xp<>x93)and(yp<>y93)and(xp<>x94)and(yp<>y94)and(xp<>x95)and(yp<>y95)and(xp<>x96)and(yp<>y96)and(xp<>x97)and(yp<>y97)and(xp<>x98)and(yp<>y98)and(xp<>x99)and(yp<>y99)and(xp<>x100)and(yp<>y100)and(xp<>x101)and(yp<>y101)and(xp<>x102)and(yp<>y102)and(xp<>x103)and(yp<>y103)and(xp<>x104)and(yp<>y104)and(xp<>x105)and(yp<>y105)and(xp<>x106)and(yp<>y106)and(xp<>x107)and(yp<>y107)and(xp<>x108)and(yp<>y108)and(xp<>x109)and(yp<>y109)and(xp<>x110)and(yp<>y110)
                                 and(xp<>x111)and(yp<>y111)and(xp<>x112)and(yp<>y112)and(xp<>x113)and(yp<>y113)and(xp<>x114)and(yp<>y114)and(xp<>x115)and(yp<>y115)and(xp<>x116)and(yp<>y116)and(xp<>x117)and(yp<>y117)and(xp<>x118)and(yp<>y118)and(xp<>x119)and(yp<>y119)and(xp<>x120)and(yp<>y120);
                           gotoxy(xp,yp);
                           textcolor(lightgray);
                           write('@');
                           punteggio:=punteggio+1;
                      end;
                      (*randomizzazione superpunto*)
                      if (i mod 500=0) then
                         begin
                           k:=k+1;
                           repeat
                                 xpp:=random(2+79);
                                 ypp:=random(2+23);
                           until (xpp>1)and(xpp<80)and(ypp>1)and(ypp<23)and(xpp<>xl)and(ypp<>yl)and(xpp<>x1)and(ypp<>y1)and(xpp<>x2)and(ypp<>y2)and(xpp<>x3)and(ypp<>y3)and(xpp<>x4)and(ypp<>y4)and(xpp<>x5)and(ypp<>y5)and(xpp<>x6)and(ypp<>y6)and(xpp<>x7)and(ypp<>y7)and(xpp<>x8)and(ypp<>y8)and(xpp<>x9)and(ypp<>y9)and(xpp<>x10)and(ypp<>y10)and(xpp<>x11)and(ypp<>y11)and(xpp<>x12)and(ypp<>y12)and(xpp<>x13)and(ypp<>y13)and(xpp<>x14)and(ypp<>y14)and(xpp<>x15)and(ypp<>y15)and(xpp<>x16)and(ypp<>y16)and(xpp<>x17)and(ypp<>y17)and(xpp<>x18)and(ypp<>y18)and(xpp<>x19)and(ypp<>y19)and(xpp<>x20)and(ypp<>y20)and(xpp<>x21)and(ypp<>y21)and(xpp<>x22)and(ypp<>y22)and(xpp<>x23)and(ypp<>y23)and(xpp<>x24)and(ypp<>y24)and(xpp<>x25)and(ypp<>y25)and(xpp<>x26)and(ypp<>y26)and(xpp<>x27)and(ypp<>y27)and(xpp<>x28)and(ypp<>y28)and(xpp<>x29)and(ypp<>y29)and(xpp<>x30)and(ypp<>y30)
                                 and(xpp<>x31)and(ypp<>y31)and(xpp<>x32)and(ypp<>y32)and(xpp<>x33)and(ypp<>y33)and(xpp<>x34)and(ypp<>y34)and(xpp<>x35)and(ypp<>y35)and(xpp<>x36)and(ypp<>y36)and(xpp<>x37)and(ypp<>y37)and(xpp<>x38)and(ypp<>y38)and(xpp<>x39)and(ypp<>y39)and(xpp<>x40)and(ypp<>y40)and(xpp<>x41)and(ypp<>y41)and(xpp<>x42)and(ypp<>y42)and(xpp<>x43)and(ypp<>y43)and(xpp<>x44)and(ypp<>y44)and(xpp<>x45)and(ypp<>y45)and(xpp<>x46)and(ypp<>y46)and(xpp<>x47)and(ypp<>y47)and(xpp<>x48)and(ypp<>y48)and(xpp<>x49)and(ypp<>y49)and(xpp<>x50)and(ypp<>y50)and(xpp<>x51)and(ypp<>y51)and(xpp<>x52)and(ypp<>y52)and(xpp<>x53)and(ypp<>y53)and(xpp<>x54)and(ypp<>y54)and(xpp<>x55)and(ypp<>y55)and(xpp<>x56)and(ypp<>y56)and(xpp<>x57)and(ypp<>y57)and(xpp<>x58)and(ypp<>y58)and(xpp<>x59)and(ypp<>y59)and(xpp<>x60)and(ypp<>y60)and(xpp<>x61)and(ypp<>y61)and(xpp<>x62)and(ypp<>y62)and(xpp<>x63)and(ypp<>y63)and(xpp<>x64)and(ypp<>y64)and(xpp<>x65)and(ypp<>y65)and(xpp<>x66)and(ypp<>y66)and(xpp<>x67)and(ypp<>y67)and(xpp<>x68)and(ypp<>y68)and(xpp<>x69)and(ypp<>y69)and(xpp<>x70)and(ypp<>y70)
                                 and(xpp<>x71)and(ypp<>y71)and(xpp<>x72)and(ypp<>y72)and(xpp<>x73)and(ypp<>y73)and(xpp<>x74)and(ypp<>y74)and(xpp<>x75)and(ypp<>y75)and(xpp<>x76)and(ypp<>y76)and(xpp<>x77)and(ypp<>y77)and(xpp<>x78)and(ypp<>y78)and(xpp<>x79)and(ypp<>y79)and(xpp<>x80)and(ypp<>y80)and(xpp<>x81)and(ypp<>y81)and(xpp<>x82)and(ypp<>y82)and(xpp<>x83)and(ypp<>y83)and(xpp<>x84)and(ypp<>y84)and(xpp<>x85)and(ypp<>y85)and(xpp<>x86)and(ypp<>y86)and(xpp<>x87)and(ypp<>y87)and(xpp<>x88)and(ypp<>y88)and(xpp<>x89)and(ypp<>y89)and(xpp<>x90)and(ypp<>y90)and(xpp<>x91)and(ypp<>y91)and(xpp<>x92)and(ypp<>y92)and(xpp<>x93)and(ypp<>y93)and(xpp<>x94)and(ypp<>y94)and(xpp<>x95)and(ypp<>y95)and(xpp<>x96)and(ypp<>y96)and(xpp<>x97)and(ypp<>y97)and(xpp<>x98)and(ypp<>y98)and(xpp<>x99)and(ypp<>y99)and(xpp<>x100)and(ypp<>y100)and(xpp<>x101)and(ypp<>y101)and(xpp<>x102)and(ypp<>y102)and(xpp<>x103)and(ypp<>y103)and(xpp<>x104)and(ypp<>y104)and(xpp<>x105)and(ypp<>y105)and(xpp<>x106)and(ypp<>y106)and(xpp<>x107)and(ypp<>y107)and(xpp<>x108)and(ypp<>y108)and(xpp<>x109)and(ypp<>y109)and(xpp<>x110)and(ypp<>y110)
                                 and(xpp<>x111)and(ypp<>y111)and(xpp<>x112)and(ypp<>y112)and(xpp<>x113)and(ypp<>y113)and(xpp<>x114)and(ypp<>y114)and(xpp<>x115)and(ypp<>y115)and(xpp<>x116)and(ypp<>y116)and(xpp<>x117)and(ypp<>y117)and(xpp<>x118)and(ypp<>y118)and(xpp<>x119)and(ypp<>y119)and(xpp<>x120)and(ypp<>y120);
                         end;
                      (*aumento punteggio alla presa del superpunto e cancellazione se non preso*)
                      if (((xs=xpp)and(ys=ypp))or(i mod 500=150))and(i>50) then
                         begin
                              gotoxy(xpp,ypp);
                              if(xs=xpp)and(ys=ypp)then
                                  begin
                                       punteggio:=punteggio+5;
                                       checkpp:=0;
                                  end;
                              if checkpp=1 then write(' ');
                              xpp:=0;
                              ypp:=0;
                              gotoxy(x,y);
                         end;
                      (*creazione superpunto*)
                      if (i mod 500<150)and(i>50)and(xpp<>0)and(ypp<>0) then
                      begin
                           gotoxy(xpp,ypp);
                           if i mod 2=0 then textcolor(green)
                                        else textcolor(white);
                           write('$');
                           checkpp:=1;
                           gotoxy(x,y);
                           textcolor(lightgray);
                      end;
                      (* aumento velocità in base al parametro k che si incrementa alla presa di tutti i punti, anche speciali*)
                      if (velocity<100)and(k mod 3=0) then
                         begin
                              velocity:=velocity+1;
                              k:=k+1;
                         end;
                      (*randomizzazione bomba*)
                      if (i mod 300=0) then
                         repeat
                               xb:=random(2+79);
                               yb:=random(2+23);
                         until(xb>2)and(xb<79)and(yb>1)and(yb<21)and(xb<>xl)and(yb<>yl)and(xb<>xp)and((yb<yp-3)or(yb>yp))and(xb<>x1)and(yb<>y1)and(xb<>x2)and(yb<>y2)and(xb<>x3)and(yb<>y3)and(xb<>x4)and(yb<>y4)and(xb<>x5)and(yb<>y5)and(xb<>x6)and(yb<>y6)and(xb<>x7)and(yb<>y7)and(xb<>x8)and(yb<>y8)and(xb<>x9)and(yb<>y9)and(xb<>x10)and(yb<>y10)and(xb<>x11)and(yb<>y11)and(xb<>x12)and(yb<>y12)and(xb<>x13)and(yb<>y13)and(xb<>x14)and(yb<>y14)and(xb<>x15)and(yb<>y15)and(xb<>x16)and(yb<>y16)and(xb<>x17)and(yb<>y17)and(xb<>x18)and(yb<>y18)and(xb<>x19)and(yb<>y19)and(xb<>x20)and(yb<>y20)and(xb<>x21)and(yb<>y21)and(xb<>x22)and(yb<>y22)and(xb<>x23)and(yb<>y23)and(xb<>x24)and(yb<>y24)and(xb<>x25)and(yb<>y25)and(xb<>x26)and(yb<>y26)and(xb<>x27)and(yb<>y27)and(xb<>x28)and(yb<>y28)and(xb<>x29)and(yb<>y29)and(xb<>x30)and(yb<>y30)and(xb<>x31)and(yb<>y31)and(xb<>x32)and(yb<>y32)and(xb<>x33)and(yb<>y33)and(xb<>x34)and(yb<>y34)and(xb<>x35)and(yb<>y35)and(xb<>x36)and(yb<>y36)and(xb<>x37)and(yb<>y37)and(xb<>x38)and(yb<>y38)and(xb<>x39)and(yb<>y39)and(xb<>x40)
                                    and(yb<>y40)and(xb<>x41)and(yb<>y41)and(xb<>x42)and(yb<>y42)and(xb<>x43)and(yb<>y43)and(xb<>x44)and(yb<>y44)and(xb<>x45)and(yb<>y45)and(xb<>x46)and(yb<>y46)and(xb<>x47)and(yb<>y47)and(xb<>x48)and(yb<>y48)and(xb<>x49)and(yb<>y49)and(xb<>x50)and(yb<>y50)and(xb<>x51)and(yb<>y51)and(xb<>x52)and(yb<>y52)and(xb<>x53)and(yb<>y53)and(xb<>x54)and(yb<>y54)and(xb<>x55)and(yb<>y55)and(xb<>x56)and(yb<>y56)and(xb<>x57)and(yb<>y57)and(xb<>x58)and(yb<>y58)and(xb<>x59)and(yb<>y59)and(xb<>x60)and(yb<>y60)and(xb<>x61)and(yb<>y61)and(xb<>x62)and(yb<>y62)and(xb<>x63)and(yb<>y63)and(xb<>x64)and(yb<>y64)and(xb<>x65)and(yb<>y65)and(xb<>x66)and(yb<>y66)and(xb<>x67)and(yb<>y67)and(xb<>x68)and(yb<>y68)and(xb<>x69)and(yb<>y69)and(xb<>x70)and(yb<>y70)and(xb<>x71)and(yb<>y71)and(xb<>x72)and(yb<>y72)and(xb<>x73)and(yb<>y73)and(xb<>x74)and(yb<>y74)and(xb<>x75)and(yb<>y75)and(xb<>x76)and(yb<>y76)and(xb<>x77)and(yb<>y77)and(xb<>x78)and(yb<>y78)and(xb<>x79)and(yb<>y79)and(xb<>x80)and(yb<>y80)and(xb<>x81)
                                    and(yb<>y81)and(xb<>x82)and(yb<>y82)and(xb<>x83)and(yb<>y83)and(xb<>x84)and(yb<>y84)and(xb<>x85)and(yb<>y85)and(xb<>x86)and(yb<>y86)and(xb<>x87)and(yb<>y87)and(xb<>x88)and(yb<>y88)and(xb<>x89)and(yb<>y89)and(xb<>x90)and(yb<>y90)and(xb<>x91)and(yb<>y91)and(xb<>x92)and(yb<>y92)and(xb<>x93)and(yb<>y93)and(xb<>x94)and(yb<>y94)and(xb<>x95)and(yb<>y95)and(xb<>x96)and(yb<>y96)and(xb<>x97)and(yb<>y97)and(xb<>x98)and(yb<>y98)and(xb<>x99)and(yb<>y99)and(xb<>x100)and(yb<>y100)and(xb<>x101)and(yb<>y101)and(xb<>x102)and(yb<>y102)and(xb<>x103)and(yb<>y103)and(xb<>x104)and(yb<>y104)and(xb<>x105)and(yb<>y105)and(xb<>x106)and(yb<>y106)and(xb<>x107)and(yb<>y107)and(xb<>x108)and(yb<>y108)and(xb<>x109)and(yb<>y109)and(xb<>x110)and(yb<>y110)and(xb<>x111)and(yb<>y111)and(xb<>x112)and(yb<>y112)and(xb<>x113)and(yb<>y113)and(xb<>x114)and(yb<>y114)and(xb<>x115)and(yb<>y115)and(xb<>x116)and(yb<>y116)and(xb<>x117)and(yb<>y117)and(xb<>x118)and(yb<>y118)and(xb<>x119)and(yb<>y119)and(xb<>x120)
                                    and(yb<>y120)and(xb<>xl)and(yb+1<>yl)and(xb<>x1)and(yb+1<>y1)and(xb<>x2)and(yb+1<>y2)and(xb<>x3)and(yb+1<>y3)and(xb<>x4)and(yb+1<>y4)and(xb<>x5)and(yb+1<>y5)and(xb<>x6)and(yb+1<>y6)and(xb<>x7)and(yb+1<>y7)and(xb<>x8)and(yb+1<>y8)and(xb<>x9)and(yb+1<>y9)and(xb<>x10)and(yb+1<>y10)and(xb<>x11)and(yb+1<>y11)and(xb<>x12)and(yb+1<>y12)and(xb<>x13)and(yb+1<>y13)and(xb<>x14)and(yb+1<>y14)and(xb<>x15)and(yb+1<>y15)and(xb<>x16)and(yb+1<>y16)and(xb<>x17)and(yb+1<>y17)and(xb<>x18)and(yb+1<>y18)and(xb<>x19)and(yb+1<>y19)and(xb<>x20)and(yb+1<>y20)and(xb<>x21)and(yb+1<>y21)and(xb<>x22)and(yb+1<>y22)and(xb<>x23)and(yb+1<>y23)and(xb<>x24)and(yb+1<>y24)and(xb<>x25)and(yb+1<>y25)and(xb<>x26)and(yb+1<>y26)and(xb<>x27)and(yb+1<>y27)and(xb<>x28)and(yb+1<>y28)and(xb<>x29)and(yb+1<>y29)and(xb<>x30)and(yb+1<>y30)and(xb<>x31)and(yb+1<>y31)and(xb<>x32)and(yb+1<>y32)and(xb<>x33)and(yb+1<>y33)and(xb<>x34)and(yb+1<>y34)and(xb<>x35)and(yb+1<>y35)and(xb<>x36)and(yb+1<>y36)and(xb<>x37)
                                    and(yb+1<>y37)and(xb<>x38)and(yb+1<>y38)and(xb<>x39)and(yb+1<>y39)and(xb<>x40)and(yb+1<>y40)and(xb<>x41)and(yb+1<>y41)and(xb<>x42)and(yb+1<>y42)and(xb<>x43)and(yb+1<>y43)and(xb<>x44)and(yb+1<>y44)and(xb<>x45)and(yb+1<>y45)and(xb<>x46)and(yb+1<>y46)and(xb<>x47)and(yb+1<>y47)and(xb<>x48)and(yb+1<>y48)and(xb<>x49)and(yb+1<>y49)and(xb<>x50)and(yb+1<>y50)and(xb<>x51)and(yb+1<>y51)and(xb<>x52)and(yb+1<>y52)and(xb<>x53)and(yb+1<>y53)and(xb<>x54)and(yb+1<>y54)and(xb<>x55)and(yb+1<>y55)and(xb<>x56)and(yb+1<>y56)and(xb<>x57)and(yb+1<>y57)and(xb<>x58)and(yb+1<>y58)and(xb<>x59)and(yb+1<>y59)and(xb<>x60)and(yb+1<>y60)and(xb<>x61)and(yb+1<>y61)and(xb<>x62)and(yb+1<>y62)and(xb<>x63)and(yb+1<>y63)and(xb<>x64)and(yb+1<>y64)and(xb<>x65)and(yb+1<>y65)and(xb<>x66)and(yb+1<>y66)and(xb<>x67)and(yb+1<>y67)and(xb<>x68)and(yb+1<>y68)and(xb<>x69)and(yb+1<>y69)and(xb<>x70)and(yb+1<>y70)and(xb<>x71)and(yb+1<>y71)and(xb<>x72)and(yb+1<>y72)and(xb<>x73)and(yb+1<>y73)and(xb<>x74)and(yb+1<>y74)
                                    and(xb<>x75)and(yb+1<>y75)and(xb<>x76)and(yb+1<>y76)and(xb<>x77)and(yb+1<>y77)and(xb<>x78)and(yb+1<>y78)and(xb<>x79)and(yb+1<>y79)and(xb<>x80)and(yb+1<>y80)and(xb<>x81)and(yb+1<>y81)and(xb<>x82)and(yb+1<>y82)and(xb<>x83)and(yb+1<>y83)and(xb<>x84)and(yb+1<>y84)and(xb<>x85)and(yb+1<>y85)and(xb<>x86)and(yb+1<>y86)and(xb<>x87)and(yb+1<>y87)and(xb<>x88)and(yb+1<>y88)and(xb<>x89)and(yb+1<>y89)and(xb<>x90)and(yb+1<>y90)and(xb<>x91)and(yb+1<>y91)and(xb<>x92)and(yb+1<>y92)and(xb<>x93)and(yb+1<>y93)and(xb<>x94)and(yb+1<>y94)and(xb<>x95)and(yb+1<>y95)and(xb<>x96)and(yb+1<>y96)and(xb<>x97)and(yb+1<>y97)and(xb<>x98)and(yb+1<>y98)and(xb<>x99)and(yb+1<>y99)and(xb<>x100)and(yb+1<>y100)and(xb<>x101)and(yb+1<>y101)and(xb<>x102)and(yb+1<>y102)and(xb<>x103)and(yb+1<>y103)and(xb<>x104)and(yb+1<>y104)and(xb<>x105)and(yb+1<>y105)and(xb<>x106)and(yb+1<>y106)and(xb<>x107)and(yb+1<>y107)and(xb<>x108)and(yb+1<>y108)and(xb<>x109)and(yb+1<>y109)and(xb<>x110)and(yb+1<>y110)and(xb<>x111)and(yb+1<>y111)
                                    and(xb<>x112)and(yb+1<>y112)and(xb<>x113)and(yb+1<>y113)and(xb<>x114)and(yb+1<>y114)and(xb<>x115)and(yb+1<>y115)and(xb<>x116)and(yb+1<>y116)and(xb<>x117)and(yb+1<>y117)and(xb<>x118)and(yb+1<>y118)and(xb<>x119)and(yb+1<>y119)and(xb<>x120)and(yb+1<>y120)and(xb<>xl)and(yb+2<>yl)and(xb<>x1)and(yb+2<>y1)and(xb<>x2)and(yb+2<>y2)and(xb<>x3)and(yb+2<>y3)and(xb<>x4)and(yb+2<>y4)and(xb<>x5)and(yb+2<>y5)and(xb<>x6)and(yb+2<>y6)and(xb<>x7)and(yb+2<>y7)and(xb<>x8)and(yb+2<>y8)and(xb<>x9)and(yb+2<>y9)and(xb<>x10)and(yb+2<>y10)and(xb<>x11)and(yb+2<>y11)and(xb<>x12)and(yb+2<>y12)and(xb<>x13)and(yb+2<>y13)and(xb<>x14)and(yb+2<>y14)and(xb<>x15)and(yb+2<>y15)and(xb<>x16)and(yb+2<>y16)and(xb<>x17)and(yb+2<>y17)and(xb<>x18)and(yb+2<>y18)and(xb<>x19)and(yb+2<>y19)and(xb<>x20)and(yb+2<>y20)and(xb<>x21)and(yb+2<>y21)and(xb<>x22)and(yb+2<>y22)and(xb<>x23)and(yb+2<>y23)and(xb<>x24)and(yb+2<>y24)and(xb<>x25)and(yb+2<>y25)and(xb<>x26)and(yb+2<>y26)and(xb<>x27)and(yb+2<>y27)and(xb<>x28)
                                    and(yb+2<>y28)and(xb<>x29)and(yb+2<>y29)and(xb<>x30)and(yb+2<>y30)and(xb<>x31)and(yb+2<>y31)and(xb<>x32)and(yb+2<>y32)and(xb<>x33)and(yb+2<>y33)and(xb<>x34)and(yb+2<>y34)and(xb<>x35)and(yb+2<>y35)and(xb<>x36)and(yb+2<>y36)and(xb<>x37)and(yb+2<>y37)and(xb<>x38)and(yb+2<>y38)and(xb<>x39)and(yb+2<>y39)and(xb<>x40)and(yb+2<>y40)and(xb<>x41)and(yb+2<>y41)and(xb<>x42)and(yb+2<>y42)and(xb<>x43)and(yb+2<>y43)and(xb<>x44)and(yb+2<>y44)and(xb<>x45)and(yb+2<>y45)and(xb<>x46)and(yb+2<>y46)and(xb<>x47)and(yb+2<>y47)and(xb<>x48)and(yb+2<>y48)and(xb<>x49)and(yb+2<>y49)and(xb<>x50)and(yb+2<>y50)and(xb<>x51)and(yb+2<>y51)and(xb<>x52)and(yb+2<>y52)and(xb<>x53)and(yb+2<>y53)and(xb<>x54)and(yb+2<>y54)and(xb<>x55)and(yb+2<>y55)and(xb<>x56)and(yb+2<>y56)and(xb<>x57)and(yb+2<>y57)and(xb<>x58)and(yb+2<>y58)and(xb<>x59)and(yb+2<>y59)and(xb<>x60)and(yb+2<>y60)and(xb<>x61)and(yb+2<>y61)and(xb<>x62)and(yb+2<>y62)and(xb<>x63)and(yb+2<>y63)and(xb<>x64)and(yb+2<>y64)and(xb<>x65)and(yb+2<>y65)and(xb<>x66)
                                    and(yb+2<>y66)and(xb<>x67)and(yb+2<>y67)and(xb<>x68)and(yb+2<>y68)and(xb<>x69)and(yb+2<>y69)and(xb<>x70)and(yb+2<>y70)and(xb<>x71)and(yb+2<>y71)and(xb<>x72)and(yb+2<>y72)and(xb<>x73)and(yb+2<>y73)and(xb<>x74)and(yb+2<>y74)and(xb<>x75)and(yb+2<>y75)and(xb<>x76)and(yb+2<>y76)and(xb<>x77)and(yb+2<>y77)and(xb<>x78)and(yb+2<>y78)and(xb<>x79)and(yb+2<>y79)and(xb<>x80)and(yb+2<>y80)and(xb<>x81)and(yb+2<>y81)and(xb<>x82)and(yb+2<>y82)and(xb<>x83)and(yb+2<>y83)and(xb<>x84)and(yb+2<>y84)and(xb<>x85)and(yb+2<>y85)and(xb<>x86)and(yb+2<>y86)and(xb<>x87)and(yb+2<>y87)and(xb<>x88)and(yb+2<>y88)and(xb<>x89)and(yb+2<>y89)and(xb<>x90)and(yb+2<>y90)and(xb<>x91)and(yb+2<>y91)and(xb<>x92)and(yb+2<>y92)and(xb<>x93)and(yb+2<>y93)and(xb<>x94)and(yb+2<>y94)and(xb<>x95)and(yb+2<>y95)and(xb<>x96)and(yb+2<>y96)and(xb<>x97)and(yb+2<>y97)and(xb<>x98)and(yb+2<>y98)and(xb<>x99)and(yb+2<>y99)and(xb<>x100)and(yb+2<>y100)and(xb<>x101)and(yb+2<>y101)and(xb<>x102)and(yb+2<>y102)and(xb<>x103)and(yb+2<>y103)
                                    and(xb<>x104)and(yb+2<>y104)and(xb<>x105)and(yb+2<>y105)and(xb<>x106)and(yb+2<>y106)and(xb<>x107)and(yb+2<>y107)and(xb<>x108)and(yb+2<>y108)and(xb<>x109)and(yb+2<>y109)and(xb<>x110)and(yb+2<>y110)and(xb<>x111)and(yb+2<>y111)and(xb<>x112)and(yb+2<>y112)and(xb<>x113)and(yb+2<>y113)and(xb<>x114)and(yb+2<>y114)and(xb<>x115)and(yb+2<>y115)and(xb<>x116)and(yb+2<>y116)and(xb<>x117)and(yb+2<>y117)and(xb<>x118)and(yb+2<>y118)and(xb<>x119)and(yb+2<>y119)and(xb<>x120)and(yb+2<>y120);
                      (*cancellazione bomba*)
                      if (i mod 300=100)and(i>75) then
                         begin
                              gotoxy(xb,yb);
                              write(' ');
                              gotoxy(xb,yb+1);
                              write(' ');
                              gotoxy(xb-1,yb+2);
                              write('   ');
                              xb:=0;
                              yb:=0;
                              gotoxy(x,y);
                         end;
                      (*scrittura bomba*)
                      if (i mod 300<100)and(i>75)and(xb<>0)and(yb<>0) then
                         begin
                              gotoxy(xb,yb);
                              if i mod 2=0 then write('*')
                                           else write(' ');
                              gotoxy(xb,yb+1);
                              write('|');
                              gotoxy(xb-1,yb+2);
                              write('(_)');
                              gotoxy(x,y);
                         end;
                      (*scelta direzione, se è opposta alla precedente non viene eseguita*)
                      if (exc='d')and(c='a') then c:='d';
                      if (exc='a')and(c='d') then c:='a';
                      if (exc='w')and(c='s') then c:='w';
                      if (exc='s')and(c='w') then c:='s';
                      if (c='w')or(c='W') then y:=y-1;
                      if (c='a')or(c='A') then x:=x-1;
                      if (c='d')or(c='D') then x:=x+1;
                      if (c='s')or(c='S') then y:=y+1;
                      (*delay per la velocità, modificato se gravità attivata*)
                      if (gravity='s')or(gravity='S')or(gravity='y')or(gravity='Y') then
                         begin
                         if c='s' then delay(110-velocity);
                         if c='w' then delay(150-velocity);
                         if (c='a')or(c='d') then delay(115-velocity);
                         end
                         else delay(115-velocity);
                      (*se i bordi sono disattivati, allora teletrasporto da parte a parte*)
                      if borders='n' then
                         begin
                              if x=1 then x:=79;
                              if x=80 then x:=2;
                              if y=1 then y:=23;
                              if y=24 then y:=2;
                         end;
                      (*cancellazione caratteri di introduzione alla direzione*)
                      if i=1 then
                         begin
                              gotoxy(40,9);
                              write(' ');
                              gotoxy(40,13);
                              write(' ');
                              gotoxy(38,11);
                              write(' ');
                              gotoxy(42,11);
                              write(' ');
                         end;
                      (*scritta caratteri del serpente*)
                      gotoxy(x,y);
                      textbackground(green);
                      textcolor(red);
                      write(':');       //scritta punta del serpente
                      xl:=x1;
                      yl:=y1;
                      gotoxy(xl,yl);
                      textbackground(blue);
                      if (xl<>0)and(yl<>0) then write(' ');
                      (*criteri di allungamento: il serpente sarà così composto: coordinate x->  x xs ... x2 x1 xl
                                                                                 coordinate y->  y ys ... y2 y1 yl
                                                                                                      |_|-> qui vengono incluse più o meno variabili in base alla variabile contapunti*)
                      if contapunti>=1 then
                           begin
                           x1:=x2;
                           y1:=y2;
                           end
                           else
                           begin
                           x1:=xs;
                           y1:=ys;
                           end;
                      if contapunti>=2 then
                           begin
                           x2:=x3;
                           y2:=y3;
                           end
                      else begin
                           x2:=xs;
                           y2:=ys;
                           end;
                      if contapunti>=3 then
                           begin
                           x3:=x4;
                           y3:=y4;
                           end
                      else begin
                           x3:=xs;
                           y3:=ys;
                           end;
                      if contapunti>=4 then
                           begin
                           x4:=x5;
                           y4:=y5;
                           end
                      else begin
                           x4:=xs;
                           y4:=ys;
                           end;
                      if contapunti>=5 then
                           begin
                           x5:=x6;
                           y5:=y6;
                           end
                      else begin
                           x5:=xs;
                           y5:=ys;
                           end;
                      if contapunti>=6 then
                           begin
                           x6:=x7;
                           y6:=y7;
                           end
                      else begin
                           x6:=xs;
                           y6:=ys;
                           end;
                      if contapunti>=7 then
                           begin
                           x7:=x8;
                           y7:=y8;
                           end
                      else begin
                           x7:=xs;
                           y7:=ys;
                           end;
                      if contapunti>=8 then
                           begin
                           x8:=x9;
                           y8:=y9;
                           end
                      else begin
                           x8:=xs;
                           y8:=ys;
                           end;
                      if contapunti>=9 then
                           begin
                           x9:=x10;
                           y9:=y10;
                           end
                      else begin
                           x9:=xs;
                           y9:=ys;
                           end;
                      if contapunti>=10 then
                           begin
                           x10:=x11;
                           y10:=y11;
                           end
                      else begin
                           x10:=xs;
                           y10:=ys;
                           end;
                      if contapunti>=11then
                           begin
                           x11:=x12;
                           y11:=y12
                           end
                      else begin
                           x11:=xs;
                           y11:=ys;
                           end;
                      if contapunti>=12then
                           begin
                           x12:=x13;
                           y12:=y13;
                           end
                      else begin
                           x12:=xs;
                           y12:=ys;
                           end;
                      if contapunti>=13then
                           begin
                           x13:=x14;
                           y13:=y14;
                           end
                      else begin
                           x13:=xs;
                           y13:=ys;
                           end;
                      if contapunti>=14then
                           begin
                           x14:=x15;
                           y14:=y15;
                           end
                      else begin
                           x14:=xs;
                           y14:=ys;
                           end;
                      if contapunti>=15then
                           begin
                           x15:=x16;
                           y15:=y16;
                           end
                      else begin
                           x15:=xs;
                           y15:=ys;
                           end;
                      if contapunti>=16then
                           begin
                           x16:=x17;
                           y16:=y17;
                           end
                      else begin
                           x16:=xs;
                           y16:=ys;
                           end;
                      if contapunti>=17then
                           begin
                           x17:=x18;
                           y17:=y18;
                           end
                      else begin
                           x17:=xs;
                           y17:=ys;
                           end;
                      if contapunti>=18then
                           begin
                           x18:=x19;
                           y18:=y19;
                           end
                      else begin
                           x18:=xs;
                           y18:=ys;
                           end;
                      if contapunti>=19then
                           begin
                           x19:=x20;
                           y19:=y20;
                           end
                      else begin
                           x19:=xs;
                           y19:=ys;
                           end;
                      if contapunti>=20 then
                           begin
                           x20:=x21;
                           y20:=y21;
                           end
                      else begin
                           x20:=xs;
                           y20:=ys;
                           end;
                      if contapunti>=21then
                           begin
                           x21:=x22;
                           y21:=y22
                           end
                      else begin
                           x21:=xs;
                           y21:=ys;
                           end;
                      if contapunti>=22then
                           begin
                           x22:=x23;
                           y22:=y23;
                           end
                      else begin
                           x22:=xs;
                           y22:=ys;
                           end;
                      if contapunti>=23then
                           begin
                           x23:=x24;
                           y23:=y24;
                           end
                      else begin
                           x23:=xs;
                           y23:=ys;
                           end;
                      if contapunti>=24then
                           begin
                           x24:=x25;
                           y24:=y25;
                           end
                      else begin
                           x24:=xs;
                           y24:=ys;
                           end;
                      if contapunti>=25then
                           begin
                           x25:=x26;
                           y25:=y26;
                           end
                      else begin
                           x25:=xs;
                           y25:=ys;
                           end;
                      if contapunti>=26then
                           begin
                           x26:=x27;
                           y26:=y27;
                           end
                      else begin
                           x26:=xs;
                           y26:=ys;
                           end;
                      if contapunti>=27then
                           begin
                           x27:=x28;
                           y27:=y28;
                           end
                      else begin
                           x27:=xs;
                           y27:=ys;
                           end;
                      if contapunti>=28then
                           begin
                           x28:=x29;
                           y28:=y29;
                           end
                      else begin
                           x28:=xs;
                           y28:=ys;
                           end;
                      if contapunti>=29then
                           begin
                           x29:=x30;
                           y29:=y30;
                           end
                      else begin
                           x29:=xs;
                           y29:=ys;
                           end;
                      if contapunti>=30 then
                           begin
                           x30:=x31;
                           y30:=y31;
                           end
                      else begin
                           x30:=xs;
                           y30:=ys;
                           end;
                      if contapunti>=31then
                           begin
                           x31:=x32;
                           y31:=y32
                           end
                      else begin
                           x31:=xs;
                           y31:=ys;
                           end;
                      if contapunti>=32then
                           begin
                           x32:=x33;
                           y32:=y33;
                           end
                      else begin
                           x32:=xs;
                           y32:=ys;
                           end;
                      if contapunti>=33then
                           begin
                           x33:=x34;
                           y33:=y34;
                           end
                      else begin
                           x33:=xs;
                           y33:=ys;
                           end;
                      if contapunti>=34then
                           begin
                           x34:=x35;
                           y34:=y35;
                           end
                      else begin
                           x34:=xs;
                           y34:=ys;
                           end;
                      if contapunti>=35then
                           begin
                           x35:=x36;
                           y35:=y36;
                           end
                      else begin
                           x35:=xs;
                           y35:=ys;
                           end;
                      if contapunti>=36then
                           begin
                           x36:=x37;
                           y36:=y37;
                           end
                      else begin
                           x36:=xs;
                           y36:=ys;
                           end;
                      if contapunti>=37then
                           begin
                           x37:=x38;
                           y37:=y38;
                           end
                      else begin
                           x37:=xs;
                           y37:=ys;
                           end;
                      if contapunti>=38then
                           begin
                           x38:=x39;
                           y38:=y39;
                           end
                      else begin
                           x38:=xs;
                           y38:=ys;
                           end;
                      if contapunti>=39then
                           begin
                           x39:=x40;
                           y39:=y40;
                           end
                      else begin
                           x39:=xs;
                           y39:=ys;
                           end;
                      if contapunti>=40 then
                           begin
                           x40:=x41;
                           y40:=y41;
                           end
                      else begin
                           x40:=xs;
                           y40:=ys;
                           end;
                      if contapunti>=41then
                           begin
                           x41:=x42;
                           y41:=y42
                           end
                      else begin
                           x41:=xs;
                           y41:=ys;
                           end;
                      if contapunti>=42then
                           begin
                           x42:=x43;
                           y42:=y43;
                           end
                      else begin
                           x42:=xs;
                           y42:=ys;
                           end;
                      if contapunti>=43then
                           begin
                           x43:=x44;
                           y43:=y44;
                           end
                      else begin
                           x43:=xs;
                           y43:=ys;
                           end;
                      if contapunti>=44then
                           begin
                           x44:=x45;
                           y44:=y45;
                           end
                      else begin
                           x44:=xs;
                           y44:=ys;
                           end;
                      if contapunti>=45then
                           begin
                           x45:=x46;
                           y45:=y46;
                           end
                      else begin
                           x45:=xs;
                           y45:=ys;
                           end;
                      if contapunti>=46then
                           begin
                           x46:=x47;
                           y46:=y47;
                           end
                      else begin
                           x46:=xs;
                           y46:=ys;
                           end;
                      if contapunti>=47then
                           begin
                           x47:=x48;
                           y47:=y48;
                           end
                      else begin
                           x47:=xs;
                           y47:=ys;
                           end;
                      if contapunti>=48then
                           begin
                           x48:=x49;
                           y48:=y49;
                           end
                      else begin
                           x48:=xs;
                           y48:=ys;
                           end;
                      if contapunti>=49then
                           begin
                           x49:=x50;
                           y49:=y50;
                           end
                      else begin
                           x49:=xs;
                           y49:=ys;
                           end;
                      if contapunti>=50 then
                           begin
                           x50:=x51;
                           y50:=y51;
                           end
                      else begin
                           x50:=xs;
                           y50:=ys;
                           end;
                      if contapunti>=51then
                           begin
                           x51:=x52;
                           y51:=y52
                           end
                      else begin
                           x51:=xs;
                           y51:=ys;
                           end;
                      if contapunti>=52then
                           begin
                           x52:=x53;
                           y52:=y53;
                           end
                      else begin
                           x52:=xs;
                           y52:=ys;
                           end;
                      if contapunti>=53then
                           begin
                           x53:=x54;
                           y53:=y54;
                           end
                      else begin
                           x53:=xs;
                           y53:=ys;
                           end;
                      if contapunti>=54then
                           begin
                           x54:=x55;
                           y54:=y55;
                           end
                      else begin
                           x54:=xs;
                           y54:=ys;
                           end;
                      if contapunti>=55then
                           begin
                           x55:=x56;
                           y55:=y56;
                           end
                      else begin
                           x55:=xs;
                           y55:=ys;
                           end;
                      if contapunti>=56then
                           begin
                           x56:=x57;
                           y56:=y57;
                           end
                      else begin
                           x56:=xs;
                           y56:=ys;
                           end;
                      if contapunti>=57then
                           begin
                           x57:=x58;
                           y57:=y58;
                           end
                      else begin
                           x57:=xs;
                           y57:=ys;
                           end;
                      if contapunti>=58then
                           begin
                           x58:=x59;
                           y58:=y59;
                           end
                      else begin
                           x58:=xs;
                           y58:=ys;
                           end;
                      if contapunti>=59then
                           begin
                           x59:=x60;
                           y59:=y60;
                           end
                      else begin
                           x59:=xs;
                           y59:=ys;
                           end;
                      if contapunti>=60 then
                           begin
                           x60:=x61;
                           y60:=y61;
                           end
                      else begin
                           x60:=xs;
                           y60:=ys;
                           end;
                      if contapunti>=61then
                           begin
                           x61:=x62;
                           y61:=y62
                           end
                      else begin
                           x61:=xs;
                           y61:=ys;
                           end;
                      if contapunti>=62then
                           begin
                           x62:=x63;
                           y62:=y63;
                           end
                      else begin
                           x62:=xs;
                           y62:=ys;
                           end;
                      if contapunti>=63then
                           begin
                           x63:=x64;
                           y63:=y64;
                           end
                      else begin
                           x63:=xs;
                           y63:=ys;
                           end;
                      if contapunti>=64then
                           begin
                           x64:=x65;
                           y64:=y65;
                           end
                      else begin
                           x64:=xs;
                           y64:=ys;
                           end;
                      if contapunti>=65then
                           begin
                           x65:=x66;
                           y65:=y66;
                           end
                      else begin
                           x65:=xs;
                           y65:=ys;
                           end;
                      if contapunti>=66then
                           begin
                           x66:=x67;
                           y66:=y67;
                           end
                      else begin
                           x66:=xs;
                           y66:=ys;
                           end;
                      if contapunti>=67then
                           begin
                           x67:=x68;
                           y67:=y68;
                           end
                      else begin
                           x67:=xs;
                           y67:=ys;
                           end;
                      if contapunti>=68then
                           begin
                           x68:=x69;
                           y68:=y69;
                           end
                      else begin
                           x68:=xs;
                           y68:=ys;
                           end;
                      if contapunti>=69then
                           begin
                           x69:=x70;
                           y69:=y70;
                           end
                      else begin
                           x69:=xs;
                           y69:=ys;
                           end;
                      if contapunti>=70 then
                           begin
                           x70:=x71;
                           y70:=y71;
                           end
                      else begin
                           x70:=xs;
                           y70:=ys;
                           end;
                      if contapunti>=71then
                           begin
                           x71:=x72;
                           y71:=y72
                           end
                      else begin
                           x71:=xs;
                           y71:=ys;
                           end;
                      if contapunti>=72then
                           begin
                           x72:=x73;
                           y72:=y73;
                           end
                      else begin
                           x72:=xs;
                           y72:=ys;
                           end;
                      if contapunti>=73then
                           begin
                           x73:=x74;
                           y73:=y74;
                           end
                      else begin
                           x73:=xs;
                           y73:=ys;
                           end;
                      if contapunti>=74then
                           begin
                           x74:=x75;
                           y74:=y75;
                           end
                      else begin
                           x74:=xs;
                           y74:=ys;
                           end;
                      if contapunti>=75then
                           begin
                           x75:=x76;
                           y75:=y76;
                           end
                      else begin
                           x75:=xs;
                           y75:=ys;
                           end;
                      if contapunti>=76then
                           begin
                           x76:=x77;
                           y76:=y77;
                           end
                      else begin
                           x76:=xs;
                           y76:=ys;
                           end;
                      if contapunti>=77then
                           begin
                           x77:=x78;
                           y77:=y78;
                           end
                      else begin
                           x77:=xs;
                           y77:=ys;
                           end;
                      if contapunti>=78then
                           begin
                           x78:=x79;
                           y78:=y79;
                           end
                      else begin
                           x78:=xs;
                           y78:=ys;
                           end;
                      if contapunti>=79then
                           begin
                           x79:=x80;
                           y79:=y80;
                           end
                      else begin
                           x79:=xs;
                           y79:=ys;
                           end;
                      if contapunti>=80 then
                           begin
                           x80:=x81;
                           y80:=y81;
                           end
                      else begin
                           x80:=xs;
                           y80:=ys;
                           end;
                      if contapunti>=81then
                           begin
                           x81:=x82;
                           y81:=y82
                           end
                      else begin
                           x81:=xs;
                           y81:=ys;
                           end;
                      if contapunti>=82then
                           begin
                           x82:=x83;
                           y82:=y83;
                           end
                      else begin
                           x82:=xs;
                           y82:=ys;
                           end;
                      if contapunti>=83then
                           begin
                           x83:=x84;
                           y83:=y84;
                           end
                      else begin
                           x83:=xs;
                           y83:=ys;
                           end;
                      if contapunti>=84then
                           begin
                           x84:=x85;
                           y84:=y85;
                           end
                      else begin
                           x84:=xs;
                           y84:=ys;
                           end;
                      if contapunti>=85then
                           begin
                           x85:=x86;
                           y85:=y86;
                           end
                      else begin
                           x85:=xs;
                           y85:=ys;
                           end;
                      if contapunti>=86then
                           begin
                           x86:=x87;
                           y86:=y87;
                           end
                      else begin
                           x86:=xs;
                           y86:=ys;
                           end;
                      if contapunti>=87then
                           begin
                           x87:=x88;
                           y87:=y88;
                           end
                      else begin
                           x87:=xs;
                           y87:=ys;
                           end;
                      if contapunti>=88then
                           begin
                           x88:=x89;
                           y88:=y89;
                           end
                      else begin
                           x88:=xs;
                           y88:=ys;
                           end;
                      if contapunti>=89then
                           begin
                           x89:=x90;
                           y89:=y90;
                           end
                      else begin
                           x89:=xs;
                           y89:=ys;
                           end;
                      if contapunti>=90 then
                           begin
                           x90:=x91;
                           y90:=y91;
                           end
                      else begin
                           x90:=xs;
                           y90:=ys;
                           end;
                      if contapunti>=91then
                           begin
                           x91:=x92;
                           y91:=y92
                           end
                      else begin
                           x91:=xs;
                           y91:=ys;
                           end;
                      if contapunti>=92then
                           begin
                           x92:=x93;
                           y92:=y93;
                           end
                      else begin
                           x92:=xs;
                           y92:=ys;
                           end;
                      if contapunti>=93then
                           begin
                           x93:=x94;
                           y93:=y94;
                           end
                      else begin
                           x93:=xs;
                           y93:=ys;
                           end;
                      if contapunti>=94then
                           begin
                           x94:=x95;
                           y94:=y95;
                           end
                      else begin
                           x94:=xs;
                           y94:=ys;
                           end;
                      if contapunti>=95then
                           begin
                           x95:=x96;
                           y95:=y96;
                           end
                      else begin
                           x95:=xs;
                           y95:=ys;
                           end;
                      if contapunti>=96then
                           begin
                           x96:=x97;
                           y96:=y97;
                           end
                      else begin
                           x96:=xs;
                           y96:=ys;
                           end;
                      if contapunti>=97then
                           begin
                           x97:=x98;
                           y97:=y98;
                           end
                      else begin
                           x97:=xs;
                           y97:=ys;
                           end;
                      if contapunti>=98then
                           begin
                           x98:=x99;
                           y98:=y99;
                           end
                      else begin
                           x98:=xs;
                           y98:=ys;
                           end;
                      if contapunti>=99then
                           begin
                           x99:=x100;
                           y99:=y100;
                           end
                      else begin
                           x99:=xs;
                           y99:=ys;
                           end;
                      if contapunti>=100 then
                           begin
                           x100:=x101;
                           y100:=y101;
                           end
                      else begin
                           x100:=xs;
                           y100:=ys;
                           end;
                      if contapunti>=101then
                           begin
                           x101:=x102;
                           y101:=y102
                           end
                      else begin
                           x101:=xs;
                           y101:=ys;
                           end;
                      if contapunti>=102then
                           begin
                           x102:=x103;
                           y102:=y103;
                           end
                      else begin
                           x102:=xs;
                           y102:=ys;
                           end;
                      if contapunti>=103then
                           begin
                           x103:=x104;
                           y103:=y104;
                           end
                      else begin
                           x103:=xs;
                           y103:=ys;
                           end;
                      if contapunti>=104then
                           begin
                           x104:=x105;
                           y104:=y105;
                           end
                      else begin
                           x104:=xs;
                           y104:=ys;
                           end;
                      if contapunti>=105then
                           begin
                           x105:=x106;
                           y105:=y106;
                           end
                      else begin
                           x105:=xs;
                           y105:=ys;
                           end;
                      if contapunti>=106then
                           begin
                           x106:=x107;
                           y106:=y107;
                           end
                      else begin
                           x106:=xs;
                           y106:=ys;
                           end;
                      if contapunti>=107then
                           begin
                           x107:=x108;
                           y107:=y108;
                           end
                      else begin
                           x107:=xs;
                           y107:=ys;
                           end;
                      if contapunti>=108then
                           begin
                           x108:=x109;
                           y108:=y109;
                           end
                      else begin
                           x108:=xs;
                           y108:=ys;
                           end;
                      if contapunti>=109then
                           begin
                           x109:=x110;
                           y109:=y110;
                           end
                      else begin
                           x109:=xs;
                           y109:=ys;
                           end;
                      if contapunti>=110 then
                           begin
                           x110:=x111;
                           y110:=y111;
                           end
                      else begin
                           x110:=xs;
                           y110:=ys;
                           end;
                      if contapunti>=111then
                           begin
                           x111:=x112;
                           y111:=y112
                           end
                      else begin
                           x111:=xs;
                           y111:=ys;
                           end;
                      if contapunti>=112then
                           begin
                           x112:=x113;
                           y112:=y113;
                           end
                      else begin
                           x112:=xs;
                           y112:=ys;
                           end;
                      if contapunti>=113then
                           begin
                           x113:=x114;
                           y113:=y114;
                           end
                      else begin
                           x113:=xs;
                           y113:=ys;
                           end;
                      if contapunti>=114then
                           begin
                           x114:=x115;
                           y114:=y115;
                           end
                      else begin
                           x114:=xs;
                           y114:=ys;
                           end;
                      if contapunti>=115then
                           begin
                           x115:=x116;
                           y115:=y116;
                           end
                      else begin
                           x115:=xs;
                           y115:=ys;
                           end;
                      if contapunti>=116then
                           begin
                           x116:=x117;
                           y116:=y117;
                           end
                      else begin
                           x116:=xs;
                           y116:=ys;
                           end;
                      if contapunti>=117then
                           begin
                           x117:=x118;
                           y117:=y118;
                           end
                      else begin
                           x117:=xs;
                           y117:=ys;
                           end;
                      if contapunti>=118then
                           begin
                           x118:=x119;
                           y118:=y119;
                           end
                      else begin
                           x118:=xs;
                           y118:=ys;
                           end;
                      if contapunti>=119then
                           begin
                           x119:=x120;
                           y119:=y120;
                           x120:=xs;         //per un massimo di 120 caratteri di lunghezza +3 (x,y/xs,ys/xl,yl)
                           y120:=ys;
                           end
                      else begin
                           x119:=xs;
                           y119:=ys;
                           end;
                      xs:=x;
                      ys:=y;
                      (*scrittura punteggio e velocità attuale*)
                      gotoxy(1,1);
                      textcolor(lightgray);
                      write('Punteggio:',punteggio);
                      gotoxy(67,1);
                      write('Velocita'': ', velocity);
                      (*scritta gravità a lato*)
                      if (gravity='s')or(gravity='S')or(gravity='y')or(gravity='Y') then
                      begin
                           gotoxy(80,8);
                           write('G');
                           gotoxy(80,9);
                           write('r');
                           gotoxy(80,10);
                           write('a');
                           gotoxy(80,11);
                           write('v');
                           gotoxy(80,12);
                           write('i');
                           gotoxy(80,13);
                           write('t');
                           gotoxy(80,14);
                           write('y');
                           (* le frecce si muovono se si va in giù*)
                           if (c='s')or(c='S') then if (i mod 4=0) then
                              begin
                                   gotoxy(80,15);
                                   write('V');
                                   gotoxy(80,16);
                                   write(' ');
                                   gotoxy(80,17);
                                   write(' ');
                                   gotoxy(80,18);
                                   write(' ');
                              end
                              else if i mod 4=1 then
                                   begin
                                        gotoxy(80,15);
                                        write(' ');
                                        gotoxy(80,16);
                                        write('V');
                                        gotoxy(80,17);
                                        write(' ');
                                        gotoxy(80,18);
                                        write(' ');
                                   end
                                   else if i mod 4=2 then
                                       begin
                                            gotoxy(80,15);
                                            write(' ');
                                            gotoxy(80,16);
                                            write(' ');
                                            gotoxy(80,17);
                                            write('V');
                                            gotoxy(80,18);
                                            write(' ');
                                       end
                                       else
                                       begin
                                            gotoxy(80,15);
                                            write(' ');
                                            gotoxy(80,16);
                                            write(' ');
                                            gotoxy(80,17);
                                            write(' ');
                                            gotoxy(80,18);
                                            write('V');
                                       end;
                             if (c<>'s')and(c<>'S')then
                              begin
                                   gotoxy(80,15);
                                   write('V');
                                   gotoxy(80,16);
                                   write('V');
                                   gotoxy(80,17);
                                   write('V');
                                   gotoxy(80,18);
                                   write('V');
                              end;
                      end;
                      gotoxy(x,y);
                until keypressed or(((x=80)or(y=24)or(x=1)or(y=1))and ((borders='y')or(borders='s')))or((x=xb)and(y=yb))or((x=xb)and(y=yb+1))or((x=xb-1)and(y=yb+2))or((x=xb)and(y=yb+2))or((x=xb+1)and(y=yb+2))or((x=x1)and(y=y1))or((x=x2)and(y=y2))or((x=x3)and(y=y3))or((x=x4)and(y=y4))or((x=x5)and(y=y5))or((x=x6)and(y=y6))or((x=x7)and(y=y7))or((x=x8)and(y=y8))or((x=x9)and(y=y9))or((x=x10)and(y=y10))or((x=x11)and(y=y11))or((x=x12)and(y=y12))or((x=x13)and(y=y13))or((x=x14)and(y=y14))or((x=x15)and(y=y15))or((x=x16)and(y=y16))or((x=x17)and(y=y17))or((x=x18)and(y=y18))or((x=x19)and(y=y19))or((x=x20)and(y=y20))or((x=x21)and(y=y21))or((x=x22)and(y=y22))or((x=x23)and(y=y23))or((x=x24)and(y=y24))or((x=x25)and(y=y25))or((x=x26)and(y=y26))or((x=x27)and(y=y27))or((x=x28)and(y=y28))or((x=x29)and(y=y29))or((x=x30)and(y=y30))
                      or((x=x31)and(y=y31))or((x=x32)and(y=y32))or((x=x33)and(y=y33))or((x=x34)and(y=y34))or((x=x35)and(y=y35))or((x=x36)and(y=y36))or((x=x37)and(y=y37))or((x=x38)and(y=y38))or((x=x39)and(y=y39))or((x=x40)and(y=y40))or((x=x41)and(y=y41))or((x=x42)and(y=y42))or((x=x43)and(y=y43))or((x=x44)and(y=y44))or((x=x45)and(y=y45))or((x=x46)and(y=y46))or((x=x47)and(y=y47))or((x=x48)and(y=y48))or((x=x49)and(y=y49))or((x=x50)and(y=y50))
                      or((x=x51)and(y=y51))or((x=x52)and(y=y52))or((x=x53)and(y=y53))or((x=x54)and(y=y54))or((x=x55)and(y=y55))or((x=x56)and(y=y56))or((x=x57)and(y=y57))or((x=x58)and(y=y58))or((x=x59)and(y=y59))or((x=x60)and(y=y60))or((x=x61)and(y=y61))or((x=x62)and(y=y62))or((x=x63)and(y=y63))or((x=x64)and(y=y64))or((x=x65)and(y=y65))or((x=x66)and(y=y66))or((x=x67)and(y=y67))or((x=x68)and(y=y68))or((x=x69)and(y=y69))or((x=x70)and(y=y70))
                      or((x=x71)and(y=y71))or((x=x72)and(y=y72))or((x=x73)and(y=y73))or((x=x74)and(y=y74))or((x=x75)and(y=y75))or((x=x76)and(y=y76))or((x=x77)and(y=y77))or((x=x78)and(y=y78))or((x=x79)and(y=y79))or((x=x80)and(y=y80))or((x=x81)and(y=y81))or((x=x82)and(y=y82))or((x=x83)and(y=y83))or((x=x84)and(y=y84))or((x=x85)and(y=y85))or((x=x86)and(y=y86))or((x=x87)and(y=y87))or((x=x88)and(y=y88))or((x=x89)and(y=y89))or((x=x90)and(y=y90))
                      or((x=x91)and(y=y91))or((x=x92)and(y=y92))or((x=x93)and(y=y93))or((x=x94)and(y=y94))or((x=x95)and(y=y95))or((x=x96)and(y=y96))or((x=x97)and(y=y97))or((x=x98)and(y=y98))or((x=x99)and(y=y99))or((x=x100)and(y=y100))or((x=x101)and(y=y101))or((x=x102)and(y=y102))or((x=x103)and(y=y103))or((x=x104)and(y=y104))or((x=x105)and(y=y105))or((x=x106)and(y=y106))or((x=x107)and(y=y107))or((x=x108)and(y=y108))or((x=x109)and(y=y109))or((x=x110)and(y=y110))
                      or((x=x111)and(y=y111))or((x=x112)and(y=y112))or((x=x113)and(y=y113))or((x=x114)and(y=y114))or((x=x115)and(y=y115))or((x=x116)and(y=y116))or((x=x117)and(y=y117))or((x=x118)and(y=y118))or((x=x119)and(y=y119))or((x=x120)and(y=y120));
                      (*(sopra) condizioni di ripetizione del movimento se non viene premuto alcun tasto e condizioni di uscita se il serpente si tocca o tocca i bordi se ci sono*)
     until (c='q')or(((x=80)or(y=24)or(x=1)or(y=1))and ((borders='y')or(borders='s')))or((x=xb)and(y=yb))or((x=xb)and(y=yb+1))or((x=xb-1)and(y=yb+2))or((x=xb)and(y=yb+2))or((x=xb+1)and(y=yb+2))or((x=x1)and(y=y1))or((x=x2)and(y=y2))or((x=x3)and(y=y3))or((x=x4)and(y=y4))or((x=x5)and(y=y5))or((x=x6)and(y=y6))or((x=x7)and(y=y7))or((x=x8)and(y=y8))or((x=x9)and(y=y9))or((x=x10)and(y=y10))or((x=x11)and(y=y11))or((x=x12)and(y=y12))or((x=x13)and(y=y13))or((x=x14)and(y=y14))or((x=x15)and(y=y15))or((x=x16)and(y=y16))or((x=x17)and(y=y17))or((x=x18)and(y=y18))or((x=x19)and(y=y19))or((x=x20)and(y=y20))or((x=x21)and(y=y21))or((x=x22)and(y=y22))or((x=x23)and(y=y23))or((x=x24)and(y=y24))or((x=x25)and(y=y25))or((x=x26)and(y=y26))or((x=x27)and(y=y27))or((x=x28)and(y=y28))or((x=x29)and(y=y29))or((x=x30)and(y=y30))
     or((x=x31)and(y=y31))or((x=x32)and(y=y32))or((x=x33)and(y=y33))or((x=x34)and(y=y34))or((x=x35)and(y=y35))or((x=x36)and(y=y36))or((x=x37)and(y=y37))or((x=x38)and(y=y38))or((x=x39)and(y=y39))or((x=x40)and(y=y40))or((x=x41)and(y=y41))or((x=x42)and(y=y42))or((x=x43)and(y=y43))or((x=x44)and(y=y44))or((x=x45)and(y=y45))or((x=x46)and(y=y46))or((x=x47)and(y=y47))or((x=x48)and(y=y48))or((x=x49)and(y=y49))or((x=x50)and(y=y50))
     or((x=x51)and(y=y51))or((x=x52)and(y=y52))or((x=x53)and(y=y53))or((x=x54)and(y=y54))or((x=x55)and(y=y55))or((x=x56)and(y=y56))or((x=x57)and(y=y57))or((x=x58)and(y=y58))or((x=x59)and(y=y59))or((x=x60)and(y=y60))or((x=x61)and(y=y61))or((x=x62)and(y=y62))or((x=x63)and(y=y63))or((x=x64)and(y=y64))or((x=x65)and(y=y65))or((x=x66)and(y=y66))or((x=x67)and(y=y67))or((x=x68)and(y=y68))or((x=x69)and(y=y69))or((x=x70)and(y=y70))
     or((x=x71)and(y=y71))or((x=x72)and(y=y72))or((x=x73)and(y=y73))or((x=x74)and(y=y74))or((x=x75)and(y=y75))or((x=x76)and(y=y76))or((x=x77)and(y=y77))or((x=x78)and(y=y78))or((x=x79)and(y=y79))or((x=x80)and(y=y80))or((x=x81)and(y=y81))or((x=x82)and(y=y82))or((x=x83)and(y=y83))or((x=x84)and(y=y84))or((x=x85)and(y=y85))or((x=x86)and(y=y86))or((x=x87)and(y=y87))or((x=x88)and(y=y88))or((x=x89)and(y=y89))or((x=x90)and(y=y90))
     or((x=x91)and(y=y91))or((x=x92)and(y=y92))or((x=x93)and(y=y93))or((x=x94)and(y=y94))or((x=x95)and(y=y95))or((x=x96)and(y=y96))or((x=x97)and(y=y97))or((x=x98)and(y=y98))or((x=x99)and(y=y99))or((x=x100)and(y=y100))or((x=x101)and(y=y101))or((x=x102)and(y=y102))or((x=x103)and(y=y103))or((x=x104)and(y=y104))or((x=x105)and(y=y105))or((x=x106)and(y=y106))or((x=x107)and(y=y107))or((x=x108)and(y=y108))or((x=x109)and(y=y109))or((x=x110)and(y=y110))
     or((x=x111)and(y=y111))or((x=x112)and(y=y112))or((x=x113)and(y=y113))or((x=x114)and(y=y114))or((x=x115)and(y=y115))or((x=x116)and(y=y116))or((x=x117)and(y=y117))or((x=x118)and(y=y118))or((x=x119)and(y=y119))or((x=x120)and(y=y120));
     (*(sopra)condizioni di uscita se il serpente si tocca o tocca i bordi se ci sono, oppure se si preme 'q'*)
     (*scrittura schermata game over*)
     gotoxy(2,2);
     for i:=1 to 23 do
         begin
         textbackground(i+3);
         for x:=2 to 79 do write(' ');
         gotoxy(2,i+1);
         end;
     gotoxy(35,12);
     textbackground(red);
     write('GAME OVER');
     gotoxy(33,15);
     write('Punteggio: ',punteggio);
     gotoxy(25,20);
     write('press ''q'' to quit, ''r'' to restart');     //informazione di scelta per l'utente
     (*lettura scelta dell'utente per uscire o giocare nuovamente*)
     repeat
     c:=readkey;
     until (c='q')or(c='r');
     textbackground(black);
     clrscr;
     until(c='q');   //il programma termina solo se viene premuto 'q'
     gotoxy(38,12);
     write('Bye!'); //saluto
     delay(1000);
end.
