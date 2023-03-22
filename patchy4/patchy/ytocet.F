CDECK  ID>, YTOCET.
      PROGRAM YTOCET

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 5)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'PAM     .pam        11       0       1      !FF!'
     +,          'CETA    .cet        21     192       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'READ    .cra         1      -4       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!' /

      CALL FLPARA (NFILES,NAME,
     +   'YTOCETA Quick, Access_direct, Sequential, Magtape.')

      CALL AUXINI
      CALL YTOCEX
      END
