      PROGRAM TSTIO
C
C      read in events and histogram contents
C
#include "stdlun.inc"
#if defined(HPZTST)&&defined(UNIX)
#include "quest.inc"
      INTEGER IQUEST,IERR
#endif
      INTEGER LOK,IFL
      CHARACTER*11 FILIN

C initialize HEP logical units
      LNHWRT=0
      LNHRD=23
      LNHDCY=0
      LNHOUT=22
C...now open and read events
#ifdef HPZTST
      OPEN(UNIT=LNHOUT,FILE='stdtstioz.lpt',STATUS='NEW')
      CALL HEPZINIT
#else
      FILIN='stdtsth.io'
      OPEN(UNIT=LNHOUT,FILE='stdtstio.lpt',STATUS='NEW')
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=100,
     1       FORM='UNFORMATTED')
#endif
#ifdef HPZTST
#ifdef UNIX
      FILIN='stdtsthz.fz'
      CALL CFOPEN(IQUEST(1),0,900,'r',2,FILIN,IERR)
      CALL FZFILE(LNHRD,0,'XLI')
#else
      FILIN='stdtsthz.fz'
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=200,
     1       FORM='UNFORMATTED',RECORDTYPE='FIXED',RECL=900,
     2       BLOCKSIZE=3600)
      CALL FZFILE(LNHRD,0,'XI')
#endif
#ifdef HEPDBG
      CALL FZLOGL(LNHRD,3)
#endif
#endif
      CALL TSTBKEM(-1)
#ifdef HPZTST
  10  CALL HEPZRD(LOK)
      IF(LOK.NE.0) GOTO 100
#else
  10  CALL HEPRD(IFL,LOK)
      IF(LOK.NE.0) GOTO 100
C... histogram cross section if it exists
      IF(IFL.EQ.100 .OR. IFL.EQ.200) CALL TSTFLXSEC(0)
C... keep looping if this is not a STDHEP record
      IF(IFL.NE.1) GO TO 10
#endif
      CALL TSTFLEM(0)
      GO TO 10
 100  CONTINUE
#ifdef HPZTST
C...close and drop the zebra file
      CALL FZENDI(LNHRD,'TU')
#endif
      CLOSE(UNIT=LNHRD)
#ifdef HPZTST
#ifdef UNIX
      FILIN='stdtstjz.fz'
      CALL CFOPEN(IQUEST(1),0,900,'r',2,FILIN,IERR)
      CALL FZFILE(LNHRD,0,'XLI')
#else
      FILIN='stdtstjz.fz'
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=200,
     1       FORM='UNFORMATTED',RECORDTYPE='FIXED',RECL=900,
     2       BLOCKSIZE=3600)
      CALL FZFILE(LNHRD,0,'XI')
#endif
#ifdef HEPDBG
      CALL FZLOGL(LNHRD,3)
#endif
 110  CALL HEPZRD(LOK)
      IF(LOK.NE.0) GOTO 200
#else
      FILIN='stdtstj.io'
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=200,
     1       FORM='UNFORMATTED')
 110  CALL HEPRD(IFL,LOK)
      IF(LOK.NE.0) GOTO 200
C... keep looping if this is not a STDHEP record
      IF(IFL.NE.1) GO TO 110
#endif
      CALL TSTFLEM(20)
      GO TO 110
 200  CONTINUE
#ifdef HPZTST
C...close and drop the zebra file
      CALL FZENDI(LNHRD,'TU')
#endif
      CLOSE(UNIT=LNHRD)
#ifdef HPZTST
#ifdef UNIX
      FILIN='stdtstiz.fz'
      CALL CFOPEN(IQUEST(1),0,900,'r',2,FILIN,IERR)
      CALL FZFILE(LNHRD,0,'XLI')
#else
      FILIN='stdtstiz.fz'
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=300,
     1       FORM='UNFORMATTED',RECORDTYPE='FIXED',RECL=900,
     2       BLOCKSIZE=3600)
      CALL FZFILE(LNHRD,0,'XI')
#endif
#ifdef HEPDBG
      CALL FZLOGL(LNHRD,3)
#endif
 210  CALL HEPZRD(LOK)
      IF(LOK.NE.0) GOTO 300
#else
      FILIN='stdtsti.io'
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=300,
     1        FORM='UNFORMATTED')
 210  CALL HEPRD(IFL,LOK)
      IF(LOK.NE.0) GOTO 300
C... histogram cross section if it exists
      IF(IFL.EQ.100 .OR. IFL.EQ.200) CALL TSTFLXSEC(40)
C... keep looping if this is not a STDHEP record
      IF(IFL.NE.1) GO TO 210
#endif
      CALL TSTFLEM(40)
      GO TO 210
 300  CONTINUE
#ifdef HPZTST
C...close and drop the zebra file
      CALL FZENDI(LNHRD,'TU')
#else
      CLOSE(UNIT=LNHRD)
      FILIN='stdtstp.io'
      OPEN(UNIT=LNHRD,FILE=FILIN,STATUS='OLD',ERR=400,
     1        FORM='UNFORMATTED')
 310  CALL HEPRD(IFL,LOK)
      IF(LOK.NE.0) GOTO 400
C... histogram cross section if it exists
      IF(IFL.EQ.100 .OR. IFL.EQ.200) CALL TSTFLXSEC(60)
C... keep looping if this is not a STDHEP record
      IF(IFL.NE.1) GO TO 310
      CALL TSTFLEM(60)
      GO TO 310
 400  CONTINUE
#endif
      CLOSE(UNIT=LNHRD)
C...print histograms
      CALL HOUTPU(LNHOUT)
      CALL HISTDO
      END

