*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:48  mclareni
* Initial revision
*
*
       MODULE M_SBIT0
%
% CERN PROGLIB# M421    SBIT0           .VERSION KERNNOR  1.01  800718
% ORIG.  H.OVERAS, CERN, 791213
%
% CALL SBIT0(XM,J)     SET BIT J TO 0
%
       EXPORT SBIT0
       ROUTINE SBIT0
       LIB SBIT0
VBAS:  STACK FIXED
PAR:   W BLOCK 2
       ENDSTACK
SBIT0:  ENTF VBAS
       W1:=0
       W2:=IND(B.PAR+4)
       W2-1
       W1 PUTBI IND(B.PAR),BY2
       RET
       ENDROUTINE
       ENDMODULE
#ifdef CERNLIB_TCGEN_SBIT0
#undef CERNLIB_TCGEN_SBIT0
#endif
