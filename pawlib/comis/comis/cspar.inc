*
* $Id$
*
* $Log$
* Revision 1.2  2000/05/30 13:53:58  couet
* - A buffer size increased
*
* Revision 1.1.1.1  1996/02/26 17:16:33  mclareni
* Comis
*
*
#ifndef CERNLIB_COMIS_CSPAR_INC
#define CERNLIB_COMIS_CSPAR_INC
*
*
* cspar.inc
*
#include "comis/mdsize.h"

        PARAMETER (LHP=MDSIZE, KON1=17694720, KON2=KON1
     +, KON3=2**16, LRECU=8,NRECU=5,MLRECU=NRECU*LRECU
     +, MXRECU=MLRECU-LRECU
     1,      LASTK=2000,LSSTK=50,KLENID=32
     2,      LCSTK=4800)

#endif
