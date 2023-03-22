CDECK  ID>, CCTOUP.
      SUBROUTINE CCTOUP (MV,NCHP)

C-    CONVERT LOWER CASE TO UPPER FOR ACTIVE PART OF C/C

      COMMON /CCPARU/MCCTOU,JCCLOW,JCCTPX
C--------------    END CDE                             --------------
      DIMENSION    MV(99), NCHP(9)

C-                  MASKU = Z'DF FFFFFF'
      PARAMETER    (MASKU = -536870913)



      NCH  = NCHP(1)
      JLOW = 0

      DO 49  JCH=1,NCH

      JVAL = AND (MV(JCH),255)
      IF (JVAL.LT.97)        GO TO 49
      IF (JVAL.GE.123)       GO TO 49

C--                CONVERSION NEEDED

   24 JLOW = JCH

      MV(JCH) = AND (MV(JCH), Z'FFFFFFDF')

   49 CONTINUE
      JCCLOW = MAX  (JCCLOW,JLOW)
      RETURN
      END
