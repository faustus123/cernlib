*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:56  mclareni
* Initial revision
*
*
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QMIBMVF))
*********************************************************************
*     SUBROUTINE GTHRB(NW,IN,BV,OUT)
*
*
*********************************************************************
GTHRB   CSECT
#if defined(CERNLIB_QMIBMXA)
GTHRB   AMODE 31
GTHRB   RMODE ANY
#endif
#include "cachesz.inc"
         USING *,15
         STM   1,5,24(13)
*GET ADDRESS OF PARM LIST
         LM    1,4,0(1)
*
*IN R1 NW
         L     1,0(0,1)
* TEST ON VECTOR SIZE IF VS LT "SZ" NOSECTIONING
         LA    5,SZ
         SR    5,1
         BC    2,NOSECT
*
*
*IN R2 R3 R4 ADDRESSES OF IN BV OUT
* ADDRESSES OF SUBSEQUENT INDEX SECTION
LOOPV    VLVCU 1
         VLVM  3
         VLME  2,2(0)
         VSTKE 2,4(0)
         BC    2,LOOPV
* CONCLUSION VECTOR
*
         LM    1,5,24(13)
         BR    14
*
* NO SECTIONING
*
*
NOSECT   VLVCA 0(1)
         VLVM  3
         VLME  2,2(0)
         VSTKE 2,4(0)
* CONCLUSION NO SECTIONING
*
         LM    1,5,24(13)
         BR    14
*
*
         END
#endif