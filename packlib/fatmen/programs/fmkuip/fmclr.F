*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:41  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMCLR
#if defined(CERNLIB_IBMVM)
      CALL VMCMS('VMFCLEAR',IRET)
#endif
#if defined(CERNLIB_UNIX)
      INTEGER SYSTEMF
      IC = SYSTEMF('clear')
#endif
      END
 
