*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:53  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_QUAD)
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DLGAMA(X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION QLGAMA(X)
#endif
#include "gen/imp128.inc"
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'QLGAMA')
      DIMENSION C(0:27)

      PARAMETER (AL2 =  0.69314 71805 59945 30941 72321 21458 18Q0)

      DATA C( 0) / 0.52854 30369 82234 59886 70146 10587 97Q0/
      DATA C( 1) / 0.54987 64461 21414 11418 47224 01104 36Q0/
      DATA C( 2) / 0.02073 98006 16136 65135 91673 63567 71Q0/
      DATA C( 3) /-0.00056 91677 04215 43842 38953 35739 98Q0/
      DATA C( 4) / 0.00002 32458 72104 00168 83522 53120 41Q0/
      DATA C( 5) /-0.00000 11306 07585 70393 43721 97663 24Q0/
      DATA C( 6) / 0.00000 00606 56530 98948 08283 26590 28Q0/
      DATA C( 7) /-0.00000 00034 62843 57769 83164 91206 97Q0/
      DATA C( 8) / 0.00000 00002 06249 98805 67913 53392 37Q0/
      DATA C( 9) /-0.00000 00000 12663 51115 66776 12652 22Q0/
      DATA C(10) / 0.00000 00000 00795 31006 91836 38345 01Q0/
      DATA C(11) /-0.00000 00000 00050 82076 64160 41154 37Q0/
      DATA C(12) / 0.00000 00000 00003 29187 26043 65876 53Q0/
      DATA C(13) /-0.00000 00000 00000 21555 55420 93157 81Q0/
      DATA C(14) / 0.00000 00000 00000 01423 99484 99073 76Q0/
      DATA C(15) /-0.00000 00000 00000 00094 75908 48729 10Q0/
      DATA C(16) / 0.00000 00000 00000 00006 34422 73080 16Q0/
      DATA C(17) /-0.00000 00000 00000 00000 42694 88760 51Q0/
      DATA C(18) / 0.00000 00000 00000 00000 02885 95426 13Q0/
      DATA C(19) /-0.00000 00000 00000 00000 00195 82123 61Q0/
      DATA C(20) / 0.00000 00000 00000 00000 00013 33140 05Q0/
      DATA C(21) /-0.00000 00000 00000 00000 00000 91025 69Q0/
      DATA C(22) / 0.00000 00000 00000 00000 00000 06231 33Q0/
      DATA C(23) /-0.00000 00000 00000 00000 00000 00427 57Q0/
      DATA C(24) / 0.00000 00000 00000 00000 00000 00029 40Q0/
      DATA C(25) /-0.00000 00000 00000 00000 00000 00002 02Q0/
      DATA C(26) / 0.00000 00000 00000 00000 00000 00000 14Q0/
      DATA C(27) /-0.00000 00000 00000 00000 00000 00000 01Q0/

      PARAMETER (FM = 1Q20)

#endif
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DLGAMA')
      DIMENSION C(0:25)

      PARAMETER (AL2 =  0.69314 71805 59945 30941 72321 21458 18D0)

      DATA C( 0) / 0.52854 30369 82234 59886 70146 10587 97D0/
      DATA C( 1) / 0.54987 64461 21414 11418 47224 01104 36D0/
      DATA C( 2) / 0.02073 98006 16136 65135 91673 63567 71D0/
      DATA C( 3) /-0.00056 91677 04215 43842 38953 35739 98D0/
      DATA C( 4) / 0.00002 32458 72104 00168 83522 53120 41D0/
      DATA C( 5) /-0.00000 11306 07585 70393 43721 97663 24D0/
      DATA C( 6) / 0.00000 00606 56530 98948 08283 26590 28D0/
      DATA C( 7) /-0.00000 00034 62843 57769 83164 91206 97D0/
      DATA C( 8) / 0.00000 00002 06249 98805 67913 53392 37D0/
      DATA C( 9) /-0.00000 00000 12663 51115 66776 12652 22D0/
      DATA C(10) / 0.00000 00000 00795 31006 91836 38345 01D0/
      DATA C(11) /-0.00000 00000 00050 82076 64160 41154 37D0/
      DATA C(12) / 0.00000 00000 00003 29187 26043 65876 53D0/
      DATA C(13) /-0.00000 00000 00000 21555 55420 93157 81D0/
      DATA C(14) / 0.00000 00000 00000 01423 99484 99073 76D0/
      DATA C(15) /-0.00000 00000 00000 00094 75908 48729 10D0/
      DATA C(16) / 0.00000 00000 00000 00006 34422 73080 16D0/
      DATA C(17) /-0.00000 00000 00000 00000 42694 88760 51D0/
      DATA C(18) / 0.00000 00000 00000 00000 02885 95426 13D0/
      DATA C(19) /-0.00000 00000 00000 00000 00195 82123 61D0/
      DATA C(20) / 0.00000 00000 00000 00000 00013 33140 05D0/
      DATA C(21) /-0.00000 00000 00000 00000 00000 91025 69D0/
      DATA C(22) / 0.00000 00000 00000 00000 00000 06231 33D0/
      DATA C(23) /-0.00000 00000 00000 00000 00000 00427 57D0/
      DATA C(24) / 0.00000 00000 00000 00000 00000 00029 40D0/
      DATA C(25) /-0.00000 00000 00000 00000 00000 00002 02D0/

      PARAMETER (FM = 1D20)
#endif

      U=X
      IF(X .LE. 0) THEN
       H=0
       WRITE(ERRTXT,101) X
       CALL MTLPRT(NAME,'C304.1',ERRTXT)
       GO TO 9
      ENDIF
      F=1
      IF(U .LT. 3) THEN
       DO 1 I = 1,INT(4-U)
       F=F/U
    1  U=U+1
       FL=LOG(F)+AL2
      ELSE
       FL=AL2
       DO 2 I = 1,INT(U-3)
       U=U-1
       F=F*U
       IF(F .GT. FM) THEN
        FL=FL+LOG(F)
        F=1
       ENDIF
    2  CONTINUE
       FL=FL+LOG(F)
      END IF
      H=U+U-7
      ALFA=H+H
      B1=0
      B2=0
      DO 3 I = 27,0,-1
      B0=C(I)+ALFA*B1-B2
      B2=B1
    3 B1=B0
      H=FL+B0-H*B2
#if defined(CERNLIB_DOUBLE)
    9 QLGAMA=H
#endif
#if !defined(CERNLIB_DOUBLE)
    9 DLGAMA=H
#endif
      RETURN
  101 FORMAT('ARGUMENT IS NEGATIVE = ',1P,E15.1)
      END
#endif
