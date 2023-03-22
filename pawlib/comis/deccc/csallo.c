/*
 * $Id$
 *
 * $Log$
 * Revision 1.9  1999/11/15 13:36:24  couet
 * - cfortran was not taken from the right place
 *
 * Revision 1.8  1997/10/21 17:01:54  mclareni
 * Get csallo.c compiled on VMS
 *
 * Revision 1.7  1997/07/23 08:03:56  couet
 * - final (?) changes to make the dynamic memory allocation working on all
 *   platforms (LINUX, UNIX and 64 bits machines like alpha).
 *
 * Revision 1.6  1997/07/18 15:17:57  berejnoi
 * using cfortran.h
 *
 * Revision 1.5  1997/07/14 07:57:50  berejnoi
 * bug fixed in csfree
 *
 * Revision 1.4  1997/06/03 08:49:00  berejnoi
 * new routine csfree
 *
 * Revision 1.3  1997/03/14 12:02:23  mclareni
 * WNT mods
 *
 * Revision 1.2.2.1  1997/01/21 11:34:42  mclareni
 * All mods for Winnt 96a on winnt branch
 *
 * Revision 1.2  1996/03/14 13:44:10  berezhno
 * mods for WINNT
 *
 * Revision 1.1.1.1  1996/02/26 17:16:55  mclareni
 * Comis
 *
 */
#include "comis/pilot.h"
/*CMZ :  1.14/02 17/05/93  10.21.29  by  Vladimir Berezhnoi*/
/*-- Author :*/

#include <cfortran/cfortran.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "comis/mdsize.h"

typedef struct {
    int iq[MDSIZE]; /* instead of int iq[6] */
} mdpool_def;

#define MDPOOL COMMON_BLOCK(MDPOOL,mdpool)
COMMON_BLOCK_DEF(mdpool_def,MDPOOL);

unsigned long iqpntr = 0;


#if defined(CERNLIB_QX_SC)
int type_of_call csallo_(lenb)
#endif
#if defined(CERNLIB_QXNO_SC)
int type_of_call csallo(lenb)
#endif
#if defined(CERNLIB_QXCAPT)
int type_of_call CSALLO(lenb)
#endif
 int *lenb;
{
  unsigned long lpntr;
  unsigned int pntr; 

  if (! iqpntr)
    iqpntr = (unsigned long)MDPOOL.iq;
  lpntr= (long)( malloc(*lenb) );
  if (! lpntr) {
    fprintf(stderr,
	    "CSALLO: not enough dynamic memory to allocate %d bytes\n", *lenb);
    exit(EXIT_FAILURE);
  }

  if (lpntr < iqpntr) {
    fprintf(stderr, "CSALLO: heap below bss?!");
    fprintf(stderr, "  Try linking against pawlib statically.\n");
    exit(EXIT_FAILURE);
  }
  else if (lpntr - iqpntr > UINT_MAX) {
    fprintf(stderr,
	"CSALLO: pointer difference too large to be represented by integer.\n"
	"You probably need to link PAW statically on 64-bit systems.\n");
    exit(EXIT_FAILURE);
  }
  pntr=lpntr - iqpntr;
  return pntr;
}

#if defined(CERNLIB_QX_SC)
void type_of_call csfree_(mpntr)
#endif
#if defined(CERNLIB_QXNO_SC)
void type_of_call csfree(mpntr)
#endif
#if defined(CERNLIB_QXCAPT)
void type_of_call CSFREE(mpntr)
#endif
unsigned  mpntr[];
{
  void *pntr;

  pntr = (void*)(mpntr[0]+iqpntr);
  free(pntr);
}
