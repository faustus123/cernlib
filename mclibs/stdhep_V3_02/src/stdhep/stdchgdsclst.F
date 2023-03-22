
      subroutine STDCHGDSCLST(IP,NDAU,LSIZE,LDTR)

C...Search the HEPEVT common block for all the charged, stable descendants of IP
C
C     IP = index to HEPEVT common block
C     NDAU = number of charged, stable descendants found
C     LDTR(LSIZE) = list of charged, stable descendants of IP

#include "stdhep.inc"
#include "stdlun.inc"

      integer IP,NDAU,LSIZE,LS2,ND2,NL,I,ICHG
      integer LDTR(LSIZE)
      PARAMETER (LS2 = 2000)
      integer LD2(LS2)

      integer hepchg
      external hepchg

      NDAU = 0
C... first find all the descendants
      call STDDSCNDLST(IP,ND2,LS2,LD2)
      if(ND2.GT.0)then
c... now decide if they are stable and charged
        NL = MIN(LS2,ND2)
        do I=1,NL
          if(ISTHEP(LD2(I)).EQ.1)then
            ICHG = hepchg(IDHEP(LD2(I)))
            if(ICHG.NE.0)then
              NDAU = NDAU + 1
              if(NDAU.LE.LSIZE) LDTR(NDAU) = LD2(I)
            endif
          endif
        enddo
      endif
      if(NDAU.GT.LSIZE) write(lnhout,1001) NDAU,LSIZE
      return
1001  format(' STDCHGDSCLST: found ',I4,
     1        ' descendants, but the list only allows ',I4)
      end
