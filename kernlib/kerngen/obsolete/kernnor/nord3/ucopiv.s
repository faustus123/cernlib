*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:49  mclareni
* Initial revision
*
*
       MODULE M_UCOPIV
%
% CERN PROGLIB# V301    UCOPIV          .VERSION KERNNOR  2.05  880419
% ORIG.  H.OVERAS, CERN, 791213
% MODIF. P.S.Iversen, 8-dec-87
%
% CALL UCOPIV(AVM,XVM,N)        COPY INVERSE, E.G X(1)=A(N)
%
       EXPORT UCOPIV
       ROUTINE UCOPIV
       LIB UCOPIV
VBAS:  STACK FIXED
PAR:   W BLOCK 3
       ENDSTACK
UCOPIV:  ENTF VBAS
       W1:=0
       W2:=IND(B.PAR+8)
       IF <= GO OUT                              % If <= zero, exit
       W2-1
       W3:=R2
BEGLP: W MOVE IND(B.PAR)(R1),IND(B.PAR+4)(R3)
       W3-1
       W LOOPI R1,R2,BEGLP
OUT:   RET
       ENDROUTINE
       ENDMODULE
#ifdef CERNLIB_TCGEN_UCOPIV
#undef CERNLIB_TCGEN_UCOPIV
#endif
