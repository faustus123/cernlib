*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:43  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
      SUBROUTINE EPUNIT(LUNIT,IERR)
C. RETURNS THE INTERNAL UNIT NUMBER, INITIALIZES NEW UNITS
C. INPUT
C. LUNIT     LOGICAL UNIT NUMBER
C. OUTPUT
C. LREF      INTERNAL UNIT NUMBER (1,2,3...)
C. IERR      ERROR CONDITION
C.-- OUTPUT IN COMMON BLOCK :
C   LREF     INTERNAL UNIT NUMBER
C   ISTART   START OF UNIT DESCRIPTOR IN LIST
#include "epio/epiocom.inc"
#if defined(CERNLIB_UNIVAC)
      CHARACTER*3 CYC
      CHARACTER*6 NFUNIT,REELNO
      CHARACTER*12 QUAL,FILE
      CHARACTER*30 FTEMP
      INTEGER PKT(0:12)
      DATA PKT(1)/'      'F/
#endif
#if defined(CERNLIB_ND100B16)
      DATA INFINI/ 9999 /
#endif
#if !defined(CERNLIB_ND100B16)
      DATA INFINI/ 999999 /
#endif
      IERR=0
      IF(LUNIT.NE.LASTUT)  CALL EPUREF(LUNIT)
      IF(LREF.GT.0)  GOTO 77777
      IF(LIST(1).EQ.NMUNIT)  GOTO 9901
C--- OPEN NEW UNIT
      LIST(1)=LIST(1)+1
      LREF=LIST(1)
      K=NCONT+NWUNIT*(LREF-1)
      CALL UZERO(LIST,K+1,K+NWUNIT)
      LIST(K+1)=1800
      LIST(K+2)=INFINI
      LIST(K+3)=16
      LIST(K+4)=10101
      LIST(K+8)=1
      LIST(K+10)=LUNIT
      LIST(K+26)=INFINI
      LIST(K+27)=1
#if defined(CERNLIB_UNIX)
      LIST(K+33)=2
#endif
#if defined(CERNLIB_UNIVAC)
C--- CONVERT FILE NAME TO CHARACTERS
      IF(LUNIT.LT.10) ENCODE(6,10,NFUNIT) LUNIT
      IF(LUNIT.GE.10) ENCODE(6,11,NFUNIT) LUNIT
C--- CONVERT ASCII FILE NAME TO FIELDATA
      N=2
      CALL FASCFD(N,NFUNIT,LIST(K+24))
C--- FIND DEVICE TYPE (TAPE/DISK), FILENAME & REELNO IF TAPE
      PKT(0)=LIST(K+24)
      CALL FITEM(PKT)
      IO=BITS(PKT(6),1,6)
      IF(IO.LE.0) THEN
C--- UNIT NOT ASSIGNED. TRY TO ASSIGN A TEMPORARY DISKFILE.
        IERR=11
        CALL EPERRH(LUNIT,IERR)
        IO=1
        IF(LUNIT.GE.10) IO=2
        IERR=FACSF('@ASG,T '//NFUNIT(1:IO)//'.,F4///800 . ')
        WRITE(6,12) IERR,NFUNIT
        IF(IERR.LT.0) THEN
          IERR=IABS(IERR)
          GOTO 77777
         ENDIF
        IO=16
        IERR=0
       ELSE
        N=2
        CALL FFDASC(N,PKT(2),FILE)
        NFL=INDEX(FILE,' ')-1
        IF(NFL.LE.0) NFL=12
        IF(IO.LT.16) THEN
C--- PRINT OPENING MESSAGE FOR TAPE
          N=1
          CALL FFDASC(N,PKT(11),REELNO)
          FTEMP=FILE(1:NFL)//'. REELNO: '//REELNO
          WRITE(6,13) LUNIT,FTEMP
         ELSE
C--- PRINT OPENING MESSAGE FOR DISK-FILE
          N=2
          CALL FFDASC(N,PKT(4),QUAL)
          NQL=INDEX(QUAL,' ')-1
          IF(NQL.LE.0) NQL=12
          ICYCL=BITS(PKT(6),25,12)
          ENCODE(3,14,CYC) ICYCL
          NCL=1
          IF(ICYCL.GE.10) NCL=2
          IF(ICYCL.GE.100) NCL=3
          FTEMP=QUAL(1:NQL)//'*'//FILE(1:NFL)//'('//CYC(4-NCL:3)//')'
          WRITE(6,15) LUNIT,FTEMP
         ENDIF
       ENDIF
C--- SET ADDRESS = 0 FOR DISK, = -1 FOR TAPE
      LIST(K+25)=0
      IF(IO.LT.16) LIST(K+25)=-1
   10 FORMAT(I1,5X)
   11 FORMAT(I2,4X)
   12 FORMAT('0  STATUS',O14,' WHEN ASSIGNING TEMPORARY FILE ',A6)
   13 FORMAT('0LOGICAL UNIT',I3,' OPENED BY EP PACKAGE IS TAPE ',A30)
   14 FORMAT(I3)
   15 FORMAT('0LOGICAL UNIT',I3,' OPENED BY EP PACKAGE IS FILE ',A30)
#endif
      ISTART=K
77777 RETURN
 9901 CONTINUE
C--- MAX. NO. OF UNITS REACHED
      LREF=0
      IERR=13
      CALL EPERRH(LUNIT,IERR)
      GOTO 77777
      END
