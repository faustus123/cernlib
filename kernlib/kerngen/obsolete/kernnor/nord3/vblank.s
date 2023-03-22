*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:50  mclareni
* Initial revision
*
*
       MODULE M_VBLANK
%
% CERN PROGLIB# F121    VBLANK          .VERSION KERNNOR  2.05  880419
% ORIG.  H.OVERAS, CERN, 810330
% MODIF. P.S.Iversen, 8-dec-87
%
% CALL VBLANK(XVM,N)            XVM(I)=HOLLERITH BLANK
%
       EXPORT VBLANK
       ROUTINE VBLANK
       LIB VBLANK
VBAS:  STACK FIXED
PAR:   W BLOCK 2
       ENDSTACK
VBLANK:  ENTF VBAS
       W3 := IND(B.PAR+4)                        % Load N
       IF <= GO OUT                              % If <= zero, exit
       W BMOVE 4010020040B,IND(B.PAR),W3         % Fill words
OUT:   RET                                       % Exit
       ENDROUTINE
       ENDMODULE
#ifdef CERNLIB_TCGEN_VBLANK
#undef CERNLIB_TCGEN_VBLANK
#endif
