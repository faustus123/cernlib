*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:41  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMEXIT
#include "fatmen/fatsys.inc"
#include "fatmen/fatron.inc"
      IF (THRONG(1:4) .NE. 'NONE') THEN
#if defined(CERNLIB_IBMVM)
         IF(SERMOD.NE.'A'.AND.SERMOD.NE.'?')
     +      CALL VMCMS('EXEC DROP '//SERMOD,IRC)
#endif
         CALL FMEND(IRC)
      ENDIF
      END
