*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:03  mclareni
* Initial revision
*
*
*
* fqnamrda.inc
*
#if defined(CERNLIB_QMIBM)
      DATA  FQNAME / '/FZREAD DAT ' /
#elif defined(CERNLIB_QMIBMD)
      DATA  FQNAME / '/FZREAD DAT ' /
#elif 1
      DATA  FQNAME / 'fzread.dat  ' /
#endif
