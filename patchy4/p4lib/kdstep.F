CDECK  ID>, KDSTEP.
      FUNCTION KDSTEP (MV,NCDP)

C-    SPACE OVER  NCD  CARDS IN PACKED MEMORY

      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
C--------------    END CDE                             -----------------  ------
      DIMENSION    MV(99)



      NCD = NCDP
      J   = 0

      DO 31 JC=1,NCD
      J = J+1
      DO 19 JJ=1,KDNWT1
      IF (AND(MV(J),Z'FF000000').EQ.0)   GO TO 31
   19 J = J+1
   31 CONTINUE

      KDSTEP = J
      RETURN
      END
