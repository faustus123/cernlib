*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:23  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDUSIN
*     =================
*
************************************************************************
*                                                                      *
*        SUBR. CDUSIN                                                  *
*                                                                      *
*   Default user routine for action needed in between 2 plots          *
*                                                                      *
*   Called by CDPLOB, CDPLOV                                           *
*                                                                      *
************************************************************************
*
      IWKST  = 1
      CALL IGSA (IWKST)
*                                                             END CDUSIN
      END
