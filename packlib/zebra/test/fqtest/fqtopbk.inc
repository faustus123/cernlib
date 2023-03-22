*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:00  mclareni
* Initial revision
*
*
*
* fqtopbk.inc
*
#if defined(CERNLIB_QMIBM)
#if defined(CERNLIB_QFIXDANY)
      CALL FILEINF (IBMRC, 'RECFM','F', 'LRECL',3600)
#endif
#endif
*
* fqtopbk.inc
*
#if defined(CERNLIB_QMIBM)
#if defined(CERNLIB_QFIDDANY)
      CALL FILEINF (IBMRC, 'MAXREC', 600)
#endif
#endif
*
* fqtopbk.inc
*
#if defined(CERNLIB_QMIBMD)
#if defined(CERNLIB_QFIXDANY)
      CALL FILEINF (IBMRC, 'RECFM','F', 'LRECL',3600)
#endif
#endif
*
* fqtopbk.inc
*
#if defined(CERNLIB_QMIBMD)
#if defined(CERNLIB_QFIDDANY)
      CALL FILEINF (IBMRC, 'MAXREC', 600)
#endif
#endif
