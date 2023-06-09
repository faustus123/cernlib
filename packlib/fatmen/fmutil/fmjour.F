*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:18  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMJOUR(FNAME)
*CMZ :          18/02/91  09.51.42  by  Jamie Shiers
*-- Author :    Jamie Shiers   18/02/91
*
*     Generate unique name for journal file
*
#include "fatmen/slate.inc"
      CHARACTER*(*) FNAME
      CHARACTER*8   CHUSER,CHHOST,CHTYPE,CHSYS,CHRAND
      CHARACTER*12  CHDATE
      CHARACTER*6   CHENT
      INTEGER       FMHOST,FMUSER
      SAVE NENTRY,CHUSER,CHHOST,LCHU,LCHH
      DATA NENTRY/0/
 
      IF(NENTRY.EQ.0) THEN
         IC = FMUSER(CHUSER)
         IC = FMHOST(CHHOST,CHTYPE,CHSYS)
         LCHU = LENOCC(CHUSER)
         LCHH = LENOCC(CHHOST)
      ENDIF
 
      NENTRY = NENTRY + 1
      CALL DATIME(ID,IT)
#if !defined(CERNLIB_IBMMVS)
      WRITE(CHENT ,'(I6.6)') NENTRY
      CALL FMRAND(CHRAND,IRC)
*     WRITE(CHRAND,'(I8.8)') MOD(IRNDM(IDUMMY),100000000)
      WRITE(CHDATE,'(I6.6,I4.4,I2.2)') ID,IT,IS(6)
      FNAME = 'ZZ' // CHDATE // CHENT // CHRAND // '.' //
     +                CHUSER(1:LCHU) // '_' // CHHOST(1:LCHH)
#endif
#if defined(CERNLIB_IBMMVS)
      WRITE(CHRAND,'(A1,I5.5,I2.2)') 'R',MOD(IRNDM(IDUMMY),100000),
     +IS(6)
      FNAME = CHUSER(1:LCHU) // '.' // CHHOST(1:LCHH) // '.' //
     +        CHRAND
#endif
 
      END
 
 
