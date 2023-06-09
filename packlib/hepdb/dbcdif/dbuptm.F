*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:25:01  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBUPTM (IDATE, ITIME, IDATM)
*     =======================================
*
************************************************************************
*                                                                      *
*        SUBR. DBUPTM (IDATE*, ITIME*, IDATM)                          *
*                                                                      *
*   Unpacks date and time from one word                                *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     IDATE    Date : 6 Decimal integer : YYMMDD                       *
*     ITIME    Time : 4 Decimal integer : HHMM                         *
*     IDATM    Packed date-time                                        *
*                                                                      *
*   Called by user,   DBFZUP, DBLKEY, DBNTOP, DBPRGD, DBSRTM, DBENFZ,  *
*             DBPLOB, DBDKYH, DBDKYV                                   *
*                                                                      *
************************************************************************
*
      CALL CDUPTM (IDATE, ITIME, IDATM, IRC)
*                                                             END DBUPTM
      END
