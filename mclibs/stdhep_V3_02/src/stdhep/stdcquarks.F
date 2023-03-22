
      subroutine STDCQUARKS(IT,KQ1,KQ2,KQ3,KQX,KQJ)

C...Get signed constituent quarks of this particle
C
C      IT = index to HEPEVT common block
C      For particle ID, +/- IJKLM
C            KQX = I = to differentiate otherwise identically named particles
C            KQ3 = J = quark
C            KQ2 = K = quark
C            KQ1 = L = quark
C            KQJ = M = 2*Jspin + 1

      IMPLICIT NONE

      integer IT,KQ,KQA,KQX,KQ3,KQ2,KQ1,KQJ

#include "stdhep.inc"

      call STDQUARKS(IT,KQ1,KQ2,KQ3,KQX,KQJ)
      KQ=IDHEP(IT)
      KQA=IABS(KQ)

C...Simple cases: direct translation or special codes.
      if(KQA.EQ.0.OR.KQA.GE.100000) then
C... illegal
      elseif(KQA.LE.100) then
C... illegal
      elseif(KQJ.EQ.0) then
C... KS, KL, jetset diffr particles and undefined
        if(KQA.EQ.130 .OR. KQA.EQ.310)then
          KQ2 = SIGN(KQ2,KQ)
        elseif(KQA.EQ.110 .OR. KQA.EQ.210 .OR. KQA.EQ.220
     1         .OR. KQA.EQ.330 .OR. KQA.EQ.440)then
          KQ1 = SIGN(KQ1,KQ)
        elseif(KQA.EQ.2110 .OR. KQA.EQ.2210)then
          KQ1 = SIGN(KQ1,KQ)
          KQ2 = SIGN(KQ2,KQ)
          KQ3 = SIGN(KQ3,KQ)
        endif

C...Construction from quark content for heavy meson, diquark, baryon.
      elseif(KQ3.EQ.0) then
        if(KQ2.EQ.3 .OR. KQ2.EQ.5)then
C...Strange and beauty mesons.
          KQ2 = SIGN(KQ2,KQ)
        else
C...All other mesons
          KQ1 = SIGN(KQ1,KQ)
        endif
      elseif(KQ1.EQ.0) then
C...Diquarks.
        KQ2 = SIGN(KQ2,KQ)
        KQ3 = SIGN(KQ3,KQ)
      else
C...Baryons
        KQ1 = SIGN(KQ1,KQ)
        KQ2 = SIGN(KQ2,KQ)
        KQ3 = SIGN(KQ3,KQ)
      endif

      return
      end
