CDECK  ID>, FLOPER.
      SUBROUTINE FLOPER (MODE, CHFILE, LUNOP)

C-    File operations :
C-    MODE = 1 :  delete file CHFILE
C-           2 :  change name of file CHFILE to CHFILE.bak

      COMMON /SLATE/ NDSLAT,NESLAT,NFSLAT,NGSLAT,MMSLAT(36)

      CHARACTER    CHFILE*(*), CHBAK*256
      LOGICAL      THERE
      INTEGER      RENAMEF

C--                Check file exists

      NDSLAT = 0
      INQUIRE (FILE=CHFILE,EXIST=THERE)
      IF (.NOT.THERE)              RETURN
      IF (MODE.EQ.2)               GO TO 24
      IF (MODE.NE.1)               RETURN

C--                Remove file

      OPEN  (LUNOP,FILE=CHFILE,STATUS='OLD')
      CLOSE (LUNOP,STATUS='DELETE')
      RETURN

C--                Rename file

   24 N     = MIN (LEN(CHFILE), 252)
      NFI   = LNBLNK  (CHFILE(1:N))
      CHBAK = CHFILE(1:NFI) // '.bak'
      NBAK  = NFI + 4

      INQUIRE (FILE=CHBAK(1:NBAK),EXIST=THERE)
      IF (THERE)  THEN
          OPEN  (LUNOP,FILE=CHBAK,STATUS='OLD')
          CLOSE (LUNOP,STATUS='DELETE')
        ENDIF

      ISTAT = RENAMEF (CHFILE(1:NFI), CHBAK(1:NBAK))
      IF (ISTAT.EQ.0)  NDSLAT = 1
      RETURN
      END
