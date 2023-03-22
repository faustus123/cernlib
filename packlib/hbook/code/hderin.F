*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:34  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.47  by  Rene Brun
*-- Author :
      SUBROUTINE HDERIN (X,PAR,DER)
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION PAR,DER
#endif
      DIMENSION X(1),PAR(1),DER(1)
      END
