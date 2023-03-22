*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:53  mclareni
* Initial revision
*
*
*
* rzi.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IZ  =  LOCF(Z2)  - LOCF(Z)
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IZ  =  LOC(Z2)  - LOC(Z)
#endif
#if defined(CERNLIB_NUMDE)
          IZ  =  (%LOC(Z2)  - %LOC(Z)) / 4
#endif
#if defined(CERNLIB_NUMIB1)
          IZ  =  (IADDR(Z2)  - IADDR(Z)) / 4
#endif
#if defined(CERNLIB_NUM64)
          IZ  =  IPTRDIFF(Z2, Z) / 4
#endif
