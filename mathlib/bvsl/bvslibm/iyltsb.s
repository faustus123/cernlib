*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:56  mclareni
* Initial revision
*
*
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QMIBMVF))
*CMZ :          04/05/90  16.17.26  by  Michel Roethlisberger/IBM
*-- Author :
*********************************************************************
*     SUBROUTINE IYLTSB(NW,IN,ITEST,INDEX,IFOUND)
*
*
*
*********************************************************************
IYLTSB  CSECT
#if defined(CERNLIB_QMIBMXA)
IYLTSB  AMODE 31
IYLTSB  RMODE ANY
#endif
         USING *,15
         STM   0,9,20(13)
* R2 IN, R3 ITEST, R4 INDEX, R5 IFOUND
         LM    1,5,0(1)
*
*IN R1 NW - IN R3 ISTR - IN R4 ITEST
         L     8,0(0,1)
         L     3,0(0,3)
* TEST ON VECTOR SIZE IF VS LE 128 NO SECTIONING
         LA    1,128
         SR    1,8
         BC    2,NOSECT
*
         SR    9,9
LOOP     VLVCU 8
         VCS   2,3,2(0)
         VCOVM 9
         VSTVM 4
         LTR   8,8
         BC    2,LOOP
         ST    9,0(5)
         LM    0,9,20(13)
         BR    14
*
NOSECT   VLVCA 0(8)
         SR    9,9
*
         VCS   2,3,2(0)
         VCOVM 9
         VSTVM 4
         ST    9,0(5)
         LM    0,9,20(13)
         BR    14
         END
#endif
