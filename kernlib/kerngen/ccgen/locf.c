/*
 * $Id: locf.c,v 1.4 2004/07/29 14:06:07 mclareni Exp $
 *
 * $Log: locf.c,v $
 * Revision 1.4  2004/07/29 14:06:07  mclareni
 * Alice version for 64-bit pointer systems using the CERNLIB_QMLXIA64 cpp flag
 *
 * Revision 1.2  2002/12/02 16:37:45  brun
 * Changes from Federico Carminati and Peter Hristov who ported the system
 * on the Ithanium processors.It is tested on HP, Sun, and Alpha, everything
 * seems to work. The optimisation is switched off in case of gcc2.xx.yyy
 *
 * Revision 1.1.1.1  2002/07/24 15:56:28  rdm
 * initial import into CVS
 *
 * Revision 1.1.1.1  2002/06/16 15:18:46  hristov
 * Separate distribution  of Geant3
 *
 * Revision 1.1.1.1  1999/05/18 15:55:28  fca
 * AliRoot sources
 *
 * Revision 1.3  1997/09/02 14:26:38  mclareni
 * WINNT correction
 *
 * Revision 1.2  1997/02/04 17:34:35  mclareni
 * Merge Winnt and 97a versions
 *
 * Revision 1.1.1.1.2.1  1997/01/21 11:29:36  mclareni
 * All mods for Winnt 96a on winnt branch
 *
 * Revision 1.1.1.1  1996/02/15 17:49:24  mclareni
 * Kernlib
 *
 */
#include "kerngen/pilot.h"
#include "kerngen/fortranc.h"
#if defined(CERNLIB_QMLXIA64)
#include "stdio.h"
#endif

#if defined(CERNLIB_MSSTDCALL) && defined(CERNLIB_LOCF_CHARACTER)
# define Dummy2LocPar  ,_dummy
# define DummyDef     int _dummy;
#else
# define Dummy2LocPar
# define DummyDef
#endif

#if defined(CERNLIB_QMIRTD)
#include "irtdgs/locf.c"
#elif defined(CERNLIB_QMVAOS)
#include "vaogs/locf.c"
#elif defined(CERNLIB_QMLXIA64)
#include "lp64gs/locf.c"
#else
/*>    ROUTINE LOCF
  CERN PROGLIB# N100    LOCF            .VERSION KERNFOR  4.36  930602
*/
#define NADUPW 4   /* Number of ADdress Units Per Word */
#define LADUPW 2   /* Logarithm base 2 of ADdress Units Per Word */
#if defined(CERNLIB_QX_SC)
unsigned int type_of_call locf_(iadr Dummy2LocPar)
#elif defined(CERNLIB_QXNO_SC)
unsigned int type_of_call locf(iadr Dummy2LocPar)
#elif defined(CERNLIB_QXCAPT)
unsigned int type_of_call LOCF(iadr Dummy2LocPar)
#endif
   char *iadr;
#ifdef DummDef
   DummyDef
#endif
{
  return( ((unsigned) iadr) >> LADUPW );
}
#undef Dummy2LocPar
#undef DummyDef
#undef CERNLIB_LOCF_CHARACTER
/*> END <----------------------------------------------------------*/
#endif
