      subroutine HPTRLSTI

C...writes a table of corresponding ISAJET and STDHEP particle ID's

#include "stdlun.inc"
      integer I,ifL1,ifL2,ifL3,JSPIN,IDEX
      integer ID1,ID2,IT1,IT2,ITT1,ITT2,istran
      character*8 LB1,LB2,LABEL
      character*20 HNAM1,HNAM2

      write(lnhout,101)
      write(lnhout,102)
      do 200 I=1,10000
        ID1 = I
        ID2=-ID1
        call FLAVOR(ID1,ifL1,ifL2,ifL3,JSPIN,IDEX)
        if(I.EQ.100) write(lnhout,103)
        if(I.EQ.1000) write(lnhout,104)
        if(IDEX.GT.0)then
          LB1 = LABEL(ID1)
          if(LB1.NE.'LERR' .AND. LB1.NE.'ERR')then
            IT1=istran(ID1,1)
            IT2=istran(ID2,1)
            ITT1=istran(IT1,2)
            LB2=LABEL(ID2)
            call HEPNAM(IT1,HNAM1)
            if(LB2.NE.'LERR' .AND. LB2.NE.'ERR' .AND. IT2.NE.0)then
              ITT2=istran(IT2,2)
              call HEPNAM(IT2,HNAM2)
              write(lnhout,1102) ID1,IT1,HNAM1,ITT1,LB1,
     1              ID2,IT2,HNAM2,ITT2,LB2
            else
              write(lnhout,1101) ID1,IT1,HNAM1,ITT1,LB1
            endif
          endif
        endif
 200  CONTINUE
      return
 101  format(//10X,'ISAJET particle translation'/)
 102  format(//5X,'Special Cases'/4X,'IISA',4X,'ISTD  HNAM',15X,
     1     'IISA  INAME',11X,'IISA',4X,'ISTD  HNAM',15X,'IISA  INAME')
 103  format(//5X,'Mesons'/4X,'IISA',4X,'ISTD  HNAM',15X,'IISA  INAME',
     1     11X,'IISA',4X,'ISTD  HNAM',15X,'IISA  INAME')
 104  format(/5X,'baryons and diquarks'/4X,'IISA',4X,'IPDG  HNAM',15X,
     1     'IISA  INAME',11X,'IISA',4X,'IPDG  HNAM',15X,'IISA  INAME')
1101  format(1X,I7,1X,I7,2X,A15,1X,I7,2X,A8)
1102  format(1X,I7,1X,I7,2X,A15,1X,I7,2X,A8,
     1       5X,I7,1X,I7,2X,A15,1X,I7,2X,A8)
      end
