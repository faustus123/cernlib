*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:30  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.45  by  Rene Brun
*-- Author :
#if !defined(CERNLIB_DOUBLE)
      FUNCTION HBASFT (IBF,X)
#endif
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION FUNCTION HBASFT (IBF,X)
#endif
*.==========>
*.      returns basic function (order number ibf)
*.      this is a default function
*..=========> ( R.Brun )
      DIMENSION X(1)
      HBASFT=0.
      END
