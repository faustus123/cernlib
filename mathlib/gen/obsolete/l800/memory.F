*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:17  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
#if (defined(CERNLIB_F4))&&(!defined(CERNLIB_NOSBE))
      SUBROUTINE MEMORY(N,NTOT,IERR)
      N2 = N
      NTOT = INCMEM(N2)
      IERR = N2-N
      RETURN
      END
#endif
