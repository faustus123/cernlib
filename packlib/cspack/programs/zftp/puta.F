*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:18  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE PUTA
*
*     Action routine for PUTA command
*
#include "cspack/czsock.inc"
      CHARACTER*80 REMOTE,LOCAL
      CHARACTER*8  CHOPT
*
#include "cspack/czopen.inc"
      CALL KUGETS(LOCAL,NCHL)
      CALL KUGETS(REMOTE,NCHR)
      IF(NCHR.LE.0)REMOTE=LOCAL
      IF(REMOTE(1:NCHR).EQ.'=') REMOTE=LOCAL
      NCHR = LENOCC(REMOTE)
      CALL KUGETC(CHOPT,NCH)
#include "cspack/czfold.inc"
      CALL XZPUTA(LOCAL,REMOTE,CHOPT,IRC)
99    END
 
