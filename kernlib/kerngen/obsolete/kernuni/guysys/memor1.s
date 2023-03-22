*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:07  mclareni
* Initial revision
*
*
. **************************************
.
.     SUBROUTINE MEMOR1( LCUR, LFIRST, LLAST )
.     LCUR, LFIRST, LLAST ARE ABSOLUTE ADDRESSES
#if defined(CERNLIB_GUYFORE)||defined(CERNLIB_GUYFORT)
. *   NO ATTEMPT TO PROVIDE A 'FTN COMPATIBLE' VERSION
#endif
.
. **************************************
          AXR$
. *   NO FORT$ PROC: COMPILER DEPENDENT CODING
 
MEMORC    INFO  2  2
$(2)
LASTAD    RES       1
LIMABS    RES       1
 
$(1)
MEMOR1*
#if defined(CERNLIB_GUYFORT)||defined(CERNLIB_GUYFORE)
.                   ----- FORTRAN 5  VERSION -----
          TZ,S1     0,X11
          J         0,X11             . NO ARG
          DL        A1,0,X11          . LOC(LCUR), LOC(LFIRST)
          DL        A3,LASTAD
          L,U       A5,LASTD$+1
          S         A3,0,A1           . LCUR
          TZ,S1     1,X11
          J         1,X11             . ONE ARG ONLY
          S         A5,0,A2           . LFIRST
          TZ,S1     2,X11
          J         2,X11             . TWO ARGS ONLY
          L         A0,2,X11          . LOC(LLAST)
          S         A4,0,A0           . LAST
          TZ,S1     3,X11
          J         3,X11             . FORT
          J         4,X11             . FORE
#endif
#if defined(CERNLIB_GUYFTN)
.                   ----- FTN  VERSION -----
          L         A5,A0
          SSL       A5,18             . NARG
          JZ        A5,0,X11          . RETURNS IF NO ARG
          DL        A1,0,A0           . LOC(LCUR), LOC(LFIRST)
          DL        A3,LASTAD
          S         A3,0,A1
          TNE,U     A5,1
          J         0,X11             . ONE ARG ONLY
          L,U       A3,LASTD$+1
          S         A3,0,A2
          TNE,U     A5,2
          J         0,X11             . TWO ARGS ONLY
          L         A0,2,A0           . LOC(LLAST)
          S         A4,0,A0
          J         0,X11
#endif
          END
