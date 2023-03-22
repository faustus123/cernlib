*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:02  mclareni
* Initial revision
*
*
#if defined(CERNLIB_QMIBMVF)
*********************************************************************
*
* CERN PROGLIB# F122    WHENFGE         .VERSION GEN      2.30  890530
* ORIG. 05/30/89    F. Antonelli/IBM
*
*********************************************************************
*********************************************************************
*     SUBROUTINE WHENFGE(NW,AN,ISTR,ATEST,INDEX,IFOUND)
*     DIMENSION AN(*),INDEX(*)
*       IFOUND=0
*       INDICE=1
*       IF(INDICE.LT.0)INDICE=-ISTR*(NW-1)+1
*       DO J=1,NW
*         IF(AN(INDICE).GE.ATEST) THEN
*          IFOUND=IFOUND+1
*          INDEX(IFOUND)=INDICE
*         ENDIF
*       INDICE=INDICE+ISTR
*       ENDDO
*********************************************************************
WHENFGE  START 0
#if defined(CERNLIB_QMIBMXA)
WHENFGE  AMODE ANY
WHENFGE  RMODE ANY
#endif
         USING *,15
         STM   0,9,20(13)
* R2 IN, R3 ISRT, R4 ITEST, R5 INDEX, R6 IFOUND
         LM    1,6,0(1)
*
*IN R1 NW - IN R3 ISTR - IN R4 ITEST
         L     8,0(0,1)
         LE    0,0(0,4)
         L     3,0(0,3)
         SR    1,1
* CHECK THE STRIDE IF < 0 BACKWARD
         SR    1,3
         BC    2,BACK
* TEST ON VECTOR SIZE IF VS LE 128 NO SECTIONING
         LA    1,128
         SR    1,8
         BC    2,NOSECT
*
         LA    7,1
         SR    9,9
LOOP     VLVCU 8
         VCES  12,0,2(3)
         VCOVM 9
         VLINT 0,7(3)
         VSTKE 0,5
         LTR   8,8
         BC    2,LOOP
         ST    9,0(6)
         LM    0,9,20(13)
         BR    14
*
NOSECT   VLVCA 0(8)
         LA    7,1
         SR    9,9
*
         VCES  12,0,2(3)
         VCOVM 9
         VLINT 0,7(3)
         VSTKE 0,5
         ST    9,0(6)
         LM    0,9,20(13)
         BR    14
* BACKWARD SECTION ISTR < 0
BACK     EQU   *
         LA    7,1
* SET THE STARTING POINT TO -ISTR*NW+ISTR+1
         LPR   1,3
         MR    0,8
         AR    1,3
         LR    9,1
         AR    9,7
         LA    7,4
         MR    0,7
         AR    1,2
*
* TEST ON VECTOR SIZE IF VS LE 128 NO SECTIONING
         LA    7,128
         SR    7,8
         BC    2,NOSEC1
         SR    7,7
*
LOOP1    VLVCU 8
         VCES  12,0,1(3)
         VCOVM 7
         VLINT 0,9(3)
         VSTKE 0,5
         LTR   8,8
         BC    2,LOOP1
         ST    7,0(6)
         LM    0,9,20(13)
         BR    14
*
NOSEC1   SR    7,7
*
         VLVCA 0(8)
         VCES  12,0,1(3)
         VCOVM 7
         VLINT 0,9(3)
         VSTKE 0,5
         ST    7,0(6)
         LM    0,9,20(13)
         BR    14
         END
#endif
