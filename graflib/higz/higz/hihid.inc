*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:16  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_HIHID_INC
#define CERNLIB_HIGZ_HIHID_INC
*
*
* hihid.inc
*
      PARAMETER (MAXSTK=10)
      COMMON /HIHID/ REFWRD(MAXSTK),ZMINST,ZMAXST
     +,IXFCHA(MAXSTK),IYFCHA(MAXSTK),IXNCHA(MAXSTK),IYNCHA(MAXSTK)
     +,ISTCOL(MAXSTK),ISTCO2(MAXSTK),ISTCOT,ISTCOB,IADRES(MAXSTK)
     +,NIDS,XSTP,YSTP,XLAB1,YLAB1,XLAB2,YLAB2,IDRGR,RLEGBO,RLEGBW
     +,I4AXI,ISYS,ILOGX,ILOGY,XVAL1,XVAL2,YVAL1,YVAL2,RINRAD,DANG

#endif
