*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:37  mclareni
* Initial revision
*
*
        TITLE   VADD
;#
; CERN PROGLIB# F121    VADD            .VERSION KERNPDP  1.00  750903
; ORIG.  P. SCHMITZ, AACHEN, 3/9/1975
;#
        SEARCH HELP
        HELLO (VADD)
       SKIPG      ,@3(A16)
        GOODBY
       MOVEI      ,@0(A16)
       SOS
       HRRM       ,LOOP
       MOVEI      ,@1(A16)
       SOS
       HRRM       ,LOOP+1
       MOVEI      ,@2(A16)
       SOS
       HRRM       ,LOOP+2
       MOVEM   A01,AC01
       MOVEI   A01,1
LOOP:  MOVE       ,(A01)
       FADR       ,(A01)
       MOVEM      ,(A01)
       CAMGE   A01,@3(A16)
       AOJA    A01,LOOP
       MOVE    A01,AC01
        GOODBY
AC01:  0
       A01= 1
       A16=16
      PRGEND
#ifdef CERNLIB_TCGEN_VADD
#undef CERNLIB_TCGEN_VADD
#endif
