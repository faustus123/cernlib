*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:23:53  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDLOKF (CHID, LBUF, NBUF, I)
*
************************************************************************
*
*        SUBR. CDLOKF (CHID, LBUF, NBUF, I*)
*
*   Finds a character string in an array of hollerith numbers
*
*   Arguments :
*
*     CHID     Character string
*     LBUF     Array of NBUF length
*     I        Index number in LBUF corresponding to CHID
*
*   Called by CEXAM11
*
************************************************************************
*
      CHARACTER*4     CHID
      DIMENSION       LBUF(2)
*     ------------------------------------------------------------------
*
      CALL UCTOH (CHID, ICHID, 4, 4)
      I      = IUCOMP (ICHID, LBUF, NBUF)
*                                                             END CDLOKF
      END
 
