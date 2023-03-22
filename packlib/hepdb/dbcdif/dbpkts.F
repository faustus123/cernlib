*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:00  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBPKTS (IDATE, ITIME, IDATM)
*     =======================================
*
************************************************************************
*                                                                      *
*        SUBR. DBPKTS (IDATE, ITIME, IDATM*)                           *
*                                                                      *
*   Packs date and time into one word                                  *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     IDATE    Date : 6 Decimal integer : YYMMDD                       *
*              (Only Year > 80 allowed)                                *
*     ITIME    Time : 6 Decimal integer : HHMMSS                       *
*     IDATM*   Packed date-time                                        *
*                                                                      *
*   Called by user,   DBINIT, DBCDIC, DBSNAM, DBUDIC, DBPLNT, DBPLOB,  *
*             DBPLOV, DBPLTI, DBACPL, DBAUXI, DBDCKH, DBDCKV, DBVIEW   *
*                                                                      *
************************************************************************
*
      CALL CDPKTS (IDATE, ITIME, IDATM, IRC)
*                                                             END DBPKTS
      END
