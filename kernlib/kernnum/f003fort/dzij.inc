*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:54  mclareni
* Initial revision
*
*
*
* dzij.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IZ  =  (LOCF(Z21) - LOCF(Z)) / 2
          JZ  =  (LOCF(Z12) - LOCF(Z)) / 2
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IZ  =  (LOC(Z21) - LOC(Z)) / 2
          JZ  =  (LOC(Z12) - LOC(Z)) / 2
#endif
#if defined(CERNLIB_NUMDE)
          IZ  =  (%LOC(Z21) - %LOC(Z)) / 8
          JZ  =  (%LOC(Z12) - %LOC(Z)) / 8
#endif
#if defined(CERNLIB_NUMIB1)
          IZ  =  (IADDR(Z21) - IADDR(Z)) / 8
          JZ  =  (IADDR(Z12) - IADDR(Z)) / 8
#endif
#if defined(CERNLIB_NUM64)
          IZ  =  IPTRDIFF(Z21, Z) / 8
          JZ  =  IPTRDIFF(Z12, Z) / 8
#endif
