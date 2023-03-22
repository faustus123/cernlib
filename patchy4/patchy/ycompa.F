CDECK  ID>, YCOMPA.
      PROGRAM YCOMPA

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 4)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'NEW     .pam        12       0       4      !FF!'
     +,          'OLD     .pam        11       0       1      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!' /

      CALL FLPARA (NFILES,NAME,
     +   'YCOMPAR Ponly,Quick, Try continue.')

      NSTRM  = 1
      NBUFCI = 30
      CALL AUXINI
      CALL YCOMEX
      END
