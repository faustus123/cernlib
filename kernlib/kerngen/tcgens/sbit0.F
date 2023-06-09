*
* $Id$
*
* $Log$
* Revision 1.2  2006/09/15 09:35:22  mclareni
* Submitted mods for gcc4/gfortran and MacOSX, corrected to work also on slc4 with gcc3.4 and 4.1
*
* Revision 1.1.1.1  1996/02/15 17:50:19  mclareni
* Kernlib
*
*
#include "kerngen/pilot.h"
#if defined(CERNLIB_QMSUN)
#include "sungs/sbit0.F"
#else
      SUBROUTINE SBIT0 (IZW,IZP)
C
C CERN PROGLIB# M421    SBIT0           .VERSION KERNFOR  4.23  891215
C MOD. true default 24/2/89, JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine

#if (!defined(CERNLIB_QISASTD)) && (!defined(CERNLIB_GFORTRAN))
#include "kerngen/q_andor.inc"
#include "kerngen/q_shift.inc"
* Ignoring t=pass
#endif

#if (!defined(CERNLIB_QISASTD)) && (!defined(CERNLIB_GFORTRAN))
      IZW = IAND (IZW, NOT(ISHFTL(1,IZP-1)) )
#endif
#if ((defined(CERNLIB_QISASTD))&&(!defined(CERNLIB_QMILSTD))) || defined(CERNLIB_GFORTRAN)
      IZW = IAND (IZW, NOT(ISHFT (1,IZP-1)) )
#endif
#if defined(CERNLIB_QMILSTD)
      IZW = IBCLR (IZW, IZP-1)
#endif
      RETURN
      END
#endif
