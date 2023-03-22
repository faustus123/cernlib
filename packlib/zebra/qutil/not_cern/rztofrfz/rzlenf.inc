*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:18  mclareni
* Initial revision
*
*
*
* rzlenf.inc
*
#if defined(CERNLIB_QMIBM)
      PARAMETER(LENF= 21)
#endif
#if defined(CERNLIB_QMAPO)||defined(CERNLIB_QMALT)||defined(CERNLIB_QMDOS)
      PARAMETER(LENF=128)
#endif
#if (defined(CERNLIB_QMCRY)||defined(CERNLIB_QMVAX)||defined(CERNLIB_QMCVX)||defined(CERNLIB_QMUIX)||defined(CERNLIB_QMLNX))&&(!defined(CERNLIB_QMALT))
      PARAMETER(LENF=255)
#endif
