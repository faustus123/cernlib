*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 14:31:30  mclareni
* Initial revision
*
*
#include "minuit/pilot.h"
      SUBROUTINE MNSETI(TIT)
#include "minuit/d506dp.inc"
CC       Called by user to set or change title of current task.
CC
#include "minuit/d506cm.inc"
      CHARACTER*(*) TIT
      CTITL = TIT
      RETURN
      END
