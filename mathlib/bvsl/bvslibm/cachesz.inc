*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:56  mclareni
* Initial revision
*
*
*
* cachesz.inc
*
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QMIBMVF))
#if defined(CERNLIB_3090S)||defined(CERNLIB_3090J)
SZ       EQU   256
#endif
#endif
#if (defined(CERNLIB_IBM))&&(defined(CERNLIB_QMIBMVF))
SZ       EQU   128
#endif
