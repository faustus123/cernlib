*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:57  mclareni
* Initial revision
*
*
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QMIBMVF))
*********************************************************************
*     SUBROUTINE SXPYB(NW,BINV,Y,X,ALPHA)
*
*         Y = Y + ALPHA*X
*
*********************************************************************
SXPYB   CSECT
#if defined(CERNLIB_QMIBMXA)
SXPYB   AMODE 31
SXPYB   RMODE ANY
#endif
         USING *,15
         STM   0,7,20(13)
* R1 NW, R2 BINV, R3 Y, R4 X, R5 ALPHA
         LM    1,5,0(1)
*
*IN R1 NW
         L     1,0(0,1)
*IN F6 ALPHA
         LE    6,0(0,5)
         LR    7,3
*
         VSVMM 1
LOOP     VLVCU 1
         VLVM  2
         VLME  0,3
         VMAES 0,6,4
         VSTME 0,7
         BC    2,LOOP
         VSVMM 0
         LM    0,7,20(13)
         BR    14
*
         END
#endif
