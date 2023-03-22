*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:16  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_GLSGI_INC
#define CERNLIB_HIGZ_GLSGI_INC
*
*
* glsgi.inc
*
#if (defined(CERNLIB_KERNEL))&&(!defined(CERNLIB_MSDOS))
#if (defined(CERNLIB_GL))&&(defined(CERNLIB_SGI))
#include <fgl.h>
#include <fdevice.h>

#endif
#endif

#endif
