*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:17  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE GSHOW (LUN)
 
C CERN PROGLIB#         GSHOW           .VERSION KERNCDC  1.07  781218
 
C--   STORE PAM TITLE INTO /SLATE/ FOR PRINTING BY GSHOWF
 
      COMMON /SLATE/ CH(40)
 
      CALL UBLOW                                                       (
     + 40H CPP_TITLE                 
     +,  CH, 40)
 
      CALL GSHOWF (LUN)
      RETURN
      END
#ifdef CERNLIB_TCGEN_GSHOW
#undef CERNLIB_TCGEN_GSHOW
#endif
#include "TITLE.kerncdc"
