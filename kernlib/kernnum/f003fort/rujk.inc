*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:53  mclareni
* Initial revision
*
*
*
* rujk.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          JU  =  LOCF(U12) - LOCF(U)
          KU  =  LOCF(U22) - LOCF(U)
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          JU  =  LOC(U12) - LOC(U)
          KU  =  LOC(U22) - LOC(U)
#endif
#if defined(CERNLIB_NUMDE)
          JU  =  (%LOC(U12) - %LOC(U)) / 4
          KU  =  (%LOC(U22) - %LOC(U)) / 4
#endif
#if defined(CERNLIB_NUMIB1)
          JU  =  (IADDR(U12) - IADDR(U)) / 4
          KU  =  (IADDR(U22) - IADDR(U)) / 4
#endif
#if defined(CERNLIB_NUM64)
          JU  =  IPTRDIFF(U12, U) / 4
          KU  =  IPTRDIFF(U22, U) / 4
#endif
