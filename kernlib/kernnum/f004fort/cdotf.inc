*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:59  mclareni
* Initial revision
*
*
*
* cdotf.inc
*
#if !defined(CERNLIB_NUMCDBLE)
          COMPLEX             A, B, SUM, DOTF
          DOTF(A,B,SUM)  =  A*B + SUM
#endif
#if defined(CERNLIB_NUMCDBLE)
          COMPLEX             A, B
          COMPLEX*16          SUM, DC, DOTF
          DC(A)          =  DCMPLX(DBLE(REAL(A)),DBLE(AIMAG(A)))
          DOTF(A,B,SUM)  =  DC(A)*DC(B) + SUM
#endif
