/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:53:29  mclareni
 * Initial revision
 *
 */
#include "kernnxt/pilot.h"
/*>    ROUTINE ABEND
  CERN PROGLIB# Z035    ABEND           .VERSION KERNNXT  1.00  901105
  */
#if defined(CERNLIB_QX_SC)
void abend_()
#endif
#if defined(CERNLIB_QXNO_SC)
void abend()
#endif
#if defined(CERNLIB_QXCAPT)
void ABEND()
#endif
{
    abort();
    return;
}
/*> END <----------------------------------------------------------*/
#ifdef CERNLIB_TCGEN_ABEND
#undef CERNLIB_TCGEN_ABEND
#endif
