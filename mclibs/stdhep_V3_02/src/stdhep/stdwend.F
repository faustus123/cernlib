
      subroutine stdwend(ilbl,lok)

C...Purpose: to write end run information in a standard format
C
C        if ilbl = 200   write STDHEP end run record
C          ilbl = 201        write PYTHIA end run record
C          ilbl = 202        write JETSET end run record
C          ilbl = 203        write HERWIG end run record
C          ilbl = 204        write ISAJET end run record
C          ilbl = 205        write QQ end run record
C
C        lok = 0 if no problems were encountered

#include "stdlun.inc"

      integer ilbl,lok,NBUF

      lok=0
      if(lnhwrt.LE.0)then
      elseif(ilbl.EQ.200)then
        call STDWSTND(ilbl,lok)
      elseif(ilbl.EQ.201)then
        write(lnhout,1001) ilbl
C        call STDWLUND(ilbl,lok)
C        call STDWPYND(ilbl,lok)
      elseif(ilbl.EQ.202)then
        write(lnhout,1001) ilbl
C        call STDWLUND(ilbl,lok)
      elseif(ilbl.EQ.203)then
        write(lnhout,1001) ilbl
C        call STDWHWND(ilbl,lok)
      elseif(ilbl.EQ.204)then
        call STDWISND(ilbl,lok)
      elseif(ilbl.EQ.205)then
        write(lnhout,1001) ilbl
C        call STDWQQND(ilbl,lok)
      else
        write(lnhout,1001) ilbl
      endif
      if(lok.NE.0) write (lnhout,1005)
      return
900   lok = 1
      write (lnhout,1005)
      return
 1001 format(/5X,'STDWEND: end run record not written for ',I5)
 1005 format(/5X,'STDWEND: write error')
      end
