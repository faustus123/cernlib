*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:48  mclareni
* Initial revision
*
*
       MODULE M_SBIT
%
% CERN PROGLIB# M421    SBIT            .VERSION KERNNOR  1.01  800718
% ORIG.  H.OVERAS, CERN, 791213
%
% CALL SBIT(IM,XM,J)        SET BIT J TO IM
%
       EXPORT SBIT
       ROUTINE SBIT
       LIB SBIT
VBAS:  STACK FIXED
PAR:   W BLOCK 3
       ENDSTACK
SBIT:  ENTF VBAS
       W2:=IND(B.PAR+8)
       W2-1
       W1:=IND(B.PAR)
       W1 PUTBI IND(B.PAR+4),BY2
       RET
       ENDROUTINE
       ENDMODULE
#ifdef CERNLIB_TCGEN_SBIT
#undef CERNLIB_TCGEN_SBIT
#endif
