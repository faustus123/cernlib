*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:13  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDJOUR(LUNFZ,CHTOP,CHFILE,LRECL,CHOPT,IRC)
*
*     Open a journal file for the database accessed via
*     name CHTOP
*
*     Options for CDSOPN:
*
*          A   ASCII file format
*          O   Output file (default is input)
*          X   Exchange binary format
*          Z   File to be overwritten if exists
*
*     Options for CDFZOP:
*          B   Special backup file
*
*
      CHARACTER*(*) CHTOP,CHFILE,CHOPT
 
      IRC = 0
      IF(LUNFZ.LE.0) THEN
         IRC = 136
         GOTO 99
      ENDIF
 
      CALL CDSOPN(LUNFZ, CHOPT, CHFILE, LRECL, IRC)
      IF(IRC.NE.0) GOTO 99
 
      CALL CDFZOP(LUNFZ, CHTOP, CHOPT, IRC)
 
99    END
