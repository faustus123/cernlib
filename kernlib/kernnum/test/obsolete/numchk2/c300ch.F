*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:38  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
#if defined(CERNLIB_NEVER)
      SUBROUTINE C300CH(NREP,OKPK)
      LOGICAL OKPK
#include "kernnumt/sysdat.inc"
C
      DATA RELPR2/ 1.E-15 /
C  (RELPR2 IS THE PRECISION THRESHOLD FOR THE DOUBLE PRECISION ENTRIES)
      DATA MRATIO/ 10 /
#if defined(CERNLIB_NUME38)
      DATA NTAB/91/
#endif
#if !defined(CERNLIB_NUME38)
      DATA NTAB/99/
#endif
C
C  TEST-ROUTINE FOR C300 (ERF,ERFC,FREQ,DERF,DERFC,DFREQ).
C  CALLS ... FUNCTIONS ERF, ERFC, FREQ, DERF, DERFC, DFREQ.
C        ... TEST-ROUTINES C300ER, C300GT.
C  START.
      OKPK=.FALSE.
      IF(NREP.LE.0) RETURN
      RATREF=MRATIO
      ITEST=0
      IFAIL=0
      RATMAX=0.
      DO 2 I=1,NTAB
         DO 1 ISIGN=1,2
            CALL C300ER('R',I,ISIGN,EREL,ECREL,F2REL)
            REL=MAX(EREL,ECREL,F2REL)
            RATIO=ABS(REL)/RELPR
            RATMAX=MAX(RATMAX,RATIO)
            IF(RATIO.GT.RATREF) IFAIL=IFAIL+1
            ITEST=ITEST+1
#if defined(CERNLIB_NUMLOPRE)
            CALL C300ER('D',I,ISIGN,EREL,ECREL,F2REL)
            REL=MAX(EREL,ECREL,F2REL)
            RATIO=ABS(REL)/RELPR2
            RATMAX=MAX(RATMAX,RATIO)
            IF(RATIO.GT.RATREF) IFAIL=IFAIL+1
            ITEST=ITEST+1
#endif
    1    CONTINUE
    2 CONTINUE
      OKPK=IFAIL.EQ.0
      IF(OKPK) RETURN
      WRITE(*,2000) IFAIL,ITEST,RATMAX
      RETURN
C
 2000 FORMAT( // 18H ***** C300CH ... , I4, 15H  FAILURES IN  ,
     *        I4, 25H  TESTS.  RATMAX/RELPR = , 1P, E8.1 )
      END
#endif
