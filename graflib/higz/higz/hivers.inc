*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:12  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_HIVERS_INC
#define CERNLIB_HIGZ_HIVERS_INC
*
*
* hivers.inc
*
*CMZ :  1.18/00 23/04/93  17.50.07  by  O.Couet
*-- Author :
      COMMON /HIVERS/ CHVERS
      CHARACTER*8 CHVERS
*
* hivers.inc
*
#if defined(CERNLIB_MSDOS)
      character*52 CHVERS
      DATA
     * CHVERS /' 1.14/13D (FineSoft,JINR, fine@main2.jinr.dubna.su)'/
#endif

#endif
