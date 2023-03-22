*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:53  mclareni
* Initial revision
*
*
*
* cujk.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          JU  =  (LOCF(U12) - LOCF(U)) / 2
          KU  =  (LOCF(U22) - LOCF(U)) / 2
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          JU  =  (LOC(U12) - LOC(U)) / 2
          KU  =  (LOC(U22) - LOC(U)) / 2
#endif
#if defined(CERNLIB_NUMDE)
          JU  =  (%LOC(U12) - %LOC(U)) / 8
          KU  =  (%LOC(U22) - %LOC(U)) / 8
#endif
#if defined(CERNLIB_NUMIB1)
          JU  =  (IADDR(U12) - IADDR(U)) / 8
          KU  =  (IADDR(U22) - IADDR(U)) / 8
#endif
#if defined(CERNLIB_NUM64)
          JU  =  IPTRDIFF(U12, U) / 8
          KU  =  IPTRDIFF(U22, U) / 8
#endif
