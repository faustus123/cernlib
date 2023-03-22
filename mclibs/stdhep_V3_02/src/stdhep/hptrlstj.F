      subroutine HPTRLSTJ
C
C    compare particle ID for jetset and standard
C
#include "stdlun.inc"
      integer ID1,ID2,IT1,IT2,ITT1,ITT2,ITMP
      integer lutran
      character*16 CNAM1,CNAM2
      character*20 HNAM1,HNAM2

C...special cases
      write(lnhout,1001)
      do 100 I=1,100
        ITMP=LUCOMP(I)
        if(ITMP.GT.0)then
          ID1=I
          IT1=lutran(ID1,1)
          ITT1=lutran(IT1,2)
          call LUNAME(ID1,CNAM1)
          call HEPNAM(IT1,HNAM1)
          ID2=-I
          IT2=lutran(ID2,1)
          if(IT1.EQ.0)then
            write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
          elseif(IT2.EQ.0)then
            write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
          else
            ITT2=lutran(IT2,2)
            call LUNAME(ID2,CNAM2)
            call HEPNAM(IT2,HNAM2)
            write(lnhout,1102) ID1,IT1,HNAM1,ITT1,CNAM1,
     1               ID2,IT2,HNAM2,ITT2,CNAM2
          endif
        endif
 100  CONTINUE
      do 150 J=11,50
        I=J*10
        ITMP=LUCOMP(I)
        if(ITMP.GT.0)then
          ID1=I
          IT1=lutran(ID1,1)
          ITT1=lutran(IT1,2)
          call LUNAME(ID1,CNAM1)
          call HEPNAM(IT1,HNAM1)
          ID2=-I
          IT2=lutran(ID2,1)
          if(IT1.EQ.0)then
            write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
          elseif(IT2.EQ.0)then
            write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
          else
            ITT2=lutran(IT2,2)
            call LUNAME(ID2,CNAM2)
            call HEPNAM(IT2,HNAM2)
            write(lnhout,1102) ID1,IT1,HNAM1,ITT1,CNAM1,
     1               ID2,IT2,HNAM2,ITT2,CNAM2
          endif
        endif
 150  CONTINUE
C...diquarks
      write(lnhout,1002)
      do 200 I=11,99
        do 190 J=1,10
          ID1=100*I+J-1
          ITMP=LUCOMP(ID1)
          if(ITMP.GT.0)then
            ID2=-ID1
            IT1=lutran(ID1,1)
            ITT1=lutran(IT1,2)
            call LUNAME(ID1,CNAM1)
            call HEPNAM(IT1,HNAM1)
            IT2=lutran(ID2,1)
            if(IT1.EQ.0)then
              write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
            elseif(IT2.EQ.0)then
              write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
            else
              ITT2=lutran(IT2,2)
              call LUNAME(ID2,CNAM2)
              call HEPNAM(IT2,HNAM2)
              write(lnhout,1102) ID1,IT1,HNAM1,ITT1,CNAM1,ID2,
     1                IT2,HNAM2,ITT2,CNAM2
            endif
          endif
 190    CONTINUE
 200  CONTINUE
C...mesons
      write(lnhout,1003)
      do 300 I=1,9
        do 290 J=1,9
          do 280 K=1,10
            do 270 L=1,10
              ID1=10000*(L-1)+100*I+10*J+K-1
              ITMP=LUCOMP(ID1)
              if(ITMP.GT.0)then
                ID2=-ID1
                IT1=lutran(ID1,1)
                ITT1=lutran(IT1,2)
                call LUNAME(ID1,CNAM1)
                call HEPNAM(IT1,HNAM1)
                IT2=lutran(ID2,1)
                if(IT1.EQ.0)then
                  write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
                elseif(IT2.EQ.0)then
                  write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
                else
                  ITT2=lutran(IT2,2)
                  call LUNAME(ID2,CNAM2)
                  call HEPNAM(IT2,HNAM2)
                  write(lnhout,1102) ID1,IT1,HNAM1,ITT1,CNAM1,
     1                   ID2,IT2,HNAM2,ITT2,CNAM2
                endif
              endif
 270        CONTINUE
 280      CONTINUE
 290    CONTINUE
 300  CONTINUE
C...baryons
      write(lnhout,1004)
      do 400 I=1,9
        do 390 J=1,9
          do 380 K=1,9
            do 370 L=1,10
              ID1=1000*I+100*J+10*K+L-1
              ITMP=LUCOMP(ID1)
              if(ITMP.GT.0)then
                ID2=-ID1
                IT1=lutran(ID1,1)
                ITT1=lutran(IT1,2)
                call LUNAME(ID1,CNAM1)
                call HEPNAM(IT1,HNAM1)
                IT2=lutran(ID2,1)
                if(IT1.EQ.0)then
                  write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
                elseif(IT2.EQ.0)then
                  write(lnhout,1101) ID1,IT1,HNAM1,ITT1,CNAM1
                else
                  ITT2=lutran(IT2,2)
                  call LUNAME(ID2,CNAM2)
                  call HEPNAM(IT2,HNAM2)
                  write(lnhout,1102) ID1,IT1,HNAM1,ITT1,CNAM1,
     1                      ID2,IT2,HNAM2,ITT2,CNAM2
                endif
              endif
 370        CONTINUE
 380      CONTINUE
 390    CONTINUE
 400  CONTINUE
      return
 1001 format(//5X,'Special Cases'/4X,'IJET',4X,'ISTD  HNAM',15X,
     1     'IJET  JNAME',13X,'IJET',4X,'ISTD  HNAM',15X,'IJET  JNAME')
 1002 format(//5X,'Diquarks'/4X,'IJET',4X,'ISTD  HNAM',15X,
     1     'IJET  JNAME',13X,'IJET',4X,'ISTD  HNAM',15X,'IJET  JNAME')
 1003 format(//5X,'Mesons'/4X,'IJET',4X,'ISTD  HNAM',15X,'IJET  JNAME',
     1     13X,'IJET',4X,'ISTD  HNAM',15X,'IJET  JNAME')
 1004 format(//5X,'Baryons'/4X,'IJET',4X,'ISTD  HNAM',15X,'IJET  JNAME',
     1     13X,'IJET',4X,'ISTD  HNAM',15X,'IJET  JNAME')
 1101 format(1X,I7,1X,I7,2X,A15,1X,I7,2X,A15)
 1102 format(1X,I7,1X,I7,2X,A15,1X,I7,2X,A15,
     1          I7,1X,I7,2X,A15,1X,I7,2X,A15)
      end
