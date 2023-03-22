*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:49  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      FUNCTION RCHAR(CHN)
*
* CERN PROGLIB# M443    CHARN            .VERSION KERNBIT  1.07  910711
* Author: Miguel Marquina 85/11/xx
*
* Build REAL RCHAR from CHARACTER string CHN
*
* Mods       Date   Comments
*
      CHARACTER*(*) CHN
      EQUIVALENCE(R,NR)
      NR=ICHARN(CHN)
      RCHAR=R
      RETURN
      END
