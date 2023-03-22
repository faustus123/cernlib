
      subroutine HEPZWRT(lok)
C
C... write an event in zebra FZ format
C
C        lok = 0 if no problems were encountered

      IMPLICIT NONE
#include "stdhep.inc"
#include "stdlun.inc"
#include "hepzbr.inc"

      integer lok
      logical lfirst
      data lfirst/.TRUE./
      save lfirst

C...print version number if this is the first call
      if(lfirst)then
        call stdversn
        lfirst=.FALSE.
      endif

      lok=0
      call HPZFLB
      if(lnhwrt.LE.0)then
        write(lnhout,102) lnhout
        lok=1
      elseif(NHEP.LE.0)then
        write(lnhout,101) NEVHEP
        lok=2
      else
#if defined(HEPDBG)
C... debugging calls
        call DZSTOR('Display store',HPXSTR)
        call DZSURV('Survey event division',HPXEVT,LE1)
        call DZSHOW('Display bank1',HPXEVT,LE1,'DLV',0,0,0,0)
#endif
C... call zebra output here
        call FZOUT(lnhwrt,HPXEVT,LE1,1,' ',2,1,NEVHEP)
      endif
      return
  101 format(/5X,'HEPZWRT: no particles to write in event',I8)
  102 format(/5X,'HEPZWRT: illegal output unit number:',I8)
      end
