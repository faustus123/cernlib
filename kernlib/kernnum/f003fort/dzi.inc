*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:54  mclareni
* Initial revision
*
*
*
* dzi.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IZ  =  (LOCF(Z2)  - LOCF(Z)) / 2
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IZ  =  (LOC(Z2)  - LOC(Z)) / 2
#endif
#if defined(CERNLIB_NUMDE)
          IZ  =  (%LOC(Z2)  - %LOC(Z)) / 8
#endif
#if defined(CERNLIB_NUMIB1)
          IZ  =  (IADDR(Z2)  - IADDR(Z)) / 8
#endif
#if defined(CERNLIB_NUM64)
          IZ  =  IPTRDIFF(Z2, Z) / 8
#endif
