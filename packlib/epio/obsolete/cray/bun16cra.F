*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:53  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
#if defined(CERNLIB_CRAY)
CDECK,BUN16CRA,IF=CRAY,CONVEX.
      SUBROUTINE BUN16W(SOURCE,N1,TARGET,N2,N3)
      INTEGER SOURCE(*),TARGET(*)
C
C  CRAY version to do BUN16W with NO external calls.
C
C                         N.McCubbin   18-Feb-87
C  Revised                F.Carminati  23-Jan-89
C                         F.Carminati  06-Jun-89
C
C  Input SOURCE array is N3 computer words starting in
C  SOURCE(N1). The rightmost 16 bits of these N3 words
C  are BUNCHED (packed) into a CONTIGUOUS bit string
C  starting at 16-BIT POSITION N2 in the array TARGET.
C
C  16-bit word number within Computer word increases
C  as one goes from Most Significant Bit (MSB) to LSB.
C  i.e.
C     63       48 47       32 31      16 15       0
C    -----------------------------------------------
C    |     1     |     2     |     3    |     4    |
C    -----------------------------------------------
C
      IF(N3 .LE. 0) GO TO 999
C
C                 And same for TARGET:
      IWTGT  = (N2-1)/4
      I16TGT = N2-IWTGT*4
      IWTGT  = IWTGT+1
      NBITL  = (4-I16TGT)*16
C
      DO 10 IWSRC=N1,N1+N3-1
C
C                 Extract 16-bit word from source
      JWD16 = IAND(SOURCE(IWSRC),65535)
C
C                 Shift to correct position for insertion into TARGET
      JWD16 = ISHFT(JWD16,NBITL)
C
C                 Clear TARGET position
      TARGET(IWTGT) = IAND(TARGET(IWTGT),NOT(ISHFT(65535,NBITL)))
C
C                 Insert:
      TARGET(IWTGT) = IOR(TARGET(IWTGT),JWD16)
C
      IF(NBITL.EQ.0) THEN
         NBITL = 48
         IWTGT = IWTGT + 1
      ELSE
         NBITL = NBITL - 16
      ENDIF
C
 10   CONTINUE
C
 999  END
#endif
