*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:04  mclareni
* Initial revision
*
*
*
* tzmain1.inc
*
#if defined(CERNLIB_QMIBM)||defined(CERNLIB_QMIBMD)
      OPEN (16,FILE='/ZXTEST DAT',STATUS='OLD')
#endif
*
* tzmain1.inc
*
#if defined(CERNLIB_QMND3)
      OPEN (16,FILE='ZXTEST:DAT')
#endif
*
* tzmain1.inc
*
#if defined(CERNLIB_QMPDP)
#endif
