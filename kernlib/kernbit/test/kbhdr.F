*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:54  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      SUBROUTINE KBHDR(STRING)
      CHARACTER*(*) STRING
      PRINT 1000,STRING
1000  FORMAT(' **** Testing ',A)
      RETURN
      END
