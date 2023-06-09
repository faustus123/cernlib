*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:12  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
#if defined(CERNLIB_SINGLE)||defined(CERNLIB_DOUBLE)||defined(CERNLIB_UNIVAC)||defined(CERNLIB_BESM6)
      SUBROUTINE ZTRAP(IZ,IUSER)
C
C     ******************************************************************
C     *                                                                *
C     *       STORE ADDRESS OF RECOVERY ROUTINE                        *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1)
#if defined(CERNLIB_CDC)||defined(CERNLIB_UNIVAC)||defined(CERNLIB_UNIX)
      EXTERNAL IUSER
#endif
C
C     ------------------------------------------------------------------
C
      JZ     = IZ(1)
#if (defined(CERNLIB_APOLLO))&&(!defined(CERNLIB_UNIX))
      IZ(JZ+19) = IADDR(IUSER)
#endif
#if defined(CERNLIB_CDC)
      IZ(JZ+19) = LOCF(IUSER)
#endif
#if defined(CERNLIB_IBM)
      IZ(JZ+19) = IUSER
#endif
#if defined(CERNLIB_NORD)
      IZ(JZ+19) = IUSER
#endif
#if defined(CERNLIB_CRAY)
      IZ(JZ+19) = LOC(IUSER)
#endif
#if defined(CERNLIB_UNIVAC)
      IZ(JZ+19) = LOCF(IUSER)
#endif
#if defined(CERNLIB_VAX)
      IZ(JZ+19) = %LOC(IUSER)
#endif
#if defined(CERNLIB_BESM6)
      IZ(JZ+19) = LOCF(IUSER)
#endif
#if defined(CERNLIB_UNIX) && (!defined(CERNLIB_QMLXIA64))
      IZ(JZ+19) = LOCB(IUSER)
#else
      IZ(JZ+19) = JUMPAD(IUSER)
#endif
      END
#endif
