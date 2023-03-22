C -------------------------------------------------------------
C
      integer NNQ
C... STDHEP has 75,002 words
      parameter (NNQ=200000)
      common/HEPZEB/HPXSTR,HPXDCY,HPXEVT,FENCE(8),LZSTOR(NNQ)
      common/HEPLNK/LDCY,LE1,LE2,LE3,LE4,LE5
      integer HPXSTR,HPXDCY,HPXEVT,FENCE,LZSTOR
      integer LDCY,LE1,LE2,LE3,LE4,LE5
      real Q(NNQ)
      integer IQ(NNQ),LQ(NNQ)
      equivalence (LZSTOR(1),LQ(1)),(LQ(9),IQ(1),Q(1))
C
