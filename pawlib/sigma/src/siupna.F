*
* $Id$
*
* $Log$
* Revision 1.1  1995/12/12 14:36:20  mclareni
* Initial revision
*
*
#include "sigma/pilot.h"
*CMZ :  1.09/04 26/10/93  09.49.20  by  Carlo E. Vandoni
*-- Author :
      SUBROUTINE SIUPNA
#include "sigma/sicsig.inc"
#include "sigma/sigc.inc"
C
      CALL SITRAC(' SIUPNA   ')
      IT2NAM=IT2NAM+1
      WRITE(CNAME,10) IT2NAM
  10  FORMAT('$',I6)
      END
