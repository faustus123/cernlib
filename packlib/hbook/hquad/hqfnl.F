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
      REAL FUNCTION HQFNL (V)
      REAL V (*)
* Determines negative 1 standard deviation limit of
*   sum of multiquadrics.
 
      REAL HQF, HQFER
 
      HQFNL = HQF (V) - HQFER (V)
 
      END
