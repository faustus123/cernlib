/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:47:40  mclareni
 * Initial revision
 *
 */
#include "sys/CERNLIB_machine.h"
#include "_kernbit/pilot.h"
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QSAA))
#pragma csect   (CODE,"INITCC")
#pragma linkage (initc,FORTRAN)
void initc(ii)
int ii;
{
}
#endif
