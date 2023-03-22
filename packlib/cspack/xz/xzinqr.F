*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:29  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE XZINQR(LUN,FNAME,NODE,IEXIST,LRECL,IRC)
#include "cspack/hcmail.inc"
#include "cspack/czsock.inc"
#include "cspack/quest.inc"
      CHARACTER*(*) FNAME,NODE
*
*     Issue remote INQUIRE. Extra information may be returned via IQUEST
*
      CALL CZSWAP(NODE,LUN,ISTAT)
      LF     = LENOCC(FNAME)
      CHMAIL = 'XZIO :INQR'//FNAME(1:LF)
      CALL CZPUTA(CHMAIL,ISTAT)
*
*     Read result
*
#include "cspack/czmess.inc"
      CALL CZSWAP(' ',0,ISTAT)
 
      IEXIST = IRC
 
      END
