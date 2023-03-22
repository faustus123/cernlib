*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:43  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDLUPU(CHPATH,IRC)
      CHARACTER*(*)    CHPATH
#include "hepdb/quest.inc"
#include "hepdb/cdlupc.inc"
 
      IF(IQUEST(14).EQ.0) RETURN
      CALL CDLMOD(CHPATH,ID,IT,' ',IRC)
 
      IF(ID.GT.IDMAXU) THEN
         IDMAXU = ID
         ITMAXU = IT
         CHDIRU = CHPATH(1:LENOCC(CHPATH))
      ELSEIF(ID.EQ.IDMAXU.AND.IT.GT.ITMAXU) THEN
         ITMAXU = IT
         CHDIRU = CHPATH(1:LENOCC(CHPATH))
      ENDIF
 
      END
