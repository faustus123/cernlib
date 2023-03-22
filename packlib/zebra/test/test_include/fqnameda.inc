*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:03  mclareni
* Initial revision
*
*
*
* fqnameda.inc
*
#if defined(CERNLIB_QMIBM)
      DATA  FQNAME / '/ZXTEST DAT1', '/ZXTEST DAT2', '/ZXTEST DAT3' /
#elif defined(CERNLIB_QMIBMD)
      DATA  FQNAME / '/ZXTEST DAT1', '/ZXTEST DAT2', '/ZXTEST DAT3' /
#elif 1
      DATA  FQNAME / 'zxtest.dat  ', 'zxtest2.dat ', 'zxtest3.dat ' /
#endif
