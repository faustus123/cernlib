      PROGRAM TST
C
C      test program
C      list standard particle definitions
C      read the PDG mass and width list
C
#include "stdlun.inc"

C initialize HEP logical units
      LNHWRT=0
      LNHRD=0
      LNHDCY=30
      LNHOUT=22
      OPEN(UNIT=LNHOUT,FILE='stdhep.lpt',STATUS='NEW')
C
      call stdversn
C
      CALL STDLST
C
      CALL PDGRDTB
C
      CALL PDGPRTB(1,LNHOUT)
C
      CLOSE(UNIT=LNHOUT)
      STOP
      END

