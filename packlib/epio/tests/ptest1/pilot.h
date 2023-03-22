*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:44  mclareni
* Initial revision
*
*
#if defined(CERNLIB_VAXVMS)||defined(CERNLIB_VAXULX)
#ifndef CERNLIB_VAX
#define CERNLIB_VAX
#endif
#endif
#if (defined(CERNLIB_UNIX))&&(!defined(CERNLIB_DECS))
#ifndef CERNLIB_STF77
#define CERNLIB_STF77
#endif
#endif
#if defined(CERNLIB_DECS)
#ifndef CERNLIB_STF77VX
#define CERNLIB_STF77VX
#endif
#endif
