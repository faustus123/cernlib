*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:53  mclareni
* Initial revision
*
*
#if defined(CERNLIB_IBMVM) || defined(CERNLIB_IBMMVS)
#ifndef CERNLIB_IBM
#define CERNLIB_IBM
#endif
#endif

#if defined(CERNLIB_CRAY) || defined(CERNLIB_CDC)
#ifndef CERNLIB_SINGLE
#define CERNLIB_SINGLE
#endif
#endif

#if defined(CERNLIB_UNIX) && !defined(CERNLIB_SINGLE)
#ifndef CERNLIB_DOUBLE
#define CERNLIB_DOUBLE
#endif
#endif

#if defined(CERNLIB_IBM) || defined(CERNLIB_VAX) || defined(CERNLIB_NORD)
#ifndef CERNLIB_DOUBLE
#define CERNLIB_DOUBLE
#endif
#endif

