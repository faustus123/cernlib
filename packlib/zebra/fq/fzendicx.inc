*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:09  mclareni
* Initial revision
*
*
*
* fzendicx.inc
*
#if (defined(CERNLIB_QMIBM))&&(defined(CERNLIB_IOPACK))
#if !defined(CERNLIB_QIBM_VM)
      CALL IODD (LUNF,ISW)
#endif
#endif
#if (defined(CERNLIB_QMIBM))&&(defined(CERNLIB_IOPACK))
      CALL IOMOVE (LUNF,-1,ISW)
*    --------------  sequences for FZMACH  ---------------------
#endif
