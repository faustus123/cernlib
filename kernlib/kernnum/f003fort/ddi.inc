*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:53  mclareni
* Initial revision
*
*
*
* ddi.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          ID  =  (LOCF(D2)  - LOCF(D)) / 2
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          ID  =  (LOC(D2)  - LOC(D)) / 2
#endif
#if defined(CERNLIB_NUMDE)
          ID  =  (%LOC(D2)  - %LOC(D)) / 8
#endif
#if defined(CERNLIB_NUMIB1)
          ID  =  (IADDR(D2)  - IADDR(D)) / 8
#endif
#if defined(CERNLIB_NUM64)
          ID  =  IPTRDIFF(D2, D) / 8
#endif
