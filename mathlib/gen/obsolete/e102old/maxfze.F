*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:05  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
#if defined(CERNLIB_FORTRAN)||!defined(CERNLIB_CDC)
      FUNCTION MAXFZE(FA, N)
          DIMENSION FA(1)
          MAXFZE    =  1
          F         =  FA(1)
          IF(N .LE. 1)  RETURN
          DO  10    K  =  2, N
                    IF(FA(K) .LE. F)    GO TO 10
                    MAXFZE    =  K
                    F         =  FA(K)
   10               CONTINUE
          RETURN
      END
#endif
