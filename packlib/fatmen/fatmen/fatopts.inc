*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:55  mclareni
* Initial revision
*
*
#ifndef CERNLIB_FATMEN_FATOPTS_INC
#define CERNLIB_FATMEN_FATOPTS_INC
*
*
* fatopts.inc
*
      CHARACTER*(*)  CHOPT
#include "fatmen/fatoptd.inc"
      CALL FMOPTC(CHOPT,ALFNUM,IOPT)
*     CALL UOPTC(CHOPT,ALFNUM,IOPT)

#endif
