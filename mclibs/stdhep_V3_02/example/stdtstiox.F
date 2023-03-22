      PROGRAM TSTIOX
C
C      read in events and histogram contents
C
#include "stdlun.inc"
      INTEGER LOK,IFL,istr,ntries
      CHARACTER*11 FILIN

C initialize HEP logical units
      LNHWRT=0
      LNHRD=23
      LNHDCY=0
      LNHOUT=22
C...now open and read events
      OPEN(UNIT=LNHOUT,FILE='stdtstiox.lpt',STATUS='NEW')
      CALL TSTBKEM(20)
      FILIN='stdtstjx.io'
      call stdxrinit(FILIN,ntries,istr,LOK)
 110  call stdxrd(IFL,istr,LOK)
      IF(LOK.NE.0) GOTO 200
C... keep looping if this is not a STDHEP record
      IF(IFL.NE.1) write(LNHOUT,101) IFL
      IF(IFL.NE.1) GO TO 110
      CALL TSTFLEM(20)
      GO TO 110
 200  CONTINUE
      call stdxend(istr)
C...print histograms
      CALL HOUTPU(LNHOUT)
      CALL HISTDO
      CLOSE(UNIT=LNHOUT)
 101  format(' found record ',i5)
      END

