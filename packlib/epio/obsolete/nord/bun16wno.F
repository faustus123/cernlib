*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:58  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
#if defined(CERNLIB_ND100B32)
      SUBROUTINE BUN16W(SOURCE,N1,TARGET,N2,N3)
C.+++++++ NORD 100 32-BIT VERSION ++++++++++
C. BUNCHES (PACKS) 16 BIT WORDS (RIGHT ADJ., ZERO FILLED)
C. INTO A CONTIGUOUS BIT STRING.
C.
C. INPUT
C. SOURCE    ARRAY CONTAINING 16 BIT WORDS IN UNPACKED FORM
C. N1        FIRST 16 BIT WORD IN SOURCE TO BE PACKED
C. TARGET    TARGET ARRAY FOR PACKED 16 BIT WORDS
C. N2        FIRST 16 BIT WORD IN TARGET TO PACK TO
C. N3        NO. OF 16 BIT WORDS TO PACK
      INTEGER*4 N1,N2,N3,SOURCE(2),ZERO
      INTEGER*2 TARGET(2)
      DATA ZERO/0/
      IF(N3.LE.ZERO)  GOTO 77777
      I1=N1-1
      I2=N2-1
      I3=N3
      DO 1  I=1,I3
    1 TARGET(I2+I)=SOURCE(I1+I)
77777 RETURN
      END
#endif
