*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:51  mclareni
* Initial revision
*
*
*    DECK OF SUBROUTINE TO PRINT PAM TITLE.
#include "kapack/pilot.h"
      SUBROUTINE KAT(LUN)
*
*.....PRINT THE PAM TITLE ON UNIT LUN
*
      CHARACTER TITLE*80
*
*-----------------------------------------------------------------------
*
      WRITE(TITLE,100)
      CALL KAXED(LUN,TITLE)
*
 100  FORMAT('CRNKA001 KAT: ',
     + 40H KAPACK   2.17      950217          CERN
     +)
*
      END
