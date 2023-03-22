*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:19  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMPURL(GENAM,LBANK,KEYS,CHOPT,IRC)
*
*     Simplified interface to FMURL. All info taken from
*     configuration file
*
      CHARACTER*(*)    GENAM
      CHARACTER*32     CHPROT,CHSERV,CHNAME,CHSGRP,CHBFID,CHOPT
#include "fatmen/fmnkeys.inc"
      DIMENSION      KEYS(LKEYFA)
 
      IRC = 0
 
      CHPROT = ' '
      CHSERV = ' '
      CHNAME = ' '
      CHSGRP = ' '
      CHBFID = ' '
      CHOPT  = 'P'
 
      CALL FMURL(GENAM,LBANK,KEYS,
     +           CHPROT,CHSERV,CHNAME,CHSGRP,CHBFID,CHOPT,IRC)
 
      END
