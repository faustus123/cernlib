*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:54  mclareni
* Initial revision
*
*
#include "kerngent/pilot.h"
      SUBROUTINE TUCTOH

#include "kerngent/mkcde.inc"

      DIMENSION    IQLETT(26)
      EQUIVALENCE (IQLETT(1),IBCD(12)), (IQBLAN,IBCD(1))

      CHARACTER    CH1*40

C-----------       UH1TOC - UCTOH1

      CALL NEWGUY ('UH1TOC-UCTOH1.','TUCTOH  ')
      CALL UCOPY (IBCD,IB,40)

      CALL UH1TOC (IB,CH1,40)

      DO 24 NCHT=1,24
      CALL UH1TOC (IQLETT,CH1,NCHT)
      CALL UCTOH1 (CH1,IA,40)
      IB(NCHT) = IQLETT(NCHT)
      CALL MVERII (NCHT,IA,IB,40)
   24 CONTINUE

C-----------       UHTOC

      CALL NEWGUY ('UHTOC.','TUCTOH  ')

C      WRITE (ITB,9934) (IBCD(J),J,J=1,47)
C 9934 FORMAT (' IBCD:    ',5(Z9,I3)/(10X,5(Z9,I3)))

C      WRITE (ITB,9935) (IQLETT(J),J,J=1,27)
C 9935 FORMAT (1X/' IQLETT:  ',5(Z9,I3)/(10X,5(Z9,I3)))

      DO 35 NCHPW=1,IQCHAW
      ID = 100*NCHPW
      CALL UCOPY  (IBCD,IB,40)
      CALL UTRANS (IQLETT,IB(101),28,1,NCHPW)

      CALL UH1TOC (IB,CH1,40)

      DO 34 NCHT=1,24
      CALL UHTOC  (IB(101),NCHPW,CH1,NCHT)
      CALL UCTOH1 (CH1,IA,40)
      IB(NCHT) = IQLETT(NCHT)
      CALL MVERII (ID+NCHT,IA,IB,40)
   34 CONTINUE
      CALL PRTEST
   35 CONTINUE

C-----------       UCTOH

      CALL NEWGUY ('UCTOH.','TUCTOH  ')
      CALL UH1TOC (IQLETT,CH1,26)
      IA(1) = 99
      IB(1) = 99

      DO 45 NCHPW=1,IQCHAW
      ID = 100*NCHPW

      DO 44 NCHT=1,24
      CALL UTRANS (IQLETT,IB(2),NCHT,1,NCHPW)

      NW = (NCHT-1)/NCHPW + 3
      IA(NW) = -99
      IB(NW) = -99
      CALL UCTOH (CH1,IA(2),NCHPW,NCHT)
      CALL MVERII (ID+NCHT,IA,IB,NW)
   44 CONTINUE
      CALL PRTEST
   45 CONTINUE

C--      TIMING
      IF (ITIMES.EQ.0)       RETURN
      NTIMES = ITIMES * 1000

C--                UHTOC / UH1TOC

      DO 66 NCHT=4,40,6
      DO 63 NCHPW=4,1,-1

      CALL TIMED (TIMERD)
      DO 62 JN=1,NTIMES
      CALL UHTOC (IB,NCHPW,CH1,NCHT)
   62 CONTINUE
      CALL TIME77 (NTIMES,'UHTOC ',NCHT*100+NCHPW,' ')
   63 CONTINUE

      CALL TIMED (TIMERD)
      DO 65 JN=1,NTIMES
      CALL UH1TOC (IB,CH1,NCHT)
   65 CONTINUE
      CALL TIME77 (NTIMES,'UH1TOC',NCHT*100,' ')
   66 CONTINUE

C--                UCTOH / UCTOH1

      DO 76 NCHT=4,40,6
      DO 73 NCHPW=4,1,-1

      CALL TIMED (TIMERD)
      DO 72 JN=1,NTIMES
      CALL UCTOH (CH1,IB,NCHPW,NCHT)
   72 CONTINUE
      CALL TIME77 (NTIMES,'UCTOH ',NCHT*100+NCHPW,' ')
   73 CONTINUE

      CALL TIMED (TIMERD)
      DO 75 JN=1,NTIMES
      CALL UCTOH1 (CH1,IB,NCHT)
   75 CONTINUE
      CALL TIME77 (NTIMES,'UCTOH1',NCHT*100,' ')
   76 CONTINUE
      RETURN
      END
