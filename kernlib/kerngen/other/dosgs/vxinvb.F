*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:59  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      SUBROUTINE VXINVB (MVI,NW)

C CERN PROGLIB# M434    VXINVB          .VERSION KERNDOS  1.00  920624
C ORIG.  25-June-92, JZ

C-    VX invert bytes, in-place

      DIMENSION    MVI(99)
#if defined(CERNLIB_QF_NDP)||defined(CERNLIB_QF_DEC)
      PARAMETER   (MASK1 = X'00FF00FF')
      PARAMETER   (MASK2 = X'FF00FF00')
#endif
#if defined(CERNLIB_QF_F2C)
      DATA MASK1 /X'FF'/
#endif

#include "kerngen/q_andor.inc"
#include "kerngen/q_shift.inc"

      IF (NW .LE. 0) RETURN
      DO 29  J=1,NW
#if defined(CERNLIB_QF_NDP)||defined(CERNLIB_QF_DEC)
C.                                 1 2 3 4
      MWW = ISHFTC (MVI(J),8,32)
C.                                 2 3 4 1
      MST = IAND (MWW, MASK1)
C.                                 0 3 0 1
      MWW = IAND (ISHFTC(MWW,16,32), MASK2)
C.                                 4 1 2 3
C.                                 4 0 2 0
      MVI(J) = IOR (MST,MWW)
C.                                 4 3 2 1
#endif
#if defined(CERNLIB_QF_F2C)
C 1-st byte
        IIN = MVI(J)
        IOT = LSHIFT(IAND(IIN,MASK1), 24)
C 2-nd byte
        IIN = ISHFT(IIN, -8)
        IWORK = IAND(IIN,MASK1)
        IOT   = IOR(IOT, LSHIFT(IWORK,16))
C 3-d  byte
        IIN = ISHFT(IIN, -8)
        IWORK = IAND(IIN,MASK1)
        IOT   = IOR(IOT, LSHIFT(IWORK,8))
C last byte
        IIN = ISHFT(IIN, -8)
        IOT   = IOR(IOT, IIN)

        MVI(J) = IOT
#endif
   29 CONTINUE
      END
