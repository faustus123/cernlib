*
* $Id$
*
* $Log$
* Revision 1.2  2006/09/15 09:35:20  mclareni
* Submitted mods for gcc4/gfortran and MacOSX, corrected to work also on slc4 with gcc3.4 and 4.1
*
* Revision 1.1.1.1  1996/02/15 17:49:50  mclareni
* Kernlib
*
*
#include "kerngen/pilot.h"
#if defined(CERNLIB_QMLNX) && (!defined(CERNLIB_GFORTRAN))
#include "lnxgs/utrans.F"
#else
      SUBROUTINE UTRANS (AI,AJ,NCH,IP,JP)
C
C CERN PROGLIB# M409    UTRANS          .VERSION KERNFOR  4.18  880425
C ORIG. 15/09/78 JZ
C
      COMMON /SLATE/ NI, NJ, MM(38)
C
      DIMENSION    AI(9), AJ(9), NCH(9), IP(9), JP(9)
C
#include "kerngen/wordsize.inc"
C
      NI   = 0
      NJ   = 0
      NCHL = NCH(1)
      IF (NCHL.LE.0)         RETURN
      NCHI = MIN (IP(1), NCHAPW)
      NCHJ = MIN (JP(1), NCHAPW)
      IF (NCHI-NCHJ)         31,41,21
C
C----              DISPERSION TO A1
C
   21 IF (NCHJ.NE.1)         GO TO 41
C
   24 N  = MIN (NCHL, NCHI)
      NI = NI + 1
      CALL UBLOW (AI(NI),AJ(NJ+1),N)
      NJ   = NJ   + N
      NCHL = NCHL - N
      IF (NCHL.NE.0)         GO TO 24
      RETURN
C
C----              CONCENTRATION FROM A1
C
   31 IF (NCHI.NE.1)         GO TO 41
C
   34 N  = MIN (NCHL, NCHJ)
      NJ = NJ + 1
      CALL UBUNCH (AI(NI+1),AJ(NJ),N)
      NI   = NI   + N
      NCHL = NCHL - N
      IF (NCHL.NE.0)         GO TO 34
      RETURN
C
C----              TRANSFORMATION AI TO AJ
C
   41 JA = 0
      JE = 0
   42 N  = MIN (NCHL, NCHJ)
      IF (JA+N.LE.JE)        GO TO 47
      IF (JA.NE.JE)          GO TO 43
      JA = 1
      JE = 1
      GO TO 44
C
   43 IF (JE+NCHI.LT.40)     GO TO 44
      NT = JE - JA
      CALL UCOPY (MM(JA),MM(1),NT)
      JA = 1
      JE = NT + 1
C
   44 NI = NI + 1
      CALL UBLOW (AI(NI),MM(JE),NCHI)
      JE = JE + NCHI
      IF (JA+N.GT.JE)        GO TO 43
C
   47 NJ = NJ + 1
      CALL UBUNCH (MM(JA),AJ(NJ),N)
      JA   = JA   + N
      NCHL = NCHL - N
      IF (NCHL.NE.0)         GO TO 42
      RETURN
      END
#endif
