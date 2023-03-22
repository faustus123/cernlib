*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:33  mclareni
* Initial revision
*
*
          IDENT NAMEZZ
*
* CERN PROGLIB#         NAMEZZ          .VERSION KERNCDC  1.16  820129
*
          ENTRY NAMEZZ
          EXT   NAMEZZP
 PRNW     EQU   NAMEZZP
*         IMPROVED  CERN PROG LIB  J 402          21-JUNE-76
*         CHIPPEWA VERSION OF D.B. NAMEZB  . 12.12.66 G V F
*
*     SUBROUTINE NAMEZZ (8HABCDEFGH)
*
 STORZZ   MACRO
          LX6   6
          BX6   X6+X7
          SB5   B5-B1
 +        NZ    B5,*+2
          SA6   BUFF+B3
 +        SB3   B3+B1
          SX6   B0
          SB5   10
          ENDM
*
 NM1      VFD   36/6HNAMEZZ,24/NAMEZZ
 NAMEZZ   DATA  0
          SA1   X1
          BX6   X1
          SA6   NAME
          SB7   10                 NO. OF LINES OF PRINTING
          SB1   1                  CONSTANT
          SB4   0                  WHICH ONE OF PAIR OF WORDS/TABLE
 NEXTLIN  SB6   8                  NO OF LETTERS/LINE
          SB5   10                 STORE 10 CHARACTERS/WORD IN BUFF
          SB3   1                  CURRENT WORD IN PRINT BUFFER
          SA2   NAME
          SX5   77B                MASK
          SX6   B0
 CHAR     LX2   6
          BX4   X2*X5              NEXT LETTER TO PRINT
          LX4   1
          SX4   X4+B4
          SA1   X4+TABLE           PICKUP APPROP CODE WORD(SHIFTED)
          SB2   12                 NO OF CHARS PRINTED/LETTER
 NEXT     SX7   55B                BLANK CHARACTER
 +        PL    X1,*+1
          SX7   B1
 +        STORZZ
          SB2   B2-B1
          LX1   1
          NZ    B2,NEXT            STILL MORE TO DO WITH CURRENT
          SX7   55B                2 BLANKS BETWEEN LETTES
          STORZZ
          SX7   55B
          STORZZ
          SB6   B6-B1              IS LINE FINISHED
          NZ    B6,CHAR
*         PRNW        N,(S),(BUFF),(BUFF+12),12,0
          SX7   B7
          SA7   DEPB7
          SX6   B4
          SA6   DEPB4
          SA1   BUFA
 +        RJ    PRNW
 -        LT    B0,B1,NM1
          SB1   1
          SA1   DEPB4
          SB4   X1
          SA2   DEPB7
          SB7   X2
          SB6   126
 +        ZR    B4,*+1
          SB6   127
 SHIFT    SA1   B6+TABLE
          LX1   12
          BX6   X1
          SA6   A1
          SB6   B6-2
          PL    B6,SHIFT
          SB7   B7-B1
          SB6   5
          EQ    B7,B6,RESETB4
          NZ    B7,NEXTLIN
          ZR    B0,NAMEZZ
 RESETB4  SB4   B1
          ZR    B0,NEXTLIN
 NAME     BSS   1
 DEPB4    BSS   1
 DEPB7    BSS   1
 BUFA     VFD   60/BUFF
          BSSZ  1
 BUFF     DATA  55555555555555555555B
          BSSZ  11
 TABLE    BSSZ  2
          DATA  01400220022004100410B,10041774200220024001B A
          DATA  77744002400140027774B,40024001400140027774B B
          DATA  03611004200240004000B,40004000200210040360B C
          DATA  77404010400240004001B,40014000400240107740B D
          DATA  77774000400040007774B,40004000400040007777B E
          DATA  77774000400040007774B,40004000400040004000B F
          DATA  03601004200240004000B,40164002200210040360B G
          DATA  40014001400140017777B,40014001400140014001B H
          DATA  01000100010001000100B,01000100010001000100B I
          DATA  00010001000100010001B,00010000200204100240B J
          DATA  40014004402041004400B,64004100402040044001B K
          DATA  40004000400040004000B,40004000400040007777B L
          DATA  40016003500544114221B,41414001400140014001B M
          DATA  60015001440142014101B,40414021401140054003B N
          DATA  03601004200240014001B,40014001200210040360B O
          DATA  77744002400140014002B,77744000400040004000B P
          DATA  03601004200240014001B,40014011200610060361B Q
          DATA  77744002400140014002B,77744400410040204004B R
          DATA  03601004200010000360B,00040002200210040360B S
          DATA  77760100010001000100B,01000100010001000100B T
          DATA  40014001400140014001B,40010000200204100140B U
          DATA  40012002200210041004B,04100410022002200140B V
          DATA  40014001400140014141B,42214411500560034001B W
          DATA  20021004041002200140B,01400220041010042002B X
          DATA  40022004101004200240B,01000100010001000100B
          DATA  37770004001000200040B,01000200040010003776B Z
          DATA  03600410100420022002B,20022002100404100360B
          DATA  01400240044000400040B,00400040004000400040B
          DATA  03701002200140010004B,00200100040020007777B
          DATA  77770004002001000770B,00020001400120020770B
          DATA  00140024004401040204B,04041004377600040004B
          DATA  07771000200077700002B,00010001400120020770B
          DATA  01000200040017702002B,40014001400120020770B
          DATA  77770001000200040010B,00200040010002000400B
          DATA  03601004200210040360B,10042002200210040360B
          DATA  07702002400140014001B,20020770001000200040B
*
          BSSZ  12
          BSSZ  14
          BSSZ  14
          BSSZ  14
          BSSZ  3                  LET SEE WHAT HAPPENS
          END
