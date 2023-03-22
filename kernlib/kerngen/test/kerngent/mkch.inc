*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:55:05  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNGENT_MKCH_INC
#define CERNLIB_KERNGENT_MKCH_INC
*
*
* mkch.inc
*
      CHARACTER      MKLINE*512, MKCOL(512)*1
      COMMON /MKCH/  MKLINE
      EQUIVALENCE   (MKCOL,MKLINE)

#endif
