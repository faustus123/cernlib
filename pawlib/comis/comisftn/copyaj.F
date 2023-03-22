*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:49  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.37.02  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE COPYAJ(J1,J2,N)
#include "comis/cspar.inc"
#include "comis/comis.inc"
#include "comis/cspnts.inc"
      CALL UCOPY2(IA(J1-JTOPA),IA(J2-JTOPA),N)
      END
