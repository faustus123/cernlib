*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:05  mclareni
* Initial revision
*
*
. *************************************
.
.     FUNCTION VMAXA( A,N )                      *** F 121 ***
.     FUNCTION IVMAXA( IA,N )
.     Y = AMAX1( ABS(A(1)),   ABS(A(N)) )
.     OR IY = MAX0( ABS(IA(1)),   ABS(IA(N)) )
. *   ERROR EXIT IF  N.LE.0   (==>VMAXA=0.)
.
. *************************************
 
          AXR$
          FORT$
$(1),FIRS01
          +         'VMAXA '
VMAXA*
#include "ftnors1.inc"
#include "spyuse.inc"
* Ignoring t=pass
          DL        A2,0,XARG          . LOC(A), LOC(N)
          L         A3,0,A3            . N
          SZ        A0
          JGD       A3,$+2
LMJER1    SLJ       GERR$              . ERROR EXIT IF N.LE.0
          LXI,U     A2,1
VMAX10
          LMA       A4,0,*A2
          TLE       A0,A4
          L         A0,A4
          JGD       A3,VMAX10
          J         RETUR2
 
#if (defined(CERNLIB_GUYDIAGP))&&(defined(CERNLIB_GUYFORT))
.     DIAGNOSTIC PACKETS FOR FORT
#include "gerr_c.inc"
F         FORM      6,6,6,18
          INFO      010 03
$(3)
DIAG1     F         077,050,3,VMAXA
          +         0,DYN$
          +         'VMAXA '
          ON        GERMAX
DIAG2     F         077,067,2,0
          +         LMJER1-FIRS01,DYN$
DIAG3     F         077,047,LDIAG3,LMJER1+1
          +         LDIAG3-2,DIAG2
 'VMAXA( A,N ) ERROR: N.LE.0'
LDIAG3    EQU       $-DIAG3
          OFF
          ON        GERMAX=0
DIAG2     F         077,062,2,LMJER1+1
          +         LMJER1-FIRS01,DIAG1
          OFF
#endif
          END
#ifdef CERNLIB_TCGEN_VMAXA
#undef CERNLIB_TCGEN_VMAXA
#endif
