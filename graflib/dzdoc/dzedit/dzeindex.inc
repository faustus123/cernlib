*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:18  mclareni
* Initial revision
*
*
*
* dzeindex.inc
*
      PARAMETER (MAXBNK=2000)
      CHARACTER*4 CINDEX(MAXBNK)
      COMMON/DZEIDC/CINDEX
      INTEGER IORD(MAXBNK),IPINDX(MAXBNK)
      COMMON/DZEIDI/IORD,IPINDX
 
