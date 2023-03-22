
      integer function lutran(ID,mconv)
C...convert (mconv=1) from JETSET numbering scheme to PDG numbering scheme
C...     or (mconv=2) from PDG numbering scheme to JETSET numbering scheme
C
C           ID = particle identification number

C... ITABJ(I) converts miscellaneous JETSET particle ID's to a standard scheme
C...      only 31-40 change
      integer ITABJ(99,2), NOANT(11)
      data ITABJ/1,2,3,4,5,6,7,8,0,0,
     1           11,12,13,14,15,16,17,18,0,0,
     2           21,22,23,24,25,0,0,19,20,0,
     3           0,30,35,31,32,36,33,27,28,29,
     4           0,0,0,0,0,0,0,0,0,0,
     5           0,0,0,0,0,0,0,0,0,0,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,0,
     8           81,82,83,84,85,86,87,88,89,90,
     9           91,92,93,94,95,96,97,98,99,
     *           1,2,3,4,5,6,7,8,0,0,
     1           11,12,13,14,15,16,17,18,28,29,
     2           21,22,23,24,25,0,38,39,40,32,
     3           34,35,37,0,33,36,0,0,0,0,
     4           0,0,0,0,0,0,0,0,0,0,
     5           0,0,0,0,0,0,0,0,0,0,
     6           0,0,0,0,0,0,0,0,0,0,
     7           0,0,0,0,0,0,0,0,0,0,
     8           81,82,83,84,85,86,87,88,89,90,
     9           91,92,93,94,95,96,97,98,99/
      data NOANT/-21,-22,-23,-25,-27,-30,-35,-32,-36,-81,-83/
      save ITABJ,NOANT

      lutran=ID
      IDA=IABS(ID)
      J1=MOD(IDA,10)
      I1=MOD(IDA/10,10)
      I2=MOD(IDA/100,10)
      I3=MOD(IDA/1000,10)
      I4=MOD(IDA/10000,10)
      KQN=MOD(IDA/1000000000,10)

      if(IDA.EQ.0)then
        call LUERRM(8,'(LUTRAN 1:) particle ID is zero')
      elseif(mconv.LT.1 .OR. mconv.GT.2)then
        lutran=0
        call LUERRM(8,'(LUTRAN 2:) unallowed conversion option')
C... ions not allowed
      elseif(KQN.eq.1) then
        lutran=0
        call LUERRM(8,'(LUTRAN 3:) unallowed ion')
C...Higgs, etc.
      elseif(IDA.LT.100)then
        lutran=isign(ITABJ(IDA,mconv),ID)
C...check for illegal antiparticles
        if(ID.LT.0)then
          if(lutran.GE.-99 .AND. lutran.LE.-91) lutran=0
          do 101 J=1,11
            if(lutran.EQ.NOANT(J)) lutran=0
 101      CONTINUE
        endif
C...spin 1/2 baryons
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.2)then
C...spin 3/2 baryons
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.4)then
C...special case "baryons"
      elseif(I1.NE.0 .AND. I3.NE.0 .AND. J1.EQ.0)then
C...mesons (only 1 difference)
      elseif(I1.NE.0 .AND. I2.NE.0 .AND. I3.EQ.0)then
        if(mconv.EQ.1)then
          if(IDA.EQ.20333) lutran=isign(40333,ID)
        elseif(mconv.EQ.2) then
          if(IDA.EQ.20333)then
            lutran=0
          elseif(IDA.EQ.40333)then
            lutran=isign(20333,ID)
          endif
        endif
C...check for illegal antiparticles
        if(I1.EQ.I2 .AND. ID.LT.0) lutran=0
C...diquarks
      elseif(I2.NE.0 .AND. I3.NE.0 .AND. I1.EQ.0)then
C...undefined
      else
        lutran=0
      endif
C...check for illegal anti KS, KL, or diffractive "particle"
      if(ID.EQ.-130 .OR. ID.EQ.-310 .OR. ID.EQ.-110) lutran=0
      if(ID.EQ.-220 .OR. ID.EQ.-330 .OR. ID.EQ.-440) lutran=0

      if(lutran.EQ.0)
     1   call LUERRM(8,'(LUTRAN 3:) particle ID translation is zero')
      return
      end
