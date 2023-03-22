*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:54  mclareni
* Initial revision
*
*
*
* rxij.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IX  =  LOCF(X21) - LOCF(X)
          JX  =  LOCF(X12) - LOCF(X)
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IX  =  LOC(X21) - LOC(X)
          JX  =  LOC(X12) - LOC(X)
#endif
#if defined(CERNLIB_NUMDE)
          IX  =  (%LOC(X21) - %LOC(X)) / 4
          JX  =  (%LOC(X12) - %LOC(X)) / 4
#endif
#if defined(CERNLIB_NUMIB1)
          IX  =  (IADDR(X21) - IADDR(X)) / 4
          JX  =  (IADDR(X12) - IADDR(X)) / 4
#endif
#if defined(CERNLIB_NUM64)
          IX  =  IPTRDIFF(X21, X) / 4
          JX  =  IPTRDIFF(X12, X) / 4
#endif
