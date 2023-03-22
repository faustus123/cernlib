      subroutine STDQUARKS(IT,KQ1,KQ2,KQ3,KQX,KQJ)

C...Get constituent quarks of this particle
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

      KQ=IDHEP(IT)
      KQA=IABS(KQ)
      KQX=MOD(KQA/10000,10)
      KQ3=MOD(KQA/1000,10)
      KQ2=MOD(KQA/100,10)
      KQ1=MOD(KQA/10,10)
      KQJ=MOD(KQA,10)
      return
      end
