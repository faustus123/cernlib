*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:40  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_kernbit/pilot.h"
      SUBROUTINE TIMAX (T)
C***********************************************************************
C RETURN NORMALISED TIME (only useful at CERN, where the accounted time
C is different to the native CPU)
C A VERY TEMPORARY 3090 ONLY VERSION              HRR
C COULD USE JOB$VM FOR BATCH BUT NOT YET FOR INTERACTIVE SO LEAVE SIMPLE
C***********************************************************************
#if !defined(CERNLIB_CERNVMB)
      DATA RNORM /20.0/
#endif
#if defined(CERNLIB_CERNVMB)
      DATA RNORM / 5.0/
#endif
      CALL TIMEX(TT)
      GO TO 100
      ENTRY TIMAL (T)
      CALL TIMEL (TT)
      GO TO 100
      ENTRY TIMAD (T)
      CALL TIMED (TT)
  100 T= TT*RNORM
      RETURN
      ENTRY TIMAST (T)
      TT= T/RNORM
      CALL TIMEST (TT)
      RETURN
      END
