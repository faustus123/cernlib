*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:01  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBTBPR
*     =================
*
************************************************************************
*                                                                      *
*        SUBR. DBTBPR                                                  *
*                                                                      *
*   Prints accumulated summary for the given run with the Data Base    *
*                                                                      *
*   Called by user                                                     *
*                                                                      *
*   Error Condition :                                                  *
*                                                                      *
*     IQUEST(1) =  0 : No error                                        *
*               = 98 : Invalid path name in Node bank                  *
*                                                                      *
************************************************************************
*
#include "hepdb/cdcblk.inc"
*
*     ------------------------------------------------------------------
*
      CALL CDSTAT (LPRTCD, IRC)
      IQUEST(1) = IRC
*                                                             END DBTBPR
  999 END
