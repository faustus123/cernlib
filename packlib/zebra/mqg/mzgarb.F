*
* $Id$
*
* $Log$
* Revision 1.3  1999/06/18 13:30:27  couet
* - qcardl.inc was empty: It is now removed and not used.
*   Comment END CDE removed.
*
* Revision 1.2  1996/04/18 16:12:32  mclareni
* Incorporate changes from J.Zoll for version 3.77
*
* Revision 1.1.1.1  1996/03/06 10:47:20  mclareni
* Zebra
*
*
#include "zebra/pilot.h"
      SUBROUTINE MZGARB (IXGP,IXWP)

C-    Garbage collection + wiping, user called

#include "zebra/zstate.inc"
#include "zebra/zunit.inc"
#include "zebra/zvfaut.inc"
#include "zebra/mqsys.inc"
#include "zebra/mzct.inc"
*
      DIMENSION    IXGP(1), IXWP(9)
#if (defined(CERNLIB_QTRHOLL))&&(!defined(CERNLIB_A6M))
      DIMENSION    NAMESR(2)
      DATA  NAMESR / 4HMZGA, 4HRB   /
#endif
#if (defined(CERNLIB_QTRHOLL))&&(defined(CERNLIB_A6M))
      DATA  NAMESR / 6HMZGARB /
#endif
#if !defined(CERNLIB_QTRHOLL)
      CHARACTER    NAMESR*8
      PARAMETER   (NAMESR = 'MZGARB  ')
#endif


      IXGARB = IXGP(1)
      IXWIPE = IXWP(1)
#include "zebra/qtrace.inc"
#if defined(CERNLIB_QDEBUG)
      IF (IQVSTA.NE.0)       CALL ZVAUTX
      JVLEV = 2
#endif

C--                Construct Memory Occupation table

      MQDVGA = 0
      MQDVWI = 0
      IF (IXGARB.EQ.0)             GO TO 16
#if defined(CERNLIB_QDEBUG)
      JVLEV = 1
#endif

      MQDVGA = MZDVAC (IXGARB)
      IF (IXWIPE.EQ.0)             GO TO 19
      JSTO   = JQSTOR
      MQDVWI = MZDVAC (IXWIPE)
      IF (JSTO.NE.JQSTOR)          GO TO 91
      GO TO 19

   16 MQDVWI = MZDVAC (IXWIPE)
   19 IF (MQDVGA+MQDVWI.EQ.0)      GO TO 999

      NQRESV = 0
      JQSTMV = -1
#if defined(CERNLIB_QDEBPRI)
      IF (NQLOGL.LT.1)             GO TO 24
      IF (MQDVGA.NE.0)             GO TO 22
      IF (NQLOGL.LT.2)             GO TO 24
   22 WRITE (IQLOG,9022) JQSTOR,MQDVGA,MQDVWI
 9022 FORMAT (' MZGARB-  User Garb.C./Wipe for store',I3,', Divs',
#endif
#if !defined(CERNLIB_HEX)
     F2(2X,O8))
#endif
#if defined(CERNLIB_HEX)
     F2(2X,Z6))
#endif
#if defined(CERNLIB_QDEBUG)
      IQVREM(1,JVLEV) = IQVID(1)
      IQVREM(2,JVLEV) = IQVID(2)
#endif
   24 CALL MZTABM

C--                Construct Link Relocation table

      CALL MZTABR

C--                Relocate + memory move

      CALL MZTABX
      CALL MZTABF
      IF (NQNOOP.NE.0)             GO TO 999
      CALL MZGSTA (NQDGAU(KQT+1))
      CALL MZRELX
      CALL MZMOVE
      IF (IQPART.NE.0)             GO TO 24
#include "zebra/qtrace99.inc"
      RETURN

C------            Error conditions

   91 NQCASE = 1
      NQFATA = 2
      IQUEST(11) = JSTO
      IQUEST(12) = JQSTOR
#include "zebra/qtofatal.inc"
      END
