
      subroutine HPZFLC
C
C...fill HEPEVT from zebra banks
C
      IMPLICIT NONE
#include "stdhep.inc"
#include "stdlun.inc"
#include "hepzbr.inc"

      integer I,J,K,LL,KK

C...set everything to zero
      NEVHEP = 0
      NHEP = 0
      do 120 J=1,NMXHEP
        ISTHEP(J)=0
        IDHEP(J)=0
        do 100 K=1,2
          JMOHEP(K,J)=0
  100     JDAHEP(K,J)=0
        do 105 K=1,5
  105     PHEP(K,J)=0.
        do 110 K=1,4
  110     VHEP(K,J)=0.
  120 CONTINUE

C...unpack and fill HEPEVT
      NEVHEP=IQ(LE1+1)
      NHEP=IQ(LE1+2)
      if(NHEP.GT.0)then
        do 200 I=1,NHEP
          LL=LQ(LE1-1)
          ISTHEP(I)=IQ(LL+I)
          LL=LQ(LE1-2)
          IDHEP(I)=IQ(LL+I)
          LL=LQ(LE1-3)
          JMOHEP(1,I)=IQ(LL+I)
          JMOHEP(2,I)=IQ(LL+NHEP+I)
          LL=LQ(LE1-4)
          JDAHEP(1,I)=IQ(LL+I)
          JDAHEP(2,I)=IQ(LL+NHEP+I)
          LL=LQ(LE1-5)
          do 170 K=1,5
            KK=LL+NHEP*(K-1)+I
 170        PHEP(K,I)=Q(KK)
          LL=LQ(LE1-6)
          do 180 K=1,4
            KK=LL+NHEP*(K-1)+I
 180        VHEP(K,I)=Q(KK)
 200    CONTINUE
      endif
      return
      end
