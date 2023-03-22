*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:08:00  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.17/01 02/09/92  19.10.43  by  John Allison
*-- Author :
      REAL FUNCTION HQFPL (V)
      REAL V (*)
* Determines positive 1 standard deviation limit of
*   sum of 1-D multiquadrics.
 
      REAL HQF, HQFER
 
      HQFPL = HQF (V) + HQFER (V)
 
      END
