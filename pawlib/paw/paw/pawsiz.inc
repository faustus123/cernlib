*
* $Id$
*
* $Log$
* Revision 1.2  1996/03/01 16:50:06  cernlib
* All includes  had picked up a completely wrong #if defined(CERNLIB_UNIX), ie.
*  the real commons/declarations were missing on non-unix.
*
* Revision 1.1.1.1  1996/03/01 11:38:48  mclareni
* Paw
*
*
#ifndef CERNLIB_PAW_PAWSIZ_INC
#define CERNLIB_PAW_PAWSIZ_INC
*
*
* pawsiz.inc
*
*CMZ :  2.02/00 13/04/93  18.00.47  by  Rene Brun
*-- Author :
#if defined(CERNLIB_UNIX)||defined(CERNLIB_APOLLO)||defined(CERNLIB_VAX)
#include "paw/pawbig.inc"
#endif
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_NEWLIB))
#include "paw/pawbig.inc"
#endif
#if (defined(CERNLIB_IBM))&&(!defined(CERNLIB_NEWLIB))
#include "paw/pawsmall.inc"
#endif

C      Include this file so that MDPOOL/IQ is present in pawX11 and
C      paw++ dynamically linked executables.
C      -- Kevin McCarty, for Debian, 1 Nov 2003
#include "comis/mdpool.inc"

#endif
