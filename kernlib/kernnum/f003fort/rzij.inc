*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:54  mclareni
* Initial revision
*
*
*
* rzij.inc
*
#if defined(CERNLIB_NUMAP)||defined(CERNLIB_NUMCD)||defined(CERNLIB_NUMCV)||defined(CERNLIB_NUMIB2)||defined(CERNLIB_NUMND)
          IZ  =  LOCF(Z21) - LOCF(Z)
          JZ  =  LOCF(Z12) - LOCF(Z)
#endif
#if defined(CERNLIB_NUMCR)||defined(CERNLIB_NUMUC)
          IZ  =  LOC(Z21) - LOC(Z)
          JZ  =  LOC(Z12) - LOC(Z)
#endif
#if defined(CERNLIB_NUMDE)
          IZ  =  (%LOC(Z21) - %LOC(Z)) / 4
          JZ  =  (%LOC(Z12) - %LOC(Z)) / 4
#endif
#if defined(CERNLIB_NUMIB1)
          IZ  =  (IADDR(Z21) - IADDR(Z)) / 4
          JZ  =  (IADDR(Z12) - IADDR(Z)) / 4
#endif
#if defined(CERNLIB_NUM64)
          IZ  =  IPTRDIFF(Z21, Z) / 4
          JZ  =  IPTRDIFF(Z12, Z) / 4
#endif
