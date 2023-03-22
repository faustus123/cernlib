
      subroutine HPTRLSTH
C
C    compare particle ID for herwig and standard
C
#include "herwig.inc"
#include "stdlun.inc"
      integer I,ID1,IT1,ITT1
      integer hwtran
      character*20 CNAM1
      character*4 NHWG1

      write(lnhout,1001)
C... I=IHWG (short list)
      do 100 I=1,NRES
        CNAM1 = ' '
        IT1 = 0
        ITT1 = 0
        call HWUIDT(2,ID1,I,NHWG1)
        if(ID1.EQ.0)then
C... illegal or confused
          if(I.EQ.20) IT1=89
          if(I.GE.14 .AND. I.LE.18) IT1=I+67
          if(IT1.GT.0) call HEPNAM(IT1,CNAM1)
        else
          IT1=hwtran(ID1,1)
          ITT1=hwtran(IT1,2)
          call HEPNAM(IT1,CNAM1)
        endif
        write(lnhout,1101) I,ID1,IT1,CNAM1,ITT1,NHWG1
 100  CONTINUE
      return
 1001 format(//5X,'Herwig Translation'/
     1 4X,'ISHT',4X,'IHWG',4X,'ISTD  HPNAM',14X,'IHWG  HNAME')
 1101 format(1X,I7,1X,I7,1X,I7,2X,A15,1X,I7,2X,A4,6X)
      end
