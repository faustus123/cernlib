*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:04  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HEPDB_CRCCOM_INC
#define CERNLIB_HEPDB_CRCCOM_INC
*
*
* crccom.inc
*
      PARAMETER       (NMAXCR=20000)
      COMMON /CRCCOM/ IFRSCR, IWORCR(4), QVECCR(NMAXCR), ILSTCR(128)
      DIMENSION       IQVECR(NMAXCR)
      EQUIVALENCE     (QVECCR, IQVECR)
CDEC$ PSECT /CRCCOM/ ALIGN=9
*

#endif
