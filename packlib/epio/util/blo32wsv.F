*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:46  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
#if (defined(CERNLIB_STF77VX))&&(!defined(CERNLIB_STF77))
      SUBROUTINE BLO32W(SOURCE,N1,TARGET,N2,N3)
      INTEGER SOURCE(*),TARGET(*)
C
C  STANDARD FORTRAN Vax version to do BLO32W with NO external calls.
C
C  Input SOURCE array is a CONTIGUOUS bit string N3*32 bits long
C  starting at 16-BIT POSITION N1 in the array SOURCE.
C  This bit string is BLOWN (unpacked) into N3 computer words
C  starting at TARGET(N2). Each word of TARGET then contains
C  32 bits, left justified.
C
C  16-bit word number within Computer word increases
C  as one goes from Least Significant Bit (LSB) to MSB.
C  i.e.
C     63       48 47       32 31      16 15       0
C    -----------------------------------------------
C    |     4     |     3     |     2    |     1    |
C    -----------------------------------------------
C
#include "epio/wordsize.inc"
      IF(N3 .LE. 0) GO TO 999
C
C                    SOURCE word and 16-bit within word
      IWSRC  = (N1-1)/N16PW
      I16SRC = N1-IWSRC*N16PW
      IWSRC  = IWSRC+1
      NBITR  = (I16SRC-1)*16
C
      DO 10 IWTGT = N2,N2+N3-1
C
C                    Extract 16-bit word from source
      TARGET(IWTGT) = ISHFT(SOURCE(IWSRC),-NBITR)
      TARGET(IWTGT) = IAND(TARGET(IWTGT),65535)
C
      IF(NBITR.EQ.NBITPW-16) THEN
         NBITR = 0
         IWSRC = IWSRC+1
      ELSE
         NBITR = NBITR+16
      ENDIF
C
C                    Extract 16-bit word from source
      JWD16 = ISHFT(SOURCE(IWSRC),-NBITR)
      TARGET(IWTGT) = IOR(ISHFT(IAND(JWD16,65535),16),TARGET(IWTGT))
C
      IF(NBITR.EQ.NBITPW-16) THEN
         NBITR = 0
         IWSRC = IWSRC+1
      ELSE
         NBITR = NBITR+16
      ENDIF
C
 10   CONTINUE
C
 999  END
#endif
