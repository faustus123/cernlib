*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:23:39  mclareni
* Initial revision
*
*
*
* rzxkeyb.inc
*
*
* - - - - - -/RZXKEYB/- - - - - - - - - - - - - - - - - -
      INTEGER     MAXKEYB
      PARAMETER ( MAXKEYD=20 , MAXKEYB=200 )
      COMMON /RZXKEYB/ NRZKEYS, NRZKEYB, IRZKEYB(MAXKEYD,MAXKEYB)
      INTEGER          NRZKEYD, NRZKEYB, IRZKEYB
* - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*
