*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:41  mclareni
* Initial revision
*
*
#if (defined(CERNLIB_CDC))&&(!defined(CERNLIB_FORTRAN))
          IDENT NUMBIT
          ENTRY NUMBIT
*         FUNCTION NUMBIT(I)= SUM OF ONES BITS IN I
          VFD         36/6HNUMBIT,24/NUMBIT
 NUMBIT   DATA        0
          SA1         X1
          CX6         X1
          JP          NUMBIT
          END
#endif
