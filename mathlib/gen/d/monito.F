*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:20  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE MONITO (S,M,NN3,IT,EPS,GT,AKAPPA,ALAMBD)
C-----ITERATION PROGRESS OUTPUT
#include "d510pl.inc"
#include "d510si.inc"
#include "d510ui.inc"
#include "d510uo.inc"
      IF (IT) 11,3,1
 1    IF (NN3) 4,4,2
 2    IF (NM) 3,4,4
 3    IF (ENDFLG) 4,12,4
C-----PRINTER CARRIAGE CONTROL
 4    I1=6
      IF (M.GT.6) I1=5
      IF (M.GT.12) I1=4
      IF (M.GT.23) I1=1
#if !defined(CERNLIB_CDC)
C   NON-ANSI CARRIAGE CONTROL SUPPRESSED ON IBM
      IF(I1.GT.1) I1=0
#endif
      WRITE(6,19) I1,NN3,S,GT,AKAPPA,ALAMBD
      DO 10 I=1,M
      IF (PL0(I)) 9,9,5
 5    IF (PL (I)) 8,7,6
 6    CONTINUE
      WRITE(6,20) I,A(I),SIGMA(I),R(I)
      GO TO 10
 7    WRITE(6,21) I,A(I),SIGMA(I),R(I)
      GO TO 10
 8    IF (PL(I).GE.-1.) GO TO 7
      WRITE(6,22) I,A(I)
      GO TO 10
 9    WRITE(6,23) I,A(I)
 10   CONTINUE
 11   NM=-IT
 12   NM=NM+1
      IF (ENDFLG) 13,14,14
 13   I=-ENDFLG
      GO TO (15,16,17,18), I
 14   RETURN
 15   IF(IT.GE.0) WRITE(6,24)
      GO TO 14
 16   IF(IT.GE.0) WRITE(6,25)
      GO TO 14
 17   IF(IT.GE.0) WRITE(6,26)
      GO TO 14
 18   IF(IT.GE.0) WRITE(6,27)
      GO TO 14
C
 19   FORMAT(I1,'ITERATION NO.',I3,', S= ',E12.5,', EC = ',E12.5,
     +', KAPPA= ',E12.5,', LAMBDA= ',E12.5//1X,2(6X,'PARAMETER'),
     +9X,'STANDARD',8X,'CORRELATION'/9X,'NUMBER',9X,'VALUE',11X,
     +'DEVIATION',9X,'FACTOR'/)
 20   FORMAT(9X,I3,4X,3(5X,E12.5))
 21   FORMAT(9X,I3,4X,3(5X,E12.5),' PARAMETER ON BOUNDARY')
 22   FORMAT(9X,I3,9X,E12.5,5X,'INFINITE ERROR ESTIMATED')
 23   FORMAT(9X,I3,9X,E12.5,5X,'THIS PARAMETER FIXED')
 24   FORMAT('0MINIMISATION TERMINATED: NO FURTHER DECREASE IN S',
     + ' IS OBTAINABLE'/'1')
 25   FORMAT('0MINIMISATION TERMINATED: INFINITE ERRORS ESTIMATED'/'1')
 26   FORMAT('0MINIMISATION TERMINATED: ITERATION LIMIT REACHED'/'1')
 27   FORMAT('0MINIMISATION TERMINATED: NEGATIVE OR ZERO Y ENCOUNTERED',
     + ' AS LOGARITHMIC ARGUMENT',/'1')
      END
