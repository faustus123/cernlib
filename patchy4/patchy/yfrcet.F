CDECK  ID>, YFRCET.
      PROGRAM YFRCET

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 5)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'CETA    .cet        11     128       1      !FF!'
     +,          'PAM     .pam        21      64       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'READ    .cra         1      -4       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!' /

      CALL FLPARA (NFILES,NAME,
     + 'YFRCETA Ponly,Quick, Access_direct, Sequential, Magtape, True.')

      NSTRM  = 1
      NBUFCI = 1
      CALL AUXINI
      CALL YFRCEX
      END
