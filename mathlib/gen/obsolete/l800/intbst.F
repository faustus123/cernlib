*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:18  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      SUBROUTINE INTBST(LDIM,IERR)
C--- INCREASES AVAILABLE LCM DYNAMICALLY.
C--- INPUT
C   LDIM = LENGTH OF BLOCK TO BE STORED BY PUTBST
C--- OUTPUT
C   IERR = 0 IF REQUEST FULFILLED, OR NO. OF WORDS OVER USER LCM SPACE
      COMMON/AUXBST/LSTBST,LBLBST,LB2BST,MAXBST,NLMBST,LFRBST,LOWBST
C--- LENGTH OF ONE BLOCK IN LCM (+2 WORDS FOR CONTROL)
#if defined(CERNLIB_NOSBE)
      DIMENSION MESSGY(6)
      DATA MESSGY / 10HSUPRLAY FA, 10HTAL ERROR,, 10HSUPINIT(RO,
     +              10HOT) NOT CA, 10HLLED FIRST, 0/
#endif
#if !defined(CERNLIB_NOSBE)
      DATA LSTBST / 0/
#endif
      DATA LBLBST,LOWBST,MAXBST,NLMBST,LFRBST/510,1,3*0/
      LB2BST=LBLBST+2
C--- GET INITIAL LCM LENGTH
      IF(LSTBST.NE.0) GO TO 5
#if defined(CERNLIB_NOSBE)
      CALL REMARK(MESSGY)
      STOP
#endif
#if !defined(CERNLIB_NOSBE)
      CALL INCLCM(0,LSTBST,IERR)
#endif
    5 CONTINUE
C--- INCREASE BY AT LEAST 10*LB2BST WORDS
      L=MAX(10,(LDIM-1)/LBLBST-LFRBST+1)
      LAST=LSTBST
      MLAST=MAXBST
#if !defined(CERNLIB_NOSBE)
      CALL INCLCM(L*LB2BST,LSTBST,IERR)
#endif
#if defined(CERNLIB_NOSBE)
      CALL SUPLCM(L*LB2BST,LSTBST,IERR)
#endif
      IF(IERR.NE.0) GOTO 10
      INC=LSTBST-LAST
C--- NEW MAX. LENGTH
      MAXBST=MAXBST+(INC/LB2BST)*LB2BST
C--- NEW NO. OF FREE BLOCKS
      LFRBST=LFRBST+(MAXBST-MLAST)/LB2BST
C--- FIRST WORD OF FIRST NEW BLOCK IN EXTENDED REGION
      NLMBST=MLAST+1
   10 CONTINUE
      RETURN
      END
