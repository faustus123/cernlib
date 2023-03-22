
      subroutine STDWQQBG(ilbl,lok)

C  write begin run pythia information
C
C        lok = 0 if no problems were encountered

#include "qqpars.inc"
#include "qqprop.inc"
#include "stdlun.inc"

      integer ilbl,lok,I,NB

      NB = 4 + 16*MCNUM1
      write(lnhwrt,ERR=900) ilbl,NB
      write(lnhwrt,ERR=900) MCNUM,MCNUM1,NPMNQQ,NPMXQQ,
     1     (IDPDGQ(I),I=-20,MCNUM),(IDMC(I),I=-20,MCNUM),
     2     (LPARTY(I),I=-20,MCNUM),(CPARTY(I),I=-20,MCNUM),
     3     (IMIXPP(I),I=-20,MCNUM),(ICPMIX(I),I=-20,MCNUM),
     4     (HIDEQQ(I),I=-20,MCNUM),(AMASS(I),I=-20,MCNUM),
     5     (CHARGE(I),I=-20,MCNUM),(CTAU(I),I=-20,MCNUM),
     6     (SPIN(I),I=-20,MCNUM),(RWIDTH(I),I=-20,MCNUM),
     7     (RMASMN(I),I=-20,MCNUM),(RMASMX(I),I=-20,MCNUM),
     8     (RMIXPP(I),I=-20,MCNUM),(RCPMIX(I),I=-20,MCNUM)
      return
900   lok = 1
      return
      end
