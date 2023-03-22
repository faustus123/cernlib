*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:44  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDALARM(IPID,IRC)
 
#if defined(CERNLIB_UNIX)
      INTEGER       KILLF
*
*     Send NOHUP signal to server process
*
 
      IRC = KILLF(IPID,1)
#endif
 
      END
