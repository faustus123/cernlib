*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:19  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE ZFCTOF
*
*     Action routine for CTOF command
*
#include "cspack/czsock.inc"
      CHARACTER*64 LOCAL,REMOTE
      CHARACTER*4  CHOPT
      INTEGER      RRECL
 
      CALL KUGETS(LOCAL,NCHL)
      CALL KUGETS(REMOTE,NCHR)
      CALL KUGETI(LRECL)
      CALL KUGETC(CHOPT,NCH)
#include "cspack/czfold.inc"
      CALL XZCTOF(LOCAL,REMOTE,LRECL,CHOPT,IRC)
99    END
 
