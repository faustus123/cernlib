*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:09  mclareni
* Initial revision
*
*
*
* fzocxd1.inc
*
#if defined(CERNLIB_QMCRY)
      PARAMETER    (IOVPCS = 17740000000 B)
      PARAMETER    (IOVPCD = 17774000000 B)
      PARAMETER    (IOVNCS = 37740000000 B)
      PARAMETER    (IOVNCD = 37774000000 B)
#endif
*    use default CALL IE3FOS for output single prec.
#ifndef CERNLIB_FQIE3FSC
#endif
*    use default CALL IE3FOD for output double prec.
#ifndef CERNLIB_FQIE3FDC
#endif
*   no longer needed
*
* fzocxd1.inc
*
#if defined(CERNLIB_QMIBM)
C     PARAMETER    (MSKA24 =   Z 00FFFFFF)
      PARAMETER    (MSKA24 =   16 777 215)
C     PARAMETER    (MSKB24 =   Z 00800000)
      PARAMETER    (MSKB24 =    8 388 608)
C     PARAMETER    (MN2131 =   Z 800FFFFF)
      PARAMETER    (MN2131 =-2146 435 073)
C     PARAMETER    (IBADCS =   Z 7F80FE00)
      PARAMETER    (IBADCS = 2139 160 064)
C     PARAMETER    (IBADCD =   Z 7FF01FC0)
      PARAMETER    (IBADCD = 2146 443 200)
C     PARAMETER    (IOVPCS =   Z 7F800000)
      PARAMETER    (IOVPCS = 2139 095 040)
C     PARAMETER    (IOVPCD =   Z 7FF00000)
      PARAMETER    (IOVPCD = 2146 435 072)
C     PARAMETER    (IOVNCS =   Z FF800000)
      PARAMETER    (IOVNCS =   -8 388 608)
C     PARAMETER    (IOVNCD =   Z FFF00000)
      PARAMETER    (IOVNCD =   -1 048 576)
#endif
*   no longer needed
*
* fzocxd1.inc
*
#if defined(CERNLIB_QMIBMD)
C     PARAMETER    (MSKA24 =   Z 00FFFFFF)
      PARAMETER    (MSKA24 =   16 777 215)
C     PARAMETER    (MSKB24 =   Z 00800000)
      PARAMETER    (MSKB24 =    8 388 608)
C     PARAMETER    (MN2131 =   Z 800FFFFF)
      PARAMETER    (MN2131 =-2146 435 073)
C     PARAMETER    (IBADCS =   Z 7F80FE00)
      PARAMETER    (IBADCS = 2139 160 064)
C     PARAMETER    (IBADCD =   Z 7FF01FC0)
      PARAMETER    (IBADCD = 2146 443 200)
C     PARAMETER    (IOVPCS =   Z 7F800000)
      PARAMETER    (IOVPCS = 2139 095 040)
C     PARAMETER    (IOVPCD =   Z 7FF00000)
      PARAMETER    (IOVPCD = 2146 435 072)
C     PARAMETER    (IOVNCS =   Z FF800000)
      PARAMETER    (IOVNCS =   -8 388 608)
C     PARAMETER    (IOVNCD =   Z FFF00000)
      PARAMETER    (IOVNCD =   -1 048 576)
#endif
*   no longer needed
*
* fzocxd1.inc
*
#if defined(CERNLIB_QMND3)
      PARAMETER    (IBADCS = 17740177000 B)
      PARAMETER    (IBADCD = 17774017700 B)
      PARAMETER    (IOVPCS = 17740000000 B)
      PARAMETER    (IOVPCD = 17774000000 B)
      PARAMETER    (IOVNCS = 37740000000 B)
      PARAMETER    (IOVNCD = 37774000000 B)
#endif
*    use default CALL IE3FOS for output single prec.
#ifndef CERNLIB_FQIE3FSC
#endif
*    use default CALL IE3FOD for output double prec.
#ifndef CERNLIB_FQIE3FDC
#endif
*   no longer needed
*
* fzocxd1.inc
*
#if defined(CERNLIB_QMVAX)
      PARAMETER    (MSKB16 = '00008000'X)
      PARAMETER    (IBADCS = '7F80FE00'X)
      PARAMETER    (IBADCD = '7FF01FC0'X)
      PARAMETER    (IOVPCS = '7F800000'X)
      PARAMETER    (IOVPCD = '7FF00000'X)
      PARAMETER    (IOVNCS = 'FF800000'X)
      PARAMETER    (IOVNCD = 'FFF00000'X)
#endif
*    use default CALL IE3FOS for output single prec.
#ifndef CERNLIB_FQIE3FSC
#endif
*    use default CALL IE3FOD for output double prec.
#ifndef CERNLIB_FQIE3FDC
#endif
