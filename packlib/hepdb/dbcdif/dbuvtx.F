*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:02  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBUVTX (IDAY, ITIM)
*     ==============================
*
************************************************************************
*                                                                      *
*        SUBR. DBUVTX (IDAY*, ITIM*)                                   *
*                                                                      *
*   Returns the current date and time                                  *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     IDAY     Date in YYMMDD                                          *
*     ITIM     Time in seconds                                         *
*                                                                      *
*   Called by DBFOPN, DBxxxx in the Example patches                    *
*                                                                      *
************************************************************************
*
      CALL CDUVTX (IDAY, ITIM)
*                                                             END DBUVTX
  999 END
