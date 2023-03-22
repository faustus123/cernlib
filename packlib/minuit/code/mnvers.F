*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 14:31:31  mclareni
* Initial revision
*
*
#include "minuit/pilot.h"
      SUBROUTINE MNVERS(CV)
#include "minuit/d506dp.inc"
CC         Returns the Minuit version in CV, char*6
CC
#include "minuit/d506cm.inc"
      CHARACTER*(*) CV
      CV = CVRSN
      RETURN
      END
