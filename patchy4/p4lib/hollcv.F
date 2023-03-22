CDECK  ID>, HOLLCV.
      SUBROUTINE HOLLCV (MINV,MEXV,NP,IDIR)

C-    CONVERT HOLLERITH CHARACTERS
C-    IDIR = 0  INTEGER  TO  HOLL. A1 WITH BLANK FILL
C-           1  HOLL. A1 TO  INTEGER  WITH ZERO FILL

      COMMON /COMCET/INILEV,NWCEIN,NCHCEU,NWCEU
     +,              NWCEBA,IPAKCE(5),IPAKKD(5),JPOSA1,MXINHO
     +,              LCESAV(4)
C--------------    END CDE                             --------------
      DIMENSION    MINV(9), MEXV(9), NP(9)

      EQUIVALENCE (JPOS, JPOSA1)
      EQUIVALENCE (NBITS,IPAKKD(1))


      DATA  MM     / 4H     /


      NCH = NP(1)
      IF (IDIR.NE.0)         GO TO 21

C--                INTEGER TO HOLLERITH

      DO 19 J=1,NCH
      CALL SBYT (MINV(J),MM,JPOS,NBITS)
   19 MEXV(J) = MM
      RETURN

C--                HOLLERITH TO INTEGER

   21 DO 29 J=1,NCH
   29 MEXV(J) = JBYT (MINV(J),JPOS,NBITS)
      RETURN
      END
