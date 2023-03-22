
      integer function hwtran(ID,mconv)
C...convert (mconv=1) from HERWIG numbering scheme to PDG numbering scheme
C...     or (mconv=2) from PDG numbering scheme to HERWIG numbering scheme
C
C           ID = particle identification number

#include "stdlun.inc"
C... ITABJ(I) converts miscellaneous HERWIG particle ID's to a standard scheme
      integer ITABJ(99,2), NOANT(4)
      data ITABJ/1,2,3,4,5,6,7,8,0,0,
     1           11,12,13,14,15,16,0,0,0,0,
     2           21,22,23,24,25,0,0,0,0,0,
     3           0,30,0,0,0,0,0,0,0,0,
     4           0,0,0,0,0,0,0,0,0,0,
     5           0,0,0,0,0,0,0,0,0,0,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,0,
     8           81,82,83,84,85,86,87,88,89,90,
     9           91,92,93,94,95,96,97,98,99,
     *           1,2,3,4,5,6,7,8,0,0,
     1           11,12,13,14,15,16,0,0,0,0,
     2           21,22,23,24,25,0,0,0,0,32,
     3           0,0,0,0,0,0,0,0,0,0,
     4           0,0,0,0,0,0,0,0,0,0,
     5           0,0,0,0,0,0,0,0,0,0,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,0,
     8           81,82,83,84,85,86,87,88,89,90,
     9           91,92,93,94,95,96,97,98,99/
      data NOANT/-21,-22,-23,-25/
      save ITABJ,NOANT

      hwtran=ID
      IDA=IABS(ID)
      J1=MOD(IDA,10)
      I1=MOD(IDA/10,10)
      I2=MOD(IDA/100,10)
      I3=MOD(IDA/1000,10)
      I4=MOD(IDA/10000,10)
      KQN=MOD(IDA/1000000000,10)

      if(IDA.EQ.0)then
C..        write(lnhout,*) ' HWTRAN 1: particle ID is zero'
      elseif(mconv.LT.1 .OR. mconv.GT.2)then
        hwtran=0
        write(lnhout,*) ' HWTRAN 2: unallowed conversion option'
      elseif(KQN.eq.1) then
C... ions not recognized
        hwtran=0
        write(lnhout,*) ' HWTRAN 3: nonallowed ion'
      elseif(IDA.LT.100)then
C...Higgs, etc.
        hwtran=isign(ITABJ(IDA,mconv),ID)
C...check for illegal antiparticles
        if(ID.LT.0)then
          if(hwtran.GE.-99 .AND. hwtran.LE.-81) hwtran=0
          do 101 J=1,4
            if(hwtran.EQ.NOANT(J)) hwtran=0
 101      CONTINUE
        endif
      elseif(I1.EQ.9 .AND. I2.EQ.9 .AND. I3.EQ.9 .and. I4.eq.0)then
C... special case remnant particles - used internally
        if(J1.lt.8) hwtran = 0
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.2)then
C...spin 1/2 baryons
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.4)then
C...spin 3/2 baryons
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.0)then
C...special case "baryons"
      elseif(I1.NE.0 .AND. I2.NE.0 .AND. I3.EQ.0)then
C...mesons 
        if(mconv.EQ.1)then
          if(IDA.EQ.20413) hwtran=isign(10413,ID)
          if(IDA.EQ.20423) hwtran=isign(10423,ID)
          if(IDA.EQ.20433) hwtran=isign(10433,ID)
          if(IDA.EQ.20443) hwtran=isign(30443,ID)
          if(IDA.EQ.30443) hwtran=isign(40443,ID)
        elseif(mconv.EQ.2) then
          if(IDA.EQ.10413) hwtran=isign(20413,ID)
          if(IDA.EQ.10423) hwtran=isign(20423,ID)
          if(IDA.EQ.10433) hwtran=isign(20433,ID)
          if(IDA.EQ.30443) hwtran=isign(20443,ID)
          if(IDA.EQ.40443) hwtran=isign(30443,ID)
          if(IDA.EQ.20413) hwtran=0
          if(IDA.EQ.20423) hwtran=0
          if(IDA.EQ.20433) hwtran=0
C...all 3 chi c states map to a single chi c state
          if(IDA.EQ.20443) hwtran=10441
          if(IDA.EQ.445) hwtran=10441
        endif
C...check for illegal antiparticles
        if(I1.EQ.I2 .AND. ID.LT.0) hwtran=0
      elseif(I2.NE.0 .AND. I3.NE.0 .AND. I1.EQ.0)then
C...diquarks
      else
C...undefined
        hwtran=0
      endif
C...check for illegal anti KS, KL
      if(ID.EQ.-130 .OR. ID.EQ.-310) hwtran=0

      if(hwtran.EQ.0 .AND. IDA.NE.0)then
        if(mconv.EQ.1) write(lnhout,111) ID
        if(mconv.EQ.2) write(lnhout,112) ID
      endif
 111  format('  HWTRAN 3: HERWIG particle ',I8,' translates to zero')
 112  format('  HWTRAN 3: PDG particle ',I8,' translates to zero')
      return
      end
