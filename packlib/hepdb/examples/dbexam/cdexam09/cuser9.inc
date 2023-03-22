*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:23:51  mclareni
* Initial revision
*
*
*
* cuser9.inc
*
      PARAMETER       (NOF2CU=12)
      PARAMETER       (NKEYCU=NOF2CU+1, NKYNCU=16, NOBJCU=320)
      COMMON /CUSER9/ ISTOCU, IDIVCU, LPRTCU, KEYSCU(NKEYCU,NOBJCU)
     +              , LDUVCU, LKUVCU, LUSECU(NOBJCU)
*
