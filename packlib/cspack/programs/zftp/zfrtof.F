*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:19  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE ZFRTOF
*
*     Action routine for RTOF command
*
#include "cspack/czsock.inc"
      CHARACTER*64 LOCAL,REMOTE
      CHARACTER*4  CHOPT
 
      CALL KUGETS(LOCAL,NCHL)
      CALL KUGETS(REMOTE,NCHR)
      CALL KUGETI(LRECL)
      CALL KUGETC(CHOPT,NCH)
#include "cspack/czfold.inc"
      CALL XZRTOF(LOCAL,REMOTE,LRECL,CHOPT,IRC)
99    END
 
