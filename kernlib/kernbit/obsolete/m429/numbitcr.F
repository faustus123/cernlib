*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:41  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
#if defined(CERNLIB_CRAY)
      FUNCTION NUMBIT(I)
C--      FUNCTION TO COUNT THE NUMBER OF 1-BITS IN A WORD
C--     USE THE FTN LIBRARY POPCNT FUNCTION
      NUMBIT= POPCNT(I)
      RETURN
      END
#endif
