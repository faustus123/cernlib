*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:53  mclareni
* Initial revision
*
*
*
* rxi.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IX  =  LOCF(X2)  - LOCF(X)
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IX  =  LOC(X2)  - LOC(X)
#endif
#if defined(CERNLIB_NUMDE)
          IX  =  (%LOC(X2)  - %LOC(X)) / 4
#endif
#if defined(CERNLIB_NUMIB1)
          IX  =  (IADDR(X2)  - IADDR(X)) / 4
#endif
#if defined(CERNLIB_NUM64)
          IX  =  IPTRDIFF(X2, X) / 4
#endif
