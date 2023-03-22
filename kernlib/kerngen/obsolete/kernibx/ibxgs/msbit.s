*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:40  mclareni
* Initial revision
*
*
MSBIT    CSECT
*
* CERN PROGLIB# M421    MSBIT           .VERSION KERNIBX  1.01  900524
* ORIG.  SEPT 85, HRR
* Modified for AIX, Roger Howard, January 1990
*
         USING *,15
         ENTRY _msbit_
_msbit_  STM   2,5,16(13)
         L     4,0(,2)        AIX: value of arg3 = LX
         LTR   4,4
         BNP   RET2           RETURN IF LX.LE.0
         LR    2,0            AIX: address of arg1
         L     2,0(,2)        AIX: value of arg1 = A
         LA    5,1
         NR    5,2            R5 HAS SAME LOW ORDER BIT AS A
         LTR   5,5
         BZ    BIT0
BIT1     SLL   5,63(4)
         O     5,0(,1)        AIX: address of arg2 is in GR1
         B     RET
BIT0     LA    5,1
         SLL   5,63(4)
         X     5,FF
         N     5,0(,1)        AIX: address of arg2 is in GR1
RET      LR    0,5
RET2     LM    2,5,16(13)
         BR    14
FF       DC    F'-1'
         END
#ifdef CERNLIB_TCGEN_MSBIT
#undef CERNLIB_TCGEN_MSBIT
#endif
