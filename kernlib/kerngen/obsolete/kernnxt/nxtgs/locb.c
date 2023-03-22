/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:53:29  mclareni
 * Initial revision
 *
 */
#include "kernnxt/pilot.h"
/*>    ROUTINE LOCB
  CERN PROGLIB# N101    LOCB            .VERSION KERNNXT  1.00  901105
  */
#if defined(CERNLIB_QX_SC)
long locb_(iadr)
#endif
#if defined(CERNLIB_QXNO_SC)
long locb(iadr)
#endif
#if defined(CERNLIB_QXCAPT)
long LOCB(iadr)
#endif
char *iadr;
{
   return( (long) iadr );
}
/*> END <----------------------------------------------------------*/
#ifdef CERNLIB_TCGEN_LOCB
#undef CERNLIB_TCGEN_LOCB
#endif
