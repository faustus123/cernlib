*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:58  mclareni
* Initial revision
*
*
* PROGRAM FOR COPYING EP-FILES TO DISK FROM TAPE
#if defined(CERNLIB_UNIVAC)
#include "sys/CERNLIB_machine.h"
#include "_epio/pilot.h"
C     PROGRAM EPFRTAPE COPIES TAPE FILES IN EP-FORMAT TO DISK BLOCK
C       BY BLOCK. THE PROGRAM PREFIXES EACH BLOCK BY ONE WORD CONTAINING
C       ('EP',BLOCK LENGTH), THUS GIVING THE DISK FILE THE SAME STRUCTURE
C       AS THE TAPEFILE. A DISK BLOCK ALWAYS STARTS ON A SECTOR BOUNDARY.
C       WHEN THE PROGRAM ENCOUNTERS A TAPE EOF, A ONE WORD BLOCK CONTAIN-
C       ING THE WORD 'EOFM' IS WRITTEN TO THE DISK FILE.
C     THE PROGRAM WILL, IF RUN IN DEMAND, QUERY FOR THE OUTPUT FILE NAMES.
C     IF OPTION('R') THE PROGRAM COPIES ONLY THE FIRST NFBLK BLOCKS FROM
C       THE INPUT TAPE. NFBLK IS READ FOR EACH FILE BEFORE THE FILENAME.
C
C     THE INPUT TAPE MUST BE ASSIGNED USING THE NAME EPTAPE.
C
      PARAMETER (NBUF=5000)
      IMPLICIT INTEGER (A-Z)
      LOGICAL DEMAND,DEM,OPTION,OPTR,IFMOVE
      CHARACTER*48 UDFILE
      CHARACTER*1 UDFILC(48)
      DIMENSION BUF(NBUF)
      DATA DFIL/'EP$UD 'F/,TFIL/'EP$TP 'F/,IEOF/'EOFM'/
      DATA BUF(1)/'EP  '/
C
C     DUMMY READ FOR ENABLING PROCESSOR CALL
C
      READ(5,17)
C
C     DEMAND RUN ?
C
      DEM=DEMAND(IDUM)
C
C     CHECK TAPE FILE ASSIGNMENT
C
      ISTAT=FACSF2('@USE EP$TP,EPTAPE . ')
      IOD=IODEV('EP$TP')
      IF(IOD.LE.0) THEN
        WRITE(6,*) '  NO TAPE NAMED EPTAPE IS ASSIGNED'
        STOP 'PROGRAM TERMINATED'
       ELSE IF(IOD.GE.16) THEN
        WRITE(6,*) '  EPTAPE IS A DISK FILE, NOT TAPE'
        STOP 'PROGRAM TERMINATED'
       ENDIF
      NFITOT=0
      NBLTOT=0
      IQUE=0
      OPTR=OPTION('R')
      IFMOVE=.FALSE.
      NFBLK=-1
  100 CONTINUE
      IF(OPTR) THEN
        IF(DEM) WRITE(6,*) ' HOW MANY BLOCKS SHOULD BE COPIED ?'
        READ(5,*,END=400) NFBLK
        IF(IFMOVE) CALL TIOMVF(TFIL,1,ISTAT)
        IFMOVE=.FALSE.
       ENDIF
      IF(DEM) WRITE(6,*) '  ENTER FILENAME OR @EOF'
      READ(5,'(A48)',END=400) UDFILE
      DO 110 I=1,48
  110 UDFILC(I)=UDFILE(I:I)
      IQUE=IQUE+1
      I1=1
      DO 120 I=1,48
      IF(UDFILC(I).NE.' ') GOTO 130
  120 I1=I+1
  130 CONTINUE
      I2=48
      DO 140 I=48,1,-1
      IF(UDFILC(I).NE.' ') GOTO 150
  140 I2=I-1
  150 CONTINUE
      IF(I1.GT.I2) THEN
        WRITE(6,10) UDFILE
        GOTO 180
       ENDIF
      ISTAT=FACSF2('@USE EP$UD.,'//UDFILE(I1:I2)//' . ')
      IF(ISTAT.NE.0) THEN
        WRITE(6,11) (UDFILC(I),I=I1,I2)
        GOTO 180
       ENDIF
C
C     CHECK DEVICE
C
      IOD=IODEV('EP$UD')
      IF(IOD.LE.0) THEN
        ISTAT=FACSF2('@ASG,A EP$UD . ')
        IOD=IODEV('EP$UD')
       ENDIF
      IF(IOD.LE.0) THEN
        WRITE(6,12) (UDFILC(I),I=I1,I2)
        GOTO 180
       ENDIF
      IF(IOD.LT.16) THEN
        WRITE(6,13) (UDFILC(I),I=I1,I2)
        GOTO 180
       ENDIF
      GOTO 190
C
C     ERROR. ABORT IF BATCH, OTHERWISE TRY AGAIN BUT AT MOST THREE TIMES
C
  180 IF(.NOT.DEM) CALL FABORT
      IF(IQUE.LT.3) GOTO 100
      STOP 'ABNORMAL TERMINATION'
C
C     ALL CHECKS DONE. START TO COPY.
C
  190 NBLOCK=0
      IADD=0
      IQUE=0
C
C     GET A BLOCK
C
  200 CALL TIOR(TFIL,BUF(2),NBUF,ISTAT,IAFH)
      IF(ISTAT.LT.-4) THEN
C
C     I/O ERROR
C
        WRITE(6,15) NBLOCK,NFITOT
        IF(DEM) STOP
        CALL FABORT
       ENDIF
  210 CONTINUE
      IF(ISTAT.EQ.-1) THEN
C
C     END-OF-FILE ON INPUT TAPE
C
        IF(NBLOCK.EQ.0) GOTO 400
        NBLTOT=NBLTOT+NBLOCK
        NFITOT=NFITOT+1
        WRITE(6,16) NBLOCK,NFITOT,(UDFILC(I),I=I1,I2)
        CALL FIOW(DFIL,IEOF,1,IADD,ISTAT)
        GOTO 100
       ENDIF
      NW=ISTAT
      BITS(BUF(1),19,18)=NW
      CALL FIOW(DFIL,BUF,NW+1,IADD,ISTAT)
      IF(ISTAT.LT.0) THEN
        WRITE(6,14) ISTAT,IADD,(UDFILC(I),I=I1,I2)
        IF(DEM) STOP
        CALL FABORT
       ENDIF
      IADD=IADD+(NW+28)/28
      NBLOCK=NBLOCK+1
      IF(NBLOCK.EQ.NFBLK) THEN
        ISTAT=-1
        IFMOVE=.TRUE.
        GOTO 210
       ELSE
        GOTO 200
       ENDIF
  400 WRITE(6,17) NFITOT,NBLTOT
      WRITE(6,18)
      STOP
   10 FORMAT('  INCORRECT FILENAME READ: ',A48)
   11 FORMAT('  STATUS',O14,' FOR @USE EP$UD.,',48A1)
   12 FORMAT('  FILE IS NOT CATALOGUED OR ASSIGNED: ',48A1)
   13 FORMAT('  OUTPUT FILE IS A TAPEFILE. COPY BY OTHER MEANS !')
   14 FORMAT('  STATUS',O14,' RETURNED FOR IADD=',I8,' ON FILE ',48A1)
   15 FORMAT('  STATUS',O14,' RETURNED FOR BLOCK ',I4,' , FILE NO ',
     1 I3,' ON INPUT TAPE')
   16 FORMAT(I6,' BLOCKS COPIED FROM FILE NO',I3,' TO ',48A1)
   17 FORMAT(I5,' FILES COPIED, TOTALLY ',I8,' BLOCKS')
   18 FORMAT('  NORMAL PROGRAM TERMINATION')
      END
#endif
