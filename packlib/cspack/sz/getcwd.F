*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:26  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
#if (defined(CERNLIB_IBMRT))&&(defined(CERNLIB_PLODGE))
      SUBROUTINE GETCWD_(CHPATH)
      CHARACTER*() CHPATH
      CALL GETCWD(CHPATH,L)
      END
 
#endif
