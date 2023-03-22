
      subroutine STDQUARKCNT(IT,IQ,IRET,IPAR)

C...Find out if particle IT or any of it's parents contain quark IQ
C...    IT = index to HEPEVT common block
C...    IQ = quark type 
C
C...        IRET = 0        no match
C...        IRET = 1        this particle contains quark IQ
C...        IRET = 2        parent IPAR contains quark IQ
C...        IPAR = 0 unless IRET = 2

      IMPLICIT NONE

      integer IQ,IRET,IPAR,NPR,LSZ,I
      integer IT,KQX,KQ3,KQ2,KQ1,KQJ
      
      PARAMETER (LSZ=500)
      integer LPR(LSZ)

#include "stdhep.inc"
#include "stdlun.inc"

      IRET = 0
      IPAR = 0
C...Subdivide standard ID code into constituent pieces.
      call STDQUARKS(IT,KQ1,KQ2,KQ3,KQX,KQJ)
      if(KQ1.EQ.IQ .OR. KQ2.EQ.IQ .OR. KQ3.EQ.IQ) then
        IRET = 1
      else
C... search the parent list
        call STDPARENTLST(IT,NPR,LSZ,LPR)
        do I=1,NPR
          call STDQUARKS(LPR(I),KQ1,KQ2,KQ3,KQX,KQJ)
          if(KQ1.EQ.IQ .OR. KQ2.EQ.IQ .OR. KQ3.EQ.IQ) then
            IRET = 2
            IPAR = LPR(I)
          endif
        enddo
      endif
      return
      end
