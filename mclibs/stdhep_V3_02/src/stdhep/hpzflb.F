
      subroutine HPZFLB
C
C  create and fill zebra data banks
C
      IMPLICIT NONE
#include "stdhep.inc"
#include "stdlun.inc"
#include "hepzbr.inc"

      integer I,K,LL,KK
C
C...start by wiping the division
      call MZWIPE(HPXEVT)
C...declare bank
      call MZBOOK(HPXEVT,LE1,LE1,1,'EVT',6,6,2,2,0)
      IQ(LE1+1)=NEVHEP
      IQ(LE1+2)=NHEP
      call MZBOOK(HPXEVT,LL,LE1,-1,'ISTA',0,0,NHEP,2,0)
      call MZBOOK(HPXEVT,LL,LE1,-2,'IDA',0,0,NHEP,2,0)
      call MZBOOK(HPXEVT,LL,LE1,-3,'JMOA',0,0,2*NHEP,2,0)
      call MZBOOK(HPXEVT,LL,LE1,-4,'JDAA',0,0,2*NHEP,2,0)
      call MZBOOK(HPXEVT,LL,LE1,-5,'PA',0,0,5*NHEP,3,0)
      call MZBOOK(HPXEVT,LL,LE1,-6,'VA',0,0,4*NHEP,3,0)
    
      do 200 I=1,NHEP
        LL=LQ(LE1-1)
        IQ(LL+I)=ISTHEP(I)
        LL=LQ(LE1-2)
        IQ(LL+I)=IDHEP(I)
        LL=LQ(LE1-3)
        IQ(LL+I)=JMOHEP(1,I)
        IQ(LL+NHEP+I)=JMOHEP(2,I)
        LL=LQ(LE1-4)
        IQ(LL+I)=JDAHEP(1,I)
        IQ(LL+NHEP+I)=JDAHEP(2,I)
        LL=LQ(LE1-5)
        do 130 K=1,5
          KK=LL+NHEP*(K-1)+I
 130      Q(KK)=PHEP(K,I)
        LL=LQ(LE1-6)
        do 140 K=1,4
          KK=LL+NHEP*(K-1)+I
 140      Q(KK)=VHEP(K,I)
 200  CONTINUE

      return
      end
