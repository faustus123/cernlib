*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:39  mclareni
* Initial revision
*
*
      SUBROUTINE DATIME(ID,IT)
C
C CERN PROGLIB# Z007    DATIME          .VERSION KERNMPW  1.00  891208
C
      COMMON / SLATE / IYEAR, IMONTH, IDAY, IHH, IMM, ISS, HDUM(36)
      CHARACTER*8 CTIME
 
      CALL TIME(CTIME)
      CALL IDATE(IMONTH,IDAY,IYEAR)
      READ(CTIME,'(I2,1X,I2,1X,I2)') IHH,IMM,ISS
      ID = IYEAR * 10000 + IMONTH * 100 +IDAY
      IT = IHH * 100 + IMM
      IYEAR = IYEAR + 1900
      END
