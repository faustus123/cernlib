*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:45  mclareni
* Initial revision
*
*
#if !defined(CERNLIB_ND100B16)
#include "pilot.h"
      SUBROUTINE RWR123
C--- READS + CHECKS 11, WRITES 12+13
#include "testc.inc"
      DO 1  ITIMES=1,2
      ICALL=0
      DO 10  ILWORD=16,32,16
      CALL EPSETW(12,3,ILWORD,IERR)
      IF(IERR.NE.0)  CALL ERREX(25)
      CALL EPSETW(13,3,ILWORD,IERR)
      IF(IERR.NE.0)  CALL ERREX(26)
      DO 11  ISPAN=1,1
      DO 12  IPAD=1,3
#if (!defined(CERNLIB_STF77))&&(!defined(CERNLIB_STF77VX))
      CALL EPSETW(12,8,10*(ISPAN-1)+IPAD,IERR)
#endif
#if defined(CERNLIB_STF77)||defined(CERNLIB_STF77VX)
      CALL EPSETW(12,8,10*(ISPAN-1)+  1 ,IERR)
#endif
      IF(IERR.NE.0)  CALL ERREX(27)
#if (!defined(CERNLIB_STF77))&&(!defined(CERNLIB_STF77VX))
      CALL EPSETW(13,8,10*(ISPAN-1)+IPAD,IERR)
#endif
#if defined(CERNLIB_STF77)||defined(CERNLIB_STF77VX)
      CALL EPSETW(13,8,10*(ISPAN-1)+  1 ,IERR)
#endif
      IF(IERR.NE.0)  CALL ERREX(28)
      DO 13  MODE=1,3
      N=NWOUT
      IF(MODE.EQ.1.AND.ILWORD.EQ.16)  N=2*NWOUT
      DO 14  JREC=1,NREC
      CALL EPREAD(11,MODE,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(29)
      ICALL=ICALL+1
      IF(ICALL.EQ.1) CALL EPADDH(11,10,IH,IBUF11,IERR)
      IF(ICALL.EQ.1.AND.IERR.NE.17)  CALL ERREX(13)
      IF(MODE.EQ.1)  CALL BLO32W(IPAC,1,IDAT,1,NWOUT)
      IF(MODE.NE.1)  CALL UCOPY(IPAC,IDAT,NWOUT)
      DO 15  JWORD=1,NWOUT
      IF(IDAT(JWORD).NE.ICALL)  CALL ERREX(30)
   15 CONTINUE
      CALL EPOUTL(12,MODE,NH,IH,N,IPAC,IBUF12,IERR)
      IF(IERR.NE.0)  CALL ERREX(31)
      CALL EPOUTS(13,MODE,N,IPAC,IBUF13,IERR)
      IF(IERR.NE.0)  CALL ERREX(32)
   14 CONTINUE
   13 CONTINUE
   12 CONTINUE
   11 CONTINUE
      CALL EPCLOS(12,IBUF12,IERR)
      CALL EPCLOS(13,IBUF13,IERR)
   10 CONTINUE
      CALL EPSTAT
    1 CONTINUE
      CALL EPRWND(11,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(33)
      CALL EPRWND(12,IBUF12,IERR)
      IF(IERR.NE.0)  CALL ERREX(34)
      CALL EPRWND(13,IBUF13,IERR)
      IF(IERR.NE.0)  CALL ERREX(35)
      RETURN
      END
#endif
