*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:18  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE GETD
*
*         Action routine for GETD command
*
      CHARACTER*80 REMOTE,LOCAL
      CHARACTER*8  CHOPT
#include "cspack/czsock.inc"
*
#include "cspack/czopen.inc"
      CALL KUGETS(REMOTE,NCHR)
      CALL KUGETS(LOCAL,NCHL)
      IF(NCHL.LE.0)LOCAL=REMOTE
      IF(LOCAL(1:NCHL).EQ.'=') LOCAL=REMOTE
      NCHL = LENOCC(LOCAL)
      CALL KUGETI(LRECL)
      CALL KUGETC(CHOPT,NCH)
#include "cspack/czfold.inc"
      CALL XZGETD(LOCAL,REMOTE,LRECL,CHOPT,IRC)
99    END
 
