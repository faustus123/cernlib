*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:34  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE KERNGT (LUN)
C
C CERN PROGLIB# Z001    KERNGT          .VERSION KERNIBX  1.04  910718
C ORIG. 16/03/89  JZ
C
C--   Store Pam title into /SLATE/ for printing by GSHOWF
C
      COMMON /SLATE/ MCH(40)


      CALL UCTOH1   (
     + CPP_TITLE_CH
     + // '        '
     +,     MCH, 40)
      CALL GSHOWF (LUN)
      RETURN
      END
#ifdef CERNLIB_TCGEN_KERNGT
#undef CERNLIB_TCGEN_KERNGT
#endif
#include "TITLE.kernibx"
