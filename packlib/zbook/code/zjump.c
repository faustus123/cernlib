/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/08 12:01:11  mclareni
 * Initial revision
 *
 */
#include "zbook/pilot_c.h"
#if defined(CERNLIB_QMLXIA64)
static void (*target)();
#endif
#if defined(CERNLIB_UNIX)
#if defined(CERNLIB_QX_SC)
zjump_(name,p1,p2,p3,p4)
#endif
#if defined(CERNLIB_QXNO_SC)
zjump(name,p1,p2,p3,p4)
#endif
#if defined(CERNLIB_QXCAPT)
ZJUMP(name,p1,p2,p3,p4)
#endif
char *p1, *p2, *p3, *p4;
/*  LP64 compatibility:
    name is taken from a Fortran array and therefore its address is 32 bit
    which has to be converted to a 64 bit address to satisfy void (*) (H. Vogt) */

#if defined(CERNLIB_QMLXIA64)
int *name;
{
  long jadr;
  jadr   = *name;  /* convert int to long */
  target = (void (*)())jadr;
  (*target)(p1, p2, p3, p4);
}
#else
void (**name)();
{
   (**name)(p1, p2, p3, p4);
}
#endif
#endif
