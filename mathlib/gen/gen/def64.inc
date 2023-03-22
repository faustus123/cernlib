*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:58  mclareni
* Initial revision
*
*
*
* def64.inc
*
#if !defined(CERNLIB_DOUBLE)
      REAL
#endif
#if (defined(CERNLIB_DOUBLE))&&(defined(CERNLIB_F90))
      REAL(2)
#endif
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION
#endif
