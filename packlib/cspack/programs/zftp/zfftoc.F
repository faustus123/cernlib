*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:19  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE ZFFTOC
*
*     Action routine for FTOC command
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
      CALL XZFTOC(LOCAL,REMOTE,LRECL,CHOPT,IRC)
99    END
 
