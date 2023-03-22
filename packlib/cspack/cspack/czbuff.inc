*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:16  mclareni
* Initial revision
*
*
#ifndef CERNLIB_CSPACK_CZBUFF_INC
#define CERNLIB_CSPACK_CZBUFF_INC
*
*
* czbuff.inc
*
      COMMON/CZBUFC/CHBUF
*
*     Buffer size for ASCII file transfer
*
      CHARACTER*16320 CHBUF
*     CHARACTER*20480 CHBUF
*     DIMENSION ICBUF(4080)
*     DIMENSION ICBUF(5120)
*     EQUIVALENCE (CHBUF,ICBUF(1))
*

#endif
