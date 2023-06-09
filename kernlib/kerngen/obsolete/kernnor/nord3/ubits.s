*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:49  mclareni
* Initial revision
*
*
       MODULE M_UBITS
%
% CERN PROGLIB# M503    UBITS           .VERSION KERNNOR  1.07  810629
% ORIG.  H.OVERAS, CERN, 810603
%
% CALL UBITS(IM,NBIT,IXV,NX)    LIST OF BIT-NUMBERS OF NON-ZERO BITS
%
       EXPORT UBITS
       ROUTINE UBITS
       LIB UBITS
VBAS:  STACK FIXED
PAR:   W BLOCK 4
W32:   W DATA 32
       ENDSTACK
UBITS:  ENTF VBAS
       W4:=IND(B.PAR)      %IM
       W3:=IND(B.PAR+4)    %NBIT
       IF<=GO OUT
       W3 COMP B.W32       %MIN(NBIT,32)
       IF<=GO OK
       W3:=B.W32
OK:    W SET1 R1   %LOOP INDEX OF IM
       W2 CLR      %INDEX OF IXV
BEGLP: W SHR R4,-1  %BIT0 INTO SIGNBIT
       IF>GO ENDLP
       W1=:IND(B.PAR+8)(R2)  %POSIT OF BIT INTO IXV(R2+1)
       W INCR R2
ENDLP: W LOOPI R1,R3,BEGLP
       W2=:IND(B.PAR+12)
OUT:   RET
       ENDROUTINE
       ENDMODULE
#ifdef CERNLIB_TCGEN_UBITS
#undef CERNLIB_TCGEN_UBITS
#endif
