*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:00  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBPKTM (IDATE, ITIME, IDATM)
*     =======================================
*
************************************************************************
*                                                                      *
*        SUBR. DBPKTM (IDATE, ITIME, IDATM*)                           *
*                                                                      *
*   Packs date and time into one word                                  *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     IDATE    Date : 6 Decimal integer : YYMMDD                       *
*     ITIME    Time : 4 Decimal integer : HHMM                         *
*     IDATM*   Packed date-time                                        *
*                                                                      *
*   Called by user,   DBDELT, DBEFOR, DBENTB, DBINIT, DBMDIP, DBPRGD,  *
*             DBCDIC, DBENFZ, DBKOUT, DBSDIR, DBSNAM, DBSPUR, DBUDIC,  *
*             DBPLOB, DBACPL, DBAUXI, DBDCKH, DBDCKV                   *
*                                                                      *
************************************************************************
*
      CALL CDPKTM (IDATE, ITIME, IDATM, IRC)
*                                                             END DBPKTM
      END
