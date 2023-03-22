*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:59  mclareni
* Initial revision
*
*
*
* rdotf.inc
*
#if !defined(CERNLIB_NUMRDBLE)
          REAL                A, B, SUM, DOTF
          DOTF(A,B,SUM)  =  A*B + SUM
#endif
#if defined(CERNLIB_NUMRDBLE)
          REAL                A, B
          DOUBLE PRECISION    SUM, DOTF
          DOTF(A,B,SUM)  =  DBLE(A)*DBLE(B) + SUM
#endif
