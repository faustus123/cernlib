*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:48  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      FUNCTION ATG(X1,X2)

      PARAMETER (PI = 3.14159 26535 89793D0)

      ATG=ATAN2(X1,X2)+(PI-SIGN(PI,X1))
      RETURN
      END
