*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:23:37  mclareni
* Initial revision
*
*
*
* cdxfils.inc
*
* - - - - - - /CDXFILS/ - - - - - - - - - - - - - - - - -
      INTEGER MCDXFIL
      PARAMETER (MCDXFIL = 10)
      COMMON /CDXFILS/ NCDXFIL,KCDXFIL,
     +                 ICXFSTA(10),CDXFPRF(10),CDXFTOP(10),CDXFNAM(10),
     +                 LOGLCDX(10)
      INTEGER   NCDXFIL, KCDXFIL, ICXFSTA , LOGLCDX
      CHARACTER CDXFPRF*2, CDXFTOP*8, CDXFNAM*40
* - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*
*
