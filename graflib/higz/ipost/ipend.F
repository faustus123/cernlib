*
* $Id$
*
* $Log$
* Revision 1.3  2005/10/28 12:38:13  couet
* - SVG driver, workstation type -779
*
* Revision 1.1.1.1  1996/02/14 13:11:06  mclareni
* Higz
*
*
#include "higz/pilot.h"
*CMZ :  1.23/01 24/05/95  10.39.02  by  O.Couet
*-- Author : O.Couet
      SUBROUTINE IPEND
#include "higz/hiflag.inc"
#include "higz/hipost.inc"
*
      IF(TFLAG) THEN
         CALL IPPSTR(BSLASH//'fi'//BSLASH//'end{picture}@')
         IF(IPTWTY.EQ.-778)CALL IPPSTR(BSLASH//'end{document}@')
      ELSEIF(VFLAG) THEN
         CALL IPPSTR('</svg>@')
         VFLAG=.FALSE.
         RETURN
      ELSE
         IF(MODE.NE.3)THEN
            CALL IPSVRT(-1)
            IF (LOPRT) THEN
               CALL IPPSTR('showpage@')
               CALL IPSVRT(-1)
            ENDIF
            CALL IPPSTR('%%Trailer@')
            CALL IPPSTR('%%Pages: ')
            CALL IPIOUT(NPAGES)
            CALL IPPSTR('@')
   10       IF (NBSAVE.GT.0) THEN
               CALL IPSVRT(-1)
               GOTO 10
            ENDIF
         ELSE
            CALL IPPSTR('@')
   20       IF (NBSAVE.GT.0) THEN
               CALL IPSVRT(-1)
               GOTO 20
            ENDIF
            CALL IPPSTR('showpage@')
            CALL IPPSTR('end@')
         ENDIF
         CALL IPPSTR('%%EOF@')
      ENDIF
      IF (NBSAVE.NE.0)
     +   CALL IGERR(
     +   'Invalid number of ''grestore'' in PostScript file',
     +   'IPEND')
      PFLAG=.FALSE.
      GLFLAG=(ZFLAG.OR.PFLAG.OR.MFLAG)
      END
