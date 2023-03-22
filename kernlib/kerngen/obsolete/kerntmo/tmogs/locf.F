*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:49  mclareni
* Initial revision
*
*
#include "kerntmo/pilot.h"
       FUNCTION LOCF (VAR)
C
C CERN PROGLIB# N100    LOCF            .VERSION KERNTMO  1.00  890208
C ORIG. 02/02/89  J.CARTER
C
C     THE FUNCTION  LOCF(VAR)  RETURNS
C     THE MACHINE WORD-ADDRESS OF 'VAR', SUCH THAT
C     FOR EXAMPLE  LOCF(A(11)) - LOCF(A(1)) GIVES =10
C
      LOCF = ISHFT ( IADDRESS( VAR ) , -2 )
      RETURN
      END
#ifdef CERNLIB_TCGEN_LOCF
#undef CERNLIB_TCGEN_LOCF
#endif
