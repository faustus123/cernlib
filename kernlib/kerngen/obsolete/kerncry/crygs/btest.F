*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:34  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      LOGICAL FUNCTION BTEST(I,N)
C
C CERN PROGLIB# M441    BTEST           .VERSION KERNCRY  1.06  870527
C ORIG. 17/11/86  CNAF,DBOLOGNA, corrected 19/5/87
C
C      CRAY VERSION OF ANSI/ISA FUNCTION BTEST
C      N IS THE BIT TO BE TESTED
C
      BTEST = AND(I, SHIFTL(1,N)) .NE. 0
      END
#ifdef CERNLIB_TCGEN_BTEST
#undef CERNLIB_TCGEN_BTEST
#endif
