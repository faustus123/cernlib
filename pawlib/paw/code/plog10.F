*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/01 11:38:45  mclareni
* Initial revision
*
*
#include "paw/pilot.h"
*CMZ :  2.00/06 30/01/93  18.57.41  by  Rene Brun
*-- Author :    Rene Brun   30/01/93
      FUNCTION PLOG10(X)
      IF(X.GT.0.)THEN
         PLOG10=LOG10(X)
      ELSE
         PLOG10=-30.
      ENDIF
      END
