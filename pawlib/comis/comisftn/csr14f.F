*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:52  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
#if defined(CERNLIB_APOLLO)
*CMZ :  1.12/05 20/03/92  16.04.19  by  Rene Brun
*-- Author : V.Berezhnoi
      FUNCTION CSR14F(RNAME,IAP)
      INTEGER IAP(15)
      INTEGER JARG1,JARG2,JARG3,JARG4,JARG5,JARG6,JARG7,JARG8,
     +        JARG9,JARG10,JARG11,JARG12,JARG13,JARG14
      INTEGER IARG1,IARG2,IARG3,IARG4,IARG5,IARG6,IARG7,IARG8,
     +        IARG9,IARG10,IARG11,IARG12,IARG13,IARG14
      POINTER/JARG1/IARG1
      POINTER/JARG2/IARG2
      POINTER/JARG3/IARG3
      POINTER/JARG4/IARG4
      POINTER/JARG5/IARG5
      POINTER/JARG6/IARG6
      POINTER/JARG7/IARG7
      POINTER/JARG8/IARG8
      POINTER/JARG9/IARG9
      POINTER/JARG10/IARG10
      POINTER/JARG11/IARG11
      POINTER/JARG12/IARG12
      POINTER/JARG13/IARG13
      POINTER/JARG14/IARG14
      JARG1=IAP(1)
      JARG2=IAP(2)
      JARG3=IAP(3)
      JARG4=IAP(4)
      JARG5=IAP(5)
      JARG6=IAP(6)
      JARG7=IAP(7)
      JARG8=IAP(8)
      JARG9=IAP(9)
      JARG10=IAP(10)
      JARG11=IAP(11)
      JARG12=IAP(12)
      JARG13=IAP(13)
      JARG14=IAP(14)
      CSR14F=RNAME(IARG1,IARG2,IARG3,IARG4,IARG5,IARG6,IARG7,IARG8,
     +            IARG9,IARG10,IARG11,IARG12,IARG13,IARG14 )
      END
#endif
