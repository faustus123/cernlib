*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:54  mclareni
* Initial revision
*
*
*
* ryij.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IY  =  LOCF(Y21) - LOCF(Y)
          JY  =  LOCF(Y12) - LOCF(Y)
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IY  =  LOC(Y21) - LOC(Y)
          JY  =  LOC(Y12) - LOC(Y)
#endif
#if defined(CERNLIB_NUMDE)
          IY  =  (%LOC(Y21) - %LOC(Y)) / 4
          JY  =  (%LOC(Y12) - %LOC(Y)) / 4
#endif
#if defined(CERNLIB_NUMIB1)
          IY  =  (IADDR(Y21) - IADDR(Y)) / 4
          JY  =  (IADDR(Y12) - IADDR(Y)) / 4
#endif
#if defined(CERNLIB_NUM64)
          IY  =  IPTRDIFF(Y21, Y) / 4
          JY  =  IPTRDIFF(Y12, Y) / 4
#endif
