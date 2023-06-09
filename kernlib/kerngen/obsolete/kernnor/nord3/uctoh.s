*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:49  mclareni
* Initial revision
*
*
       MODULE M_UCTOH
%
% CERN PROGLIB# M409    UCTOH           .VERSION KERNNOR  1.13  811202
% ORIG.  H.OVERAS, CERN, 811201
%
% CALL UCTOH(CHAR,AN,N,NCH)     CONVERT CHAR TO HOLLERITH AN
%                          HOLLERITH INPUT IF TYPE CHARACTER UNLIKELY
%
       IMPORT-D SLATE
       EXPORT UCTOH
       ROUTINE UCTOH
       LIB UCTOH
VBAS:  STACK FIXED
PAR:   W BLOCK 4
MAX:   W BLOCK 1
NBLK:  W BLOCK 1
       ENDSTACK
UCTOH:  ENTF VBAS
       W1:=IND(B.PAR+12)
       IF <= GO OUT
       W1-1
       W1=:B.MAX
       W RLADDR IND(B.PAR)
       W COMP2 R.0,177777B %IF TOO BIG, TRY HOLLERITH
       IF > GO LAB1
       W MOVE R.4,B.PAR %CHANGE POINTER TO STRING ITSELF
LAB1:  W1 CLR
        W2 CLR
       W3:=5
       W4:=IND(B.PAR+8)
       IF <= GO OUT
       W4 COMP 4
       IF <= GO LAB2
       W4:=4
LAB2:  W SUB3 4,R4,B.NBLK
       W2-B.NBLK
BEGLP: W3 COMP R4
       IF <= GO LAB3
       W2+B.NBLK
       W3:=R2
       W3/4
       W MOVE 4010020040B,IND(B.PAR+4)(R3) %PRESET EACH WORD
       W SET1 R3
LAB3:  BY MOVE IND(B.PAR)(R1),IND(B.PAR+4)(R2)
       W2+1
       W3+1
       W LOOPI R1,B.MAX,BEGLP
       W2-1
       W2/4
       W2+1
       W2=:SLATE  %# WORDS INTO COMMON /SLATE/NI
OUT:   RET
       ENDROUTINE
       ENDMODULE
#ifdef CERNLIB_TCGEN_UCTOH
#undef CERNLIB_TCGEN_UCTOH
#endif
