*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:30  mclareni
* Initial revision
*
*
*
* imp64r.inc
*
#if defined(CERNLIB_DOUBLE)
      IMPLICIT DOUBLE PRECISION (A-H,O-Q,S-Z)
      IMPLICIT REAL (R)

#elif (defined(CERNLIB_F90))&&(defined(CERNLIB_DOUBLE))
      IMPLICIT REAL(2) (A-H,O-Q,S-Z)
      IMPLICIT REAL (R)

#elif !defined(CERNLIB_DOUBLE)
C

#elif 1
      IMPLICIT REAL (A-H,O-Z)

#endif
