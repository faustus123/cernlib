
      integer function istran(ID,mconv)
C...convert (mconv=1) from ISAJET numbering scheme to PDG numbering scheme
C...     or (mconv=2) from PDG numbering scheme to ISAJET numbering scheme
C...called by ISAHEP
C
C           ID = particle identification number

#include "itapes.inc"

C... ITABI(I) converts miscellaneous ISAJET particle ID's to a standard scheme
      integer ITABI(99,2), NOANT(15)
      data ITABI/2,1,3,4,5,6,7,8,21,22,
     1           12,11,14,13,16,15,0,0,0,310,
     2           42,41,43,44,45,46,0,0,47,67,
     3           52,51,54,53,56,55,0,0,77,68,
     4           62,61,63,64,65,66,0,0,78,69,
     5           72,71,74,73,76,75,0,0,0,70,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,24,
     8           25,57,58,59,40,33,37,34,38,23,
     9           0,0,0,0,0,0,0,0,0,
     *           2,1,3,4,5,6,7,8,0,0,
     1           12,11,14,13,16,15,0,0,0,0,
     2           9,10,90,80,81,0,0,0,0,0,
     3           0,82,86,88,0,83,87,89,84,85,
     4           22,21,23,24,25,26,29,0,0,0,
     5           32,31,34,33,36,35,82,83,84,0,
     6           42,41,43,44,45,46,30,40,50,60,
     7           52,51,54,53,56,55,39,49,0,0,
     8           0,0,0,0,0,0,0,0,0,0,
     9           0,0,0,0,0,0,0,0,0/
      data NOANT/-21,-22,-23,-25,-30,-35,-47,-48,-57,-58,-59,
     1           -67,-68,-69,-70/
      save ITABI,NOANT

      IDA=IABS(ID)
      istran=0
      if(mconv.NE.1) GO TO 200
C...ISAJET algorithm routine
      call FLAVOR(ID,if1,if2,if3,JS,IND)
      if(IDA.EQ.0)then
        write(ITLIS,*) ' ISTRAN: particle ID is zero'
      elseif(IDA.LT.100)then
        istran=isign(ITABI(IDA,1),ID)
        if(ID.EQ.-20) istran=130
C...check for illegal antiparticles
        ITMP=istran
        if(ITMP.LT.0)then
          do 101 J=1,15
            if(ITMP.EQ.NOANT(J)) istran=0
 101      CONTINUE
        endif
      elseif(IND.NE.0)then
        IS1=IABS(if1)
        IS2=IABS(if2)
        IS3=IABS(if3)
C...mesons
        if(IS1.EQ.0)then
          if(IS2.LE.2 .AND. IS3.LE.2)then
C...         don't change
          else
C...         u and d have opposite definitions
            if(IS2.LE.2) IS2=ITABI(IS2,1)
            if(IS3.LE.2) IS3=ITABI(IS3,1)
          endif
          istran=IS3*100 + IS2*10 + 2*JS+1
          istran=isign(istran,ID)
C...         charmed and top mesons have wrong sign
          if(IS3.EQ.4 .AND. IS2.NE.4) istran=-istran
          if(IS3.EQ.6 .AND. IS2.NE.6 .AND. IS2.NE.4) istran=-istran
C...check for illegal antiparticles
          if(IS2.EQ.IS3 .AND. ID.LT.0) istran=0
C...diquarks
        elseif(IS3.EQ.0)then
C...         u and d have opposite definitions
          if(IS1.LE.2) IS1=ITABI(IS1,1)
          if(IS2.LE.2) IS2=ITABI(IS2,1)
          if(IS2.LT.IS1)then
            istran=IS1*1000 + IS2*100 + 2*JS+1
          else
            istran=IS2*1000 + IS1*100 + 2*JS+1
          endif
          istran=isign(istran,ID)
C...         charmed and top mesons have wrong sign
          if(IS2.EQ.4 .AND. IS1.NE.4) istran=-istran
          if(IS2.EQ.6 .AND. IS1.NE.6 .AND. IS1.NE.4) istran=-istran
C...baryons
        else
C...         u and d have opposite definitions
          if(IS1.LE.2) IS1=ITABI(IS1,1)
          if(IS2.LE.2) IS2=ITABI(IS2,1)
          if(IS3.LE.2) IS3=ITABI(IS3,1)
          if(IS3.LE.2)then
            istran=IS1*1000 + IS2*100 + IS3*10 + 2*JS+2
          elseif(IS1.LE.2 .AND. IS2.LE.2)then
            istran=IS3*1000 + IS1*100 + IS2*10 + 2*JS+2
          else
            istran=IS3*1000 + IS2*100 + IS1*10 + 2*JS+2
          endif
          istran=isign(istran,ID)
        endif
      endif
      GO TO 300

 200  if(mconv.NE.2) GO TO 300
      J1=MOD(IDA,10)
      I1=MOD(IDA/10,10)
      I2=MOD(IDA/100,10)
      I3=MOD(IDA/1000,10)
      I4=MOD(IDA/10000,10)
      KQN=MOD(IDA/1000000000,10)
      if(IDA.EQ.0)then
        write(ITLIS,*) ' ISTRAN: particle ID is zero'
C... ion
      elseif(KQN.eq.1) then
        write(ITLIS,*) ' ISTRAN 2: ion is not allowed'
C...elementary particles
      elseif(IDA.LT.100)then
        istran=isign(ITABI(IDA,2),ID)
C...check for illegal antiparticles
        if(ID.LT.0)then
          do 201 J=1,15
            if(ID.EQ.NOANT(J)) istran=0
 201      CONTINUE
        endif
C...K short and K long
      elseif(ID.EQ.130)then
        istran=-20
      elseif(ID.EQ.310)then
        istran=20
C...Isajet has no "excited" states
      elseif(I4.NE.0)then
        istran=0
C...mesons
      elseif(I3.EQ.0)then
          if(I1.LE.2 .AND. I2.LE.2)then
C...         don't change
          else
C...         u and d have opposite definitions
            if(I1.LE.2) I1=ITABI(I1,2)
            if(I2.LE.2) I2=ITABI(I2,2)
          endif
          istran=I1*100 + I2*10 + (J1-1)/2
          istran=isign(istran,ID)
C...         charmed and top mesons have wrong sign
          if(I2.EQ.4 .AND. I1.NE.4) istran=-istran
          if(I2.EQ.6 .AND. I1.NE.6 .AND. I1.NE.4) istran=-istran
C...check for illegal antiparticles
          if(I2.EQ.I1 .AND. ID.LT.0) istran=0
C...diquarks
      elseif(I1.EQ.0)then
C...         u and d have opposite definitions
          if(I3.LE.2) I3=ITABI(I3,2)
          if(I2.LE.2) I2=ITABI(I2,2)
          if(I3.LT.I2)then
            istran=I3*1000 + I2*100 + (J1-1)/2
          else
            istran=I2*1000 + I3*100 + (J1-1)/2
          endif
          istran=isign(istran,ID)
C...         charmed and top mesons have wrong sign
          if(I2.EQ.4 .AND. I3.NE.4) istran=-istran
          if(I2.EQ.6 .AND. I3.NE.6 .AND. I3.NE.4) istran=-istran
C...baryons
      else
C...         u and d have opposite definitions
          if(I3.LE.2) I3=ITABI(I3,2)
          if(I2.LE.2) I2=ITABI(I2,2)
          if(I1.LE.2) I1=ITABI(I1,2)
          if(I3.LE.2)then
            istran=I3*1000 + I2*100 + I1*10 + (J1-2)/2
          elseif(I1.LE.2 .AND. I2.LE.2)then
            istran=I2*1000 + I1*100 + I3*10 + (J1-2)/2
          else
            istran=I1*1000 + I2*100 + I3*10 + (J1-2)/2
          endif
          istran=isign(istran,ID)
      endif

 300  return
      end
