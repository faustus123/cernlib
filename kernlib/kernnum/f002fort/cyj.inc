*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:49  mclareni
* Initial revision
*
*
*
* cyj.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          JY  =  (LOCF(Y2) - LOCF(Y)) / 2
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          JY  =  (LOC(Y2) - LOC(Y)) / 2
#endif
#if defined(CERNLIB_NUMDE)
          JY  =  (%LOC(Y2) - %LOC(Y)) / 8
#endif
#if defined(CERNLIB_NUMIB1)
          JY  =  (IADDR(Y2) - IADDR(Y)) / 8
#endif
#if defined(CERNLIB_NUM64)
          JY  =  IPTRDIFF(Y2, Y) / 8
#endif
