*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:19  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDIFCH (CH, I)
*     =========================
*
************************************************************************
*                                                                      *
*        SUBR. CDIFCH (CH, I*)                                         *
*                                                                      *
*   Converts single character CH (of type character) to an output      *
*   integer I via the look-up table stored in CSTRCA                   *
*   (Adapted from CHTOI from CERN Library)                             *
*                                                                      *
*   Called by CDLINC                                                   *
*                                                                      *
************************************************************************
*
#include "hepdb/caopti.inc"
      CHARACTER       CH*1
*     ------------------------------------------------------------------
*
      I = INDEX (CSTRCA(32:127), CH)
      I = I + 31
*                                                             END CDIFCH
      END
