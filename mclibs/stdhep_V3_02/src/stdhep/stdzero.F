
      subroutine STDZERO

C...Purpose: to zero the standard common block.
C
#include "stdhep.inc"

      integer J,K

C...set everything to zero
      NHEP = 0
      nmulti = 0
      do 120 J=1,NMXHEP
        ISTHEP(J)=0
        IDHEP(J)=0
        jmulti(J)=0
        do 100 K=1,2
          JMOHEP(K,J)=0
  100     JDAHEP(K,J)=0
        do 105 K=1,5
  105     PHEP(K,J)=0.
        do 110 K=1,4
  110     VHEP(K,J)=0.
  120 CONTINUE
      return
      end
