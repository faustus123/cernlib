*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:14  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_HIGRAF_INC
#define CERNLIB_HIGZ_HIGRAF_INC
*
*
* higraf.inc
*
*CMZ :  1.23/06 14/11/95  10.22.09  by  O.Couet
*-- Author :
      PARAMETER (NPMAX=500)
      COMMON /HIGRAF/ NGRAF,XGRAF(NPMAX),YGRAF(NPMAX)
      COMMON /HIGRA3/ ZGRAF(NPMAX)

#endif
