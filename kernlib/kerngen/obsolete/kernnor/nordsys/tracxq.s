*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:51  mclareni
* Initial revision
*
*
#if defined(CERNLIB_QMND3)
       MODULE M_TRACXQ
%
% CERN PROGLIB# N105    TRACXQ          .VERSION KERNNOR  1.07  810629
% ORIG.  H.OVERAS, CERN, 810621
%
% PROVIDE TRACEBACK WHEN CALLED VIA TRACEQ (IN FTN)
% WILL HANDLE CORRECTLY A ROUTINE HIERARCHY CONTAINING ONLY:
% A) CALL TO ENTF
% B) CALLG TO ENTF WITH LOCAL INDIRECT SUBR ADDRESS
% CALL TRAC1Q   INITIALIZE TRACEBACK
% CALL TRAC2Q   DELIVER NEXT STEP
%
       IMPORT-D SLATE
       EXPORT TRAC1Q,TRAC2Q
       ROUTINE TRAC1Q,TRAC2Q
       LIB TRAC1Q,TRAC2Q
VBAS:  STACK FIXED
BN:    W BLOCK 1  %VBAS (B) OF CALLER
RANP:  W BLOCK 1  %RETURN ADDRESS OF CALLER
CALA:  W BLOCK 1  %LOCATION OF CALL
ENTA:  W BLOCK 1  %DIR OR IND POINTER TO ENTF OF CALLER
PADR:  W BLOCK 1  %P POINTER TO NEAR RET ADDR
HOP:   W BLOCK 1  % #BYTES TAKEN BY SUBROUT REF
BUFP:  W BLOCK 3  %ROLLING BUFFER FOR PROG BYTES
ENDBF: W BLOCK 1  %POINTER TO FIRST LOC AFTER BUFP
ENINS: W BLOCK 1
IFLG:  W BLOCK 1  %0 DURING INITIALIZATION
MFLG:  W BLOCK 1  %0 UNTIL MAIN REACHED
R3LMT: W BLOCK 1  %MOVING LOWER LIMIT OF P BYTE POINTER
ZRO:   W DATA 0
MON60: W DATA 37000000060B
       ENDSTACK
TRAC1Q:  ENTF VBAS
       W STZ B.IFLG
       W STZ B.MFLG
       W MOVE B.0,B.BN
       GO FIRST
FINIT: W SET1 B.IFLG
       RET
TRAC2Q:  ENTF VBAS
       W TEST B.MFLG
       IF=GO ON
       W SET1 SLATE+16  %MAIN PROG WAS REACHED
       RET
ON:    R:=B.BN
       W MOVE R.0,B.BN
       W MOVE B.CALA,SLATE+12  %RETURN LOCATION OF CALL
       W STZ SLATE+16
FIRST: W2 LADDR B.ENDBF
       W2=:B.ENDBF
       R:=B.BN
       W MOVE R.4,B.RANP
       IF=GO MAIN:H
       W MOVE B.RANP,B.PADR
       W4:=-2   %INITIALIZE P WORD CONTER
       W3:=-1   %INITIALIZE P BYTE COUNTER
       W MOVE -4,B.R3LMT
LP1:   W SUB2 B.PADR,4   %START NEW P WORD LOOP
       IF<=GO BADLY:H
       W MOVE B.BUFP+4,B.BUFP+8  %ROLL BUFFER
       W MOVE B.BUFP,B.BUFP+4
       CALLG B.MON60,3:B,B.ZRO,B.PADR,B.BUFP   %GET 4 P BYTES
       W TEST R1
       IF><GO BADLY:H  %ERR FROM MON60
LP2:   W2:=R3   %START NEXT (EARLIER) P BYTE LOOP
       W2 PSUM R4,4
       W ADD2 R2,B.ENDBF
       W MOVE R2.1,B.ENTA  %P POINTER (DIR OR IND)TO ENTF INSTR
       W MOVE 4,B.HOP
       BY1:=R2.0
       BY1 COMP 303B:B  %TEST OPCODE CALL
       IF=GO FETCH
       BY1 COMP 265B:B   %TEST OPCODE CALLG
       IF><GO NXTBY:H
       BY1:=R2.1
       BY1-305B:B   %LOCAL INDIRECT SUBR REF?
       IF=GO BYDSP
       BY1 COMP 1:B
       IF=GO HDSP
       BY1 COMP 2:B
       IF=GO WDSP
       GO NXTBY
BYDSP: W MOVE 2,B.HOP
        BY1:=R2.2
       GO PREP
HDSP:  W MOVE 3,B.HOP
       H1:=R2.2
       GO PREP
WDSP:  W MOVE 5,B.HOP
       W1:=R2.2
PREP:  W ADD2 R1,R.0
       W MOVE R1.0,B.ENTA
       W MOVE IND(B.ENTA),B.ENTA
FETCH: CALLG B.MON60,3:B,B.ZRO,B.ENTA,B.ENINS  %4 FIRST BYTES OF ENTF
       W TEST R1
       IF><GO BADLY:H  %ERR FROM MON60
       BY COMP2 B.ENINS,335B:B  %TEST OPCODE ENTF
       IF><GO NXTBY
       W ADD2 R2,B.HOP  %HOP OVER SUBROUT ADDR BYTES
       BY COMP2 R2.1,R.19  %COMP ARG # IN CALL AND IN STACK
       IF><GO NXTBY
       W MOVE B.ENTA,SLATE  %RETURN ENTRY ADDRESS OF CALLER
       W INCR B.ENTA  %P POINTER TO VBAS VALUE
       CALLG B.MON60,3:B,B.ZRO,B.ENTA,SLATE+4 %GET VBAS FROM ENTF INST
       W TEST R1
       IF><GO BADLY:H  %ERR FROM MON60
       R=:R1
       W1 COMP SLATE+4  %COMP WITH VBAS FROM STACK
       IF=GO FOUND
NXTBY: W LOOPD R3,B.R3LMT,LP2
       W SUB2 B.R3LMT,4
       W LOOPI R4,100,LP1
       GO BADLY
FOUND: W ADD3 B.RANP,R3,B.CALA  %DEFINE LOC OF NEXT HIGHER CALL
       W TEST B.IFLG
       IF=GO FINIT
       W COMP2 SLATE,SLATE+12  %CALL ADDR AFTER SUBR START?
       IF>=GO BADLY
       RET
MAIN:  W MOVE 4,SLATE %ENTADDR AND VBAS OF MAIN ARE 4
       W MOVE 4,SLATE+4
       W SET1 B.MFLG
       RET
BADLY: W MOVE -1,SLATE+16  %TRACEBACK FAILED
       RET
       ENDROUTINE
       ENDMODULE
#endif
