*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:03  mclareni
* Initial revision
*
*
*
* maxmak.inc
*
#if defined(CERNLIB_MAXMAK124)
      MAXMAK = 124
#elif defined(CERNLIB_MAXMAK48)
      MAXMAK = 48
#elif 1
      MAXMAK = 24
#endif
