*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:46:53  mclareni
* Initial revision
*
*
#ifndef CERNLIB_ZEBRA_RZDIR_INC
#define CERNLIB_ZEBRA_RZDIR_INC
*
*
* rzdir.inc
*
      PARAMETER (NLPATM=100)
      COMMON /RZDIRN/NLCDIR,NLNDIR,NLPAT
      COMMON /RZDIRC/CHCDIR(NLPATM),CHNDIR(NLPATM),CHPAT(NLPATM)
      CHARACTER*16   CHNDIR,    CHCDIR,    CHPAT
C

#endif
