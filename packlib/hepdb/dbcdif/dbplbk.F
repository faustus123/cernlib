*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:03  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBPLBK (LAD)
*     =======================
*
************************************************************************
*                                                                      *
*        SUBR. DBPLBK (LAD)                                            *
*                                                                      *
*   Draw the nodes on the screen as given in the bank addressed by LAD *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     LAD      Address of the bank containing the information          *
*                                                                      *
*   Called by DBACPL                                                   *
*                                                                      *
*   Error Condition :                                                  *
*                                                                      *
*     IQUEST(1) =  0 : No error                                        *
*                                                                      *
************************************************************************
*
#include "hepdb/cdcblk.inc"
      DIMENSION       LAD(9)
*
*     ------------------------------------------------------------------
*
      CALL CDPLBK (LAD, IRC)
      IQUEST(1) = IRC
*                                                             END DBPLBK
  999 END
