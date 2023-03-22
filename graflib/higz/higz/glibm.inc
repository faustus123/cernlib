*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:17  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_GLIBM_INC
#define CERNLIB_HIGZ_GLIBM_INC
*
*
* glibm.inc
*
#if (defined(CERNLIB_KERNEL))&&(!defined(CERNLIB_MSDOS))
#if (defined(CERNLIB_GL))&&(defined(CERNLIB_IBMRT))
      INCLUDE 'gl/fgl.h'
      INCLUDE 'gl/fdevice.h'

#endif
#endif

#endif
