
      subroutine STDQUARKLST(IQ,NQRK,LSIZE,LQRK)

C...Search the HEPEVT common block for all mesons and baryons with
C...quark content IQ
C
C     IQ  = quark type
C     NQRK = number of particles with quark type IQ
C     LQRK(LSIZE) = list of particles with quark type IQ

      IMPLICIT NONE

      integer IQ,NQRK,LSIZE
      integer LQRK(LSIZE)

#include "stdhep.inc"
#include "stdlun.inc"

      integer I,KQ,KQA,KQ1,KQ2,KQ3,KQX,KQJ

      NQRK = 0
      do I=1,NHEP
        KQ=IDHEP(I)
        KQA=IABS(KQ)

        if(KQA.GT.99.AND.KQA.LT.100000) then
C...Subdivide standard ID code into constituent pieces.
          call STDQUARKS(I,KQ1,KQ2,KQ3,KQX,KQJ)
          if(KQ1.EQ.IQ .OR. KQ2.EQ.IQ .OR. KQ3.EQ.IQ)then
            NQRK = NQRK + 1
            if(NQRK.LE.LSIZE) LQRK(NQRK) = I
          endif
        endif
      enddo
      if(NQRK.GT.LSIZE) write(lnhout,1001) NQRK,LSIZE
      return
1001  format(' STDQUARKLST: found ',I4,
     1        ' particles, but the list only allows ',I4)
      end
