*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:14  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE RGSET(A,B,N,X,W)
      EXTERNAL RGQUAD
      DIMENSION X(*),W(*)

      CALL D107R1(2,RGQUAD,A,B,N,X,W)
      RETURN
      END
