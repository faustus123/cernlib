*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:58  mclareni
* Initial revision
*
*
*
* imp64r.inc
*
#if !defined(CERNLIB_DOUBLE)
C
#endif
#if (defined(CERNLIB_F90))&&(defined(CERNLIB_DOUBLE))
      IMPLICIT REAL(2) (A-H,O-Q,S-Z)
      IMPLICIT REAL (R)
#endif
      IMPLICIT DOUBLE PRECISION (A-H,O-Q,S-Z)
      IMPLICIT REAL (R)
