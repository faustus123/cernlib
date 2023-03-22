*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:02  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HEPDB_CDOPEN_INC
#define CERNLIB_HEPDB_CDOPEN_INC
*
*
* cdopen.inc
*
      CALL CDCOUN(NFILES)
      IF(NFILES.EQ.0) THEN
         IF(LLOGCD.GT.-3) WRITE(LPRTCD,*) 'No files currently ',
     +      'open - use the OPEN command to open a file'
         RETURN
      ENDIF

#endif
