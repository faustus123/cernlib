*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:35  mclareni
* Initial revision
*
*
      SUBROUTINE XINB  (LUN,XBV,NXB)
C
C CERN PROGLIB# Z203    XINB            .VERSION KERNIRT  1.01  900319
C
      COMMON /SLATE/ NXR, DUMMY(39)
      DIMENSION    XBV(NXB)
C
      READ (LUN,IOSTAT=JSTAT,NUM=NBYTES) NR,XBV
      IF   (JSTAT)                 61, 24, 64
   24 NXR = NR
      NR  = MIN (NR,NXB)
      NXB = MAX (NR,1)
      RETURN
C
   61 NXB = 0
      RETURN
C
   64 NXB = -JSTAT
      READ (LUN) NR
      RETURN
      END
