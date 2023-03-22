*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:41  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMGIME
#include "fatmen/fatsys.inc"
#if (defined(CERNLIB_IBMVM))&&(!defined(CERNLIB_FATSRV))
*
*     Relink to disk of service machine
*
      CALL VMCMS('EXEC GIME '//SERNAM,IRC)
#endif
      END
