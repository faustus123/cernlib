*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:36  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      SUBROUTINE GETWI(LUN,ARRAY,MAXN,RESULT,IERR,N,LERR)
      CALL READWI(LUN,ARRAY,MAXN,IERR,N,LERR)
      IF (IERR.NE.0) RETURN
      CALL CONCDC(ARRAY,N,RESULT,IERR,LERR)
      RETURN
      END
