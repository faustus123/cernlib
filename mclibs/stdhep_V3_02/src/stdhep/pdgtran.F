      integer function pdgtran(ID,mconv)
C...convert (mconv=1) from PDG92 numbering scheme to STD numbering scheme
C...     or (mconv=2) from STD numbering scheme to PDG92 numbering scheme
C
C           ID = particle identification number

#include "stdlun.inc"
C... ITABJ(I) converts miscellaneous PDG92 particle ID's to a standard scheme
      integer ITABJ(99,2), NOANT(6,2)

      data ITABJ/1,2,3,4,5,6,7,8,0,0,
     1           11,12,13,14,15,16,0,0,0,0,
     2           21,22,23,24,25,0,0,0,0,0,
     3           0,0,0,0,32,36,33,0,0,0,
     4           0,0,0,0,0,0,0,0,0,0,
     5           0,0,0,0,0,0,0,0,0,0,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,0,
     8           81,82,83,84,85,86,87,88,89,90,
     9           91,92,93,94,95,96,97,98,99,
     *           1,2,3,4,5,6,7,8,0,0,
     1           11,12,13,14,15,16,0,0,0,0,
     2           21,22,23,24,25,0,0,0,0,0,
     3           0,35,37,0,0,36,0,0,0,0,
     4           0,0,0,0,0,0,0,0,0,0,
     5           0,0,0,0,0,0,0,0,0,0,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,0,
     8           81,82,83,84,85,86,87,88,89,90,
     9           91,92,93,94,95,96,97,98,99/
      data NOANT/-21,-22,-23,-25,-32,-36,-21,-22,-23,-25,-35,-36/
      save ITABJ,NOANT

      pdgtran=ID
      IDA=IABS(ID)
      J1=MOD(IDA,10)
      I1=MOD(IDA/10,10)
      I2=MOD(IDA/100,10)
      I3=MOD(IDA/1000,10)
      I4=MOD(IDA/10000,10)
      KQN=MOD(IDA/1000000000,10)

      if(IDA.EQ.0)then
C..        write(lnhout,*) ' PDGTRAN 1: particle ID is zero'
      elseif(mconv.LT.1 .OR. mconv.GT.2)then
        pdgtran=0
        write(lnhout,*) ' PDGTRAN 2: unallowed conversion option'
C... ions not allowed
      elseif(KQN.eq.1) then
        pdgtran=0
        write(lnhout,*) ' PDGTRAN 3: unallowed ion'
      elseif(IDA.LT.100)then
C...Higgs, etc.
        pdgtran=isign(ITABJ(IDA,mconv),ID)
C...check for illegal antiparticles
        if(ID.LT.0)then
          if(pdgtran.GE.-99 .AND. pdgtran.LE.-81) pdgtran = 0
          do 101 J=1,6
            if(pdgtran.EQ.NOANT(J,mconv)) pdgtran = 0
 101      CONTINUE
        endif
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.2)then
C...spin 1/2 baryons
C...no excited baryon states
        if(mconv.EQ.1)then
          if(I4.NE.0) pdgtran = 0
          if(I3.EQ.1) pdgtran = 0
          if(I3.EQ.2 .AND. I2.EQ.1 .AND. I1.EQ.2) pdgtran = 0
          if(I3.EQ.2 .AND. I2.EQ.2 .AND. I1.EQ.2) pdgtran = 0
        endif
        if(I3.EQ.4 .AND. I2.EQ.3 .AND. I1.LE.2)then
          pdgtran = 1000*I3+I1*100+I2*10+J1
        endif
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.4)then
C...spin 3/2 baryons
C...no excited baryon states
        if(mconv.EQ.1)then
          if(I4.NE.0) pdgtran = 0
          if(I3.GE.3 .AND. I2.EQ.1 .AND. I1.EQ.2) pdgtran = 0
          if(I3.EQ.1 .AND. I2.EQ.2 .AND. I1.EQ.1) pdgtran = 0
          if(I3.EQ.2 .AND. I2.EQ.1 .AND. I1.EQ.2) pdgtran = 0
        endif
      elseif(I1.NE.0 .AND. I2.NE.0 .AND. I3.EQ.0)then
C...mesons 
        if(mconv.EQ.1)then
          if(IDA.EQ.30113) pdgtran=isign(40113,ID)
          if(IDA.EQ.30213) pdgtran=isign(40213,ID)
          if(IDA.EQ.40113) pdgtran=isign(30113,ID)
          if(IDA.EQ.40213) pdgtran=isign(30213,ID)
          if(IDA.EQ.30223) pdgtran=isign(40223,ID)
          if(IDA.EQ.40223) pdgtran=isign(50223,ID)
          if(IDA.EQ.50223) pdgtran=isign(30223,ID)
          if(IDA.EQ.10333) pdgtran=isign(30333,ID)
          if(IDA.EQ.10443) pdgtran=isign(20443,ID)
          if(IDA.EQ.20443) pdgtran=isign(30443,ID)
          if(IDA.EQ.30443) pdgtran=isign(40443,ID)
          if(IDA.EQ.40443) pdgtran=isign(50443,ID)
          if(IDA.EQ.50443) pdgtran=isign(60443,ID)
          if(IDA.EQ.60443) pdgtran=isign(70443,ID)
          if(IDA.EQ.551)   pdgtran=isign(10551,ID)
          if(IDA.EQ.10551) pdgtran=isign(30551,ID)
          if(IDA.EQ.10553) pdgtran=isign(20553,ID)
          if(IDA.EQ.20553) pdgtran=isign(30553,ID)
          if(IDA.EQ.30553) pdgtran=isign(60553,ID)
          if(IDA.EQ.40553) pdgtran=isign(70553,ID)
          if(IDA.EQ.50553) pdgtran=isign(80553,ID)
          if(IDA.EQ.60553) pdgtran=isign(90553,ID)
          if(IDA.EQ.70553) pdgtran=isign(50553,ID)
        elseif(mconv.EQ.2) then
          if(IDA.EQ.40113) pdgtran=isign(30113,ID)
          if(IDA.EQ.40213) pdgtran=isign(30213,ID)
          if(IDA.EQ.30113) pdgtran=isign(40113,ID)
          if(IDA.EQ.30213) pdgtran=isign(40213,ID)
          if(IDA.EQ.40223) pdgtran=isign(30223,ID)
          if(IDA.EQ.50223) pdgtran=isign(40223,ID)
          if(IDA.EQ.30223) pdgtran=isign(50223,ID)
          if(IDA.EQ.30333) pdgtran=isign(10333,ID)
          if(IDA.EQ.20443) pdgtran=isign(10443,ID)
          if(IDA.EQ.30443) pdgtran=isign(20443,ID)
          if(IDA.EQ.40443) pdgtran=isign(30443,ID)
          if(IDA.EQ.50443) pdgtran=isign(40443,ID)
          if(IDA.EQ.60443) pdgtran=isign(50443,ID)
          if(IDA.EQ.70443) pdgtran=isign(60443,ID)
          if(IDA.EQ.10551) pdgtran=isign(551,ID)
          if(IDA.EQ.30551) pdgtran=isign(10551,ID)
          if(IDA.EQ.20553) pdgtran=isign(10553,ID)
          if(IDA.EQ.30553) pdgtran=isign(20553,ID)
          if(IDA.EQ.60553) pdgtran=isign(30553,ID)
          if(IDA.EQ.70553) pdgtran=isign(40553,ID)
          if(IDA.EQ.80553) pdgtran=isign(50553,ID)
          if(IDA.EQ.90553) pdgtran=isign(60553,ID)
          if(IDA.EQ.50553) pdgtran=isign(70553,ID)
        endif
C...check for illegal antiparticles
        if(I1.EQ.I2 .AND. ID.LT.0) pdgtran=0
      elseif(I2.NE.0 .AND. I3.NE.0 .AND. I1.EQ.0)then
C...diquarks
      else
C...undefined
        pdgtran=0
      endif
C...check for illegal anti KS, KL
      if(ID.EQ.-130 .OR. ID.EQ.-310) pdgtran=0
#ifdef HEPDBG
C...there are too many warnings - use only for debugging purposes
      if(pdgtran.EQ.0 .AND. IDA.NE.0)then
        if(mconv.EQ.1) write(lnhout,111) ID
        if(mconv.EQ.2) write(lnhout,112) ID
      endif
#endif
      return
 111  format('  PDGTRAN 3: PDG92 particle ',I8,' translates to zero')
 112  format('  PDGTRAN 3: STD particle ',I8,' translates to zero')
      end
