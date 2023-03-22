
      subroutine STDRQQBG(NB,lok)

C  read begin run pythia information
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "qqpars.inc"
#include "qqprop.inc"
#include "stdlun.inc"

      integer NB,lok,I,NUM

      NUM = (NB - 4)/16 - 21
      READ(lnhrd,ERR=900) MCNUM8,MCNUM9,NPMNQQ,NPMXQQ,
     1     (IDPDGQ(I),I=-20,NUM),(IDMC(I),I=-20,NUM),
     2     (LPARTY(I),I=-20,NUM),(CPARTY(I),I=-20,NUM),
     3     (IMIXPP(I),I=-20,NUM),(ICPMIX(I),I=-20,NUM),
     4     (HIDEQQ(I),I=-20,NUM),(AMASS(I),I=-20,NUM),
     5     (CHARGE(I),I=-20,NUM),(CTAU(I),I=-20,NUM),
     6     (SPIN(I),I=-20,NUM),(RWIDTH(I),I=-20,NUM),
     7     (RMASMN(I),I=-20,NUM),(RMASMX(I),I=-20,NUM),
     8     (RMIXPP(I),I=-20,NUM),(RCPMIX(I),I=-20,NUM)
      if(MCNUM8.NE.NUM)then
        lok = 3
        write(lnhout,1001) NUM,MCNUM8
      endif
      if(MCNUM8.NE.MCNUM)then
        lok = 4
        write(lnhout,1002) MCNUM8,MCNUM
      endif
      if(MCNUM9.NE.MCNUM1)then
        lok = 5
        write(lnhout,1003) MCNUM9,MCNUM1
      endif
      return
 900  lok = 1
      return
1001  format(1X,
     1 'STDRQQBG: discrepancy between calculated and packed array size'
     2     /10X,'calculated array size: ',I5
     3     /10X,'packed array size:     ',I5)
1002  format(1X,
     1 'STDRQQBG: discrepancy between packed and actual value of MCNUM'
     2     /10X,'packed value: ',I5/10X,'actual value: ',I5)
1003  format(1X,
     1 'STDRQQBG: discrepancy between packed and actual value of MCNUM1'
     2     /10X,'packed value: ',I5/10X,'actual value: ',I5)
      end
