*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:00  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBRALI (ALIAS, PATH)
*     ===============================
*
************************************************************************
*                                                                      *
*        SUBR. DBRALI (ALIAS, PATH*)                                   *
*                                                                      *
*   Retrieve the complete path name from the alias name                *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     ALIAS    Character string specifying the alias name              *
*     PATH(*)  Character string specifying the directory path name     *
*                                                                      *
*   Called by user,   DBACPL, DBAUXI                                   *
*                                                                      *
*   Error Condition :                                                  *
*                                                                      *
*     IQUEST(1) =  0 : No error                                        *
*               =205 : Not a valid alias name                          *
*                                                                      *
************************************************************************
*
#include "hepdb/cdcblk.inc"
      CHARACTER       PATH*(*), ALIAS*(*)
*     ------------------------------------------------------------------
*
      CALL CDRALI (ALIAS, PATH, IRC)
      IQUEST(1) = IRC
*                                                             END DBRALI
  999 END
