*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:25  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.16/02 09/07/93  15.35.14  by  Vladimir Berezhnoi
*-- Author : V.Berezhnoi
      SUBROUTINE CSPMD7(M,MD,P1,P2,P3,P4,P5,P6,P7)
      INTEGER M(10),MD(11)
      M(1)=LOCF(P1)
      M(2)=LOCF(P2)
      M(3)=LOCF(P3)
      M(4)=LOCF(P4)
      M(5)=LOCF(P5)
      M(6)=LOCF(P6)
      M(7)=LOCF(P7)
#if defined(CERNLIB_IBM)
      IF(MD(2).EQ. -7)M(1)=JUMPAD(P1)
      IF(MD(3).EQ. -7)M(2)=JUMPAD(P2)
      IF(MD(4).EQ. -7)M(3)=JUMPAD(P3)
      IF(MD(5).EQ. -7)M(4)=JUMPAD(P4)
      IF(MD(6).EQ. -7)M(5)=JUMPAD(P5)
      IF(MD(7).EQ. -7)M(6)=JUMPAD(P6)
      IF(MD(8).EQ. -7)M(7)=JUMPAD(P7)
#endif
#if !defined(CERNLIB_IBM)
      IF(MD(2).EQ. -7)M(1)=LOCB(P1)
      IF(MD(3).EQ. -7)M(2)=LOCB(P2)
      IF(MD(4).EQ. -7)M(3)=LOCB(P3)
      IF(MD(5).EQ. -7)M(4)=LOCB(P4)
      IF(MD(6).EQ. -7)M(5)=LOCB(P5)
      IF(MD(7).EQ. -7)M(6)=LOCB(P6)
      IF(MD(8).EQ. -7)M(7)=LOCB(P7)
#endif
      END
