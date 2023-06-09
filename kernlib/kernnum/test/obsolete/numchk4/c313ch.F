*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:39  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
#if defined(CERNLIB_NEVER)
          SUBROUTINE C313CH(OK)
          LOGICAL         OK, OKI0, OKI1, OKK0, OKK1
          CHARACTER*5     ERRCNT
#include "kernnumt/sysdat.inc"
          EXTERNAL         BESI0, BESI1, BESK0, BESK1
          EXTERNAL         EBESI0,EBESI1,EBESK0,EBESK1
          REAL             BESI0, BESI1, BESK0, BESK1, RF
          REAL             EBESI0,EBESI1,EBESK0,EBESK1
#if defined(CERNLIB_NUMLOPRE)
          EXTERNAL         DBESI0,DBESI1,DBESK0,DBESK1
          EXTERNAL         DEBSI0,DEBSI1,DEBSK0,DEBSK1
          DOUBLE PRECISION DBESI0,DBESI1,DBESK0,DBESK1,DF
          DOUBLE PRECISION DEBSI0,DEBSI1,DEBSK0,DEBSK1
#endif
          PARAMETER(KOUNTX  =  3)
          DOUBLE PRECISION X(KOUNTX)
          DOUBLE PRECISION BI0(KOUNTX),BI1(KOUNTX)
          DOUBLE PRECISION BK0(KOUNTX),BK1(KOUNTX)
          DOUBLE PRECISION EI0(KOUNTX),EI1(KOUNTX)
          DOUBLE PRECISION EK0(KOUNTX),EK1(KOUNTX)
          DATA X   / 0.125D0,  1.D0,  10.D0 /
          DATA BI0 / 0.10039 10066 3533D1,
     +               0.12660 65877 7520D1,
     +               0.28157 16628 4663D4  /
          DATA BI1 / 0.62622 14981 1235D-1,
     +               0.56515 91039 9248D0,
     +               0.26709 88303 7012D4  /
          DATA BK0 / 0.22078 69086 7449D1,
     +               0.42102 44382 4071D0,
     +               0.17780 06231 6167D-4 /
          DATA BK1 / 0.78311 18299 1157D1,
     +               0.60190 72301 9723D0,
     +               0.18648 77345 3825D-4 /
          DATA EI0 / 0.88594 75240 3032D0,
     +               0.46575 96075 9364D0,
     +               0.12783 33371 6343D0  /
          DATA EI1 / 0.55263 85324 1603D-1,
     +               0.20791 04153 4971D0,
     +               0.12126 26813 8446D0  /
          DATA EK0 / 0.25018 43440 2191D1,
     +               0.11444 63079 8069D1,
     +               0.39163 19344 3660D0  /
          DATA EK1 / 0.88738 19586 4264D1,
     +               0.16361 53486 2633D1,
     +               0.41076 65705 9580D0  /
          TRUNCI  =  5E-13
          TRUNCK  =  5E-12
#if defined(CERNLIB_NUMHIPRE)
          RROUND  =  RELPRT(1)*10.
          CALL RFEQDY(KOUNTX,X,BESI0, BI0,TRUNCI,RROUND,OKI0)
          CALL RFEQDY(KOUNTX,X,BESI1, BI1,TRUNCI,RROUND,OKI1)
          CALL RFEQDY(KOUNTX,X,BESK0, BK0,TRUNCK,RROUND,OKK0)
          CALL RFEQDY(KOUNTX,X,BESK1, BK1,TRUNCK,RROUND,OKK1)
          OK  =  OKI0 .AND. OKI1 .AND. OKK0 .AND. OKK1
          CALL RFEQDY(KOUNTX,X,EBESI0,EI0,TRUNCI,RROUND,OKI0)
          CALL RFEQDY(KOUNTX,X,EBESI1,EI1,TRUNCI,RROUND,OKI1)
          CALL RFEQDY(KOUNTX,X,EBESK0,EK0,TRUNCK,RROUND,OKK0)
          CALL RFEQDY(KOUNTX,X,EBESK1,EK1,TRUNCK,RROUND,OKK1)
          OK  =  OK .AND. OKI0 .AND. OKI1 .AND. OKK0 .AND. OKK1
#endif
#if defined(CERNLIB_NUMLOPRE)
          RROUND  =  RELPRT(1)
          DROUND  =  RELPRT(2)*10.
          CALL DFEQDY(KOUNTX,X,DBESI0,BI0,TRUNCI,DROUND,OKI0)
          CALL DFEQDY(KOUNTX,X,DBESI1,BI1,TRUNCI,DROUND,OKI1)
          CALL DFEQDY(KOUNTX,X,DBESK0,BK0,TRUNCK,DROUND,OKK0)
          CALL DFEQDY(KOUNTX,X,DBESK1,BK1,TRUNCK,DROUND,OKK1)
          OK  =  OKI0 .AND. OKI1 .AND. OKK0 .AND. OKK1
          CALL DFEQDY(KOUNTX,X,DEBSI0,EI0,TRUNCI,DROUND,OKI0)
          CALL DFEQDY(KOUNTX,X,DEBSI1,EI1,TRUNCI,DROUND,OKI1)
          CALL DFEQDY(KOUNTX,X,DEBSK0,EK0,TRUNCK,DROUND,OKK0)
          CALL DFEQDY(KOUNTX,X,DEBSK1,EK1,TRUNCK,DROUND,OKK1)
          OK  =  OK .AND. OKI0 .AND. OKI1 .AND. OKK0 .AND. OKK1
          CALL RFEQDF(KOUNTX,X,BESI0, DBESI0,TRUNCI,RROUND,OKI0)
          CALL RFEQDF(KOUNTX,X,BESI1, DBESI1,TRUNCI,RROUND,OKI1)
          CALL RFEQDF(KOUNTX,X,BESK0, DBESK0,TRUNCK,RROUND,OKK0)
          CALL RFEQDF(KOUNTX,X,BESK1, DBESK1,TRUNCK,RROUND,OKK1)
          OK  =  OK .AND. OKI0 .AND. OKI1 .AND. OKK0 .AND. OKK1
          CALL RFEQDF(KOUNTX,X,EBESI0,DEBSI0,TRUNCI,RROUND,OKI0)
          CALL RFEQDF(KOUNTX,X,EBESI1,DEBSI1,TRUNCI,RROUND,OKI1)
          CALL RFEQDF(KOUNTX,X,EBESK0,DEBSK0,TRUNCK,RROUND,OKK0)
          CALL RFEQDF(KOUNTX,X,EBESK1,DEBSK1,TRUNCK,RROUND,OKK1)
          OK  =  OK .AND. OKI0 .AND. OKI1 .AND. OKK0 .AND. OKK1
#endif
#if defined(CERNLIB_NUMHIPRE)
          ERRCNT  =  ' FOUR'
#endif
#if defined(CERNLIB_NUMLOPRE)
          ERRCNT  =  'EIGHT'
#endif
          IF(      ERPRNT .AND.       ERSTOP) WRITE(*,101) ERRCNT
          IF(      ERPRNT .AND. .NOT. ERSTOP) WRITE(*,102) ERRCNT
          IF(.NOT. ERPRNT .AND.       ERSTOP) WRITE(*,103) ERRCNT
          RF  =  BESK0(0.)
          IF(RF .NE. 0.)  THEN
             OK  =  .FALSE.
             WRITE(*,104) ' BESK0', ' BESK0', RF, 'C313.1'
          ENDIF
          RF  =  BESK1(-.001)
          IF(RF .NE. 0.)  THEN
             OK  =  .FALSE.
             WRITE(*,104) ' BESK1', ' BESK1', RF, 'C313.1'
          ENDIF
          RF  =  EBESK0(-.001)
          IF(RF .NE. 0.)  THEN
             OK  =  .FALSE.
             WRITE(*,104) 'EBESK0', 'EBESK0', RF, 'C313.1'
          ENDIF
          RF  =  EBESK1(0.)
          IF(RF .NE. 0.)  THEN
             OK  =  .FALSE.
             WRITE(*,104) 'EBESK1', 'EBESK1', RF, 'C313.1'
          ENDIF
#if defined(CERNLIB_NUMLOPRE)
          DF  =  DBESK0(0.D0)
          IF(DF .NE. 0.D0)  THEN
             OK  =  .FALSE.
             WRITE(*,104) 'DBESK0', 'DBESK0', DF, 'C313.1'
          ENDIF
          DF  =  DBESK1(-.001D0)
          IF(DF .NE. 0.D0)  THEN
             OK  =  .FALSE.
             WRITE(*,104) 'DBESK1', 'DBESK1', DF, 'C313.1'
          ENDIF
          DF  =  DEBSK0(-.001D0)
          IF(DF .NE. 0.D0)  THEN
             OK  =  .FALSE.
             WRITE(*,104) 'DEBSK0', 'DEBSK0', DF, 'C313.1'
          ENDIF
          DF  =  DEBSK1(0.D0)
          IF(DF .NE. 0.D0)  THEN
             OK  =  .FALSE.
             WRITE(*,104) 'DEBSK1', 'DEBSK1', DF, 'C313.1'
          ENDIF
#endif
          RETURN
  101 FORMAT(/2X,A5,' ERROR AND ABEND MESSAGES SHOULD NOW FOLLOW ...')
  102 FORMAT(/2X,A5,' ERROR MESSAGES SHOULD NOW FOLLOW ...')
  103 FORMAT(/2X,A5,' ABEND MESSAGES SHOULD NOW FOLLOW ...')
  104 FORMAT(/' ????? TEST OF ',A6,' ... ',A6,' =', E20.10,
     +       ' ERROR CONDITION ', A6, ' NOT DETECTED.')
      END
#endif
