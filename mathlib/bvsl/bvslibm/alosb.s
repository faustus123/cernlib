*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:56  mclareni
* Initial revision
*
*
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QMIBMVF))
*CMZ :          01/05/90  14.22.46  by  Michel Roethlisberger/IBM
*-- Author :
*********************************************************************
*     SUBROUTINE ALOSB (NW,VIN,TEST,BIT,NFND,'LO')                  *
*     --------------------------------------------                  *
*                                                                   *
*                        Library: BVSL                              *
*                                                                   *
*                                                                   *
*  Selects i's for which |VIN(i)| 'lo'  TEST                        *
*  'lo' being one of the logical operator =, <, <=, >, >=, ^=       *
*                                                                   *
*  Result via Bit-vector form                                       *
*                                                                   *
*  Input                                                            *
*  NW   : Number of elements to be processed                        *
*  VIN  : REAL*4 Input Vector                                       *
*  TEST : REAL*4 Test  Value                                        *
*  LO   : Character*2 Logical Operator                              *
*         ('EQ','LT','LE','GE','GT' OR 'NE')                        *
*                                                                   *
*  Output                                                           *
*  BIT  : Bit-Vector                                                *
*  NFND : Number of test passed (ones in BIT)                       *
*                                                                   *
*                                                                   *
* Author:  F.Antonelli/IBM, M.Roethlisberger/IBM                    *
* Date  :  24-04-90   , Vers 1.02                                   *
*                                                                   *
*********************************************************************
ALOSB    CSECT
#if defined(CERNLIB_QMIBMXA)
ALOSB    AMODE 31
ALOSB    RMODE ANY
#endif
#include "cachesz.inc"
         USING *,15
         STM   G0,G9,20(13)
         LM    G1,G6,0(1)    Get addresses of parameter list
         L     G1,0(0,G1)    NW in G1
         LE    F4,0(0,G3)    TEST in F4
         SR    G9,G9         Reset Register
         LA    G8,SZ         Load Section size
*
         LH    G6,0(0,G6)
         LA    G7,CENTER
         LH    G7,0(0,G7)
         CR    G6,G7
         BC    LT,DOWNPART   LO is 'QE' or 'GE' or 'GT'
*
         LA    G7,CLT
         LH    G7,0(0,G7)
         CR    G6,G7
         BC    LT,LESSEQUA   LO IS 'LE'
         BC    EQ,LESSTHAN   LO IS 'LT'
*
*     LO is 'NE'
* --------------
NOTEQUAL SR    G8,G1         SZ - NW
         BC    GE,NOSECTNE   > = 0
*
LOOPNE   VLVCU G1
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  NE,F4,V0      When TEST ^=  ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector Mask Register
         LTR   G1,G1         Restore proper OC
         BC    GT,LOOPNE     Go back to LOOP
*
         ST    G9,0(G5)      Store G9 thru NFND
         LM    G0,G9,20(13)
         BR    14
*
NOSECTNE VLVCA 0(G1)
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  NE,F4,V0      When TEST ^= ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector MAsk Register
         ST    G9,0(G5)      Store G9 thru NFND
         LM    0,9,20(13)
         BR    14
*
*     LO is 'LE'
* --------------
LESSEQUA SR    G8,G1         SZ - NW
         BC    GE,NOSECTLE   > = 0
*
LOOPLE   VLVCU G1
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  GE,F4,V0      When TEST >=  ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector Mask Register
         LTR   G1,G1         Restore proper OC
         BC    GT,LOOPLE     Go back to LOOP
*
         ST    G9,0(G5)      Store G9 thru NFND
         LM    G0,G9,20(13)
         BR    14
*
NOSECTLE VLVCA 0(G1)
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  GE,F4,V0      When TEST >= ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector MAsk Register
         ST    G9,0(G5)      Store G9 thru NFND
         LM    0,9,20(13)
         BR    14
*
*     LO is 'LT'
* --------------
LESSTHAN SR    G8,G1         SZ - NW
         BC    GE,NOSECTLT   > = 0
*
LOOPLT   VLVCU G1
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  GT,F4,V0      When TEST > ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector Mask Register
         LTR   G1,G1         Restore proper OC
         BC    GT,LOOPLT     Go back to LOOP
*
         ST    G9,0(G5)      Store G9 thru NFND
         LM    G0,G9,20(13)
         BR    14
*
NOSECTLT VLVCA 0(G1)
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  GT,F4,V0      When TEST > ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector MAsk Register
         ST    G9,0(G5)      Store G9 thru NFND
         LM    0,9,20(13)
         BR    14
*
*
DOWNPART LA    G7,CGE
         LH    G7,0(0,G7)
         CR    G6,G7
         BC    LT,EQUALITY   LO IS 'EQ'
         BC    EQ,GREATEQ    LO IS 'LE'
*
*     LO is 'GT'
* --------------
GREATHAN SR    G8,G1         SZ - NW
         BC    GE,NOSECTGT   > = 0
*
LOOPGT   VLVCU G1
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  LT,F4,V0      When TEST <  ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector Mask Register
         LTR   G1,G1         Restore proper OC
         BC    GT,LOOPGT     Go back to LOOP
*
         ST    G9,0(G5)      Store G9 thru NFND
         LM    G0,G9,20(13)
         BR    14
*
NOSECTGT VLVCA 0(G1)
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  LT,F4,V0      When TEST < ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector MAsk Register
         ST    G9,0(G5)      Store G9 thru NFND
         LM    0,9,20(13)
         BR    14
*
*     LO is 'EQ'
* --------------
EQUALITY SR    G8,G1         SZ - NW
         BC    GE,NOSECTEQ   > = 0
*
LOOPEQ   VLVCU G1
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  EQ,F4,V0      When TEST =  ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector Mask Register
         LTR   G1,G1         Restore proper OC
         BC    GT,LOOPEQ     Go back to LOOP
*
         ST    G9,0(G5)      Store G9 thru NFND
         LM    G0,G9,20(13)
         BR    14
*
NOSECTEQ VLVCA 0(G1)
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  EQ,F4,V0      When TEST = ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector MAsk Register
         ST    G9,0(G5)      Store G9 thru NFND
         LM    0,9,20(13)
         BR    14
*
*     LO is 'GE'
* --------------
GREATEQ  SR    G8,G1         SZ - NW
         BC    GE,NOSECTGE   > = 0
*
LOOPGE   VLVCU G1
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  LE,F4,V0      When TEST <= ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector Mask Register
         LTR   G1,G1         Restore proper OC
         BC    GT,LOOPGE     Go back to LOOP
*
         ST    G9,0(G5)      Store G9 thru NFND
         LM    G0,G9,20(13)
         BR    14
*
NOSECTGE VLVCA 0(G1)
         VLE   V0,G2(0)      Load VIN
         VLPER V0,V0         Take positive value
         VCEQ  LE,F4,V0      When TEST <= ABS(VIN)
         VCOVM G9            Count and accumulate 1's bits
         VSTVM G4            Store Vector MAsk Register
         ST    G9,0(G5)      Store G9 thru NFND
         LM    0,9,20(13)
         BR    14
*
*
CGE      DC    XL2'C7C5'
CENTER   DC    XL2'CCCC'
CLT      DC    XL2'D3E3'
#include "equats.inc"
         END
#endif
