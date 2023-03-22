
      subroutine stdrend(ilbl,NB,lok)

C...Purpose: to read end run information in a standard format
C
C        if ilbl = 200   read STDHEP end run record
C          ilbl = 201        read PYTHIA end run record
C          ilbl = 202        read JETSET end run record
C          ilbl = 203        read HERWIG end run record
C          ilbl = 204        read ISAJET end run record
C          ilbl = 205        read QQ end run record
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "stdlun.inc"

      integer ilbl,lok,NB

      lok=0
      if(ilbl.EQ.200)then
        call STDRSTND(NB,lok)
      elseif(ilbl.EQ.201)then
        write(lnhout,1001) ilbl
C        call STDRLUND(NB,lok)
C        call STDRPYND(NB,lok)
      elseif(ilbl.EQ.202)then
        write(lnhout,1001) ilbl
C        call STDRLUND(NB,lok)
      elseif(ilbl.EQ.203)then
        write(lnhout,1001) ilbl
C        call STDRHWND(NB,lok)
      elseif(ilbl.EQ.204)then
        call STDRISND(NB,lok)
      elseif(ilbl.EQ.205)then
        write(lnhout,1001) ilbl
C        call STDRQQND(NB,lok)
      else
        write(lnhout,1006)
      endif
      if(lok.NE.0) write (lnhout,1007)
      return
 1001 format(/5X,'STDREND: end run record not written for ',I5)
 1004 format(/5X,'STDREND: ISAJET has problem reading record')
 1006 format(/5X,'STDREND: unrecognized begin run record')
 1007 format(/5X,'STDREND: read error')
      end
