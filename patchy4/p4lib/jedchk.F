CDECK  ID>, JEDCHK.
      FUNCTION JEDCHK (IDHAVE,IDTILL)

C-    COMPARE  D/P/F NAMES TO BE IDENTICAL

      DIMENSION    IDHAVE(6),IDTILL(6)


      JEDCHK = -7
      IF (IDTILL(1).EQ.0)          GO TO 16
      IF (IDTILL(1).NE.IDHAVE(1))  RETURN
      IF (IDTILL(2).NE.IDHAVE(2))  RETURN                               -A8M

   16 IF (IDTILL(3).EQ.0)          GO TO 17
      IF (IDTILL(3).NE.IDHAVE(3))  RETURN
      IF (IDTILL(4).NE.IDHAVE(4))  RETURN                               -A8M

   17 IF (IDTILL(5).EQ.0)          GO TO 19
      IF (IDTILL(5).NE.IDHAVE(5))  RETURN
      IF (IDTILL(6).NE.IDHAVE(6))  RETURN                               -A8M
   19 JEDCHK = 0
      RETURN
      END
