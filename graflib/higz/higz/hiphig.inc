*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:17  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_HIPHIG_INC
#define CERNLIB_HIGZ_HIPHIG_INC
*
*   COMMON BLOCK for the PHIGS interface
*
* hiphig.inc
*
#if defined(CERNLIB_PHIGS)
      COMMON /HIPHIG/ LOSTOP,LOSTEX,ICSTN
      LOGICAL LOSTOP,LOSTEX
#endif

#endif
