/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:52:44  mclareni
 * Initial revision
 *
 */
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
extern int _argc;
IARGC()
{
      int i = _argc-1;
      return(i);
}
#ifdef CERNLIB_CRYUNI_IARGC
#undef CERNLIB_CRYUNI_IARGC
#endif
