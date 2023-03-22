*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:56  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      COMPILER(FLD=ABS)
C                                  LAST MODIF.  21/03/78
C                                  FROM COPENHAGEN 3/35/72
 
      FUNCTION JRSBYT(IVAL,X,JTH,NBITS)
 
      JRSBYT=FLD(37-JTH-NBITS,NBITS,X)
      FLD(37-JTH-NBITS,NBITS,X)=IVAL
      RETURN
      END
#ifdef CERNLIB_TCGEN_JRSBYT
#undef CERNLIB_TCGEN_JRSBYT
#endif
