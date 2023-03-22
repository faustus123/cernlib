*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:54  mclareni
* Initial revision
*
*
#if defined(CERNLIB_ND50)||defined(CERNLIB_ND500)
       MODULE M_BLOBUN8W
% SOURCE AND TARGET MAY BE THE SAME, BUT NOT OVERLAP PARTIALLY
% CALL BLO8W(SOURCE,N1,TARGET,N2,N3)
% UNPACKS 8 BIT WORDS INTO 32 BIT WORDS WITHOUT SIGN EXTENSION
% CALL BUN8W(SOURCE,N1,TARGET,N2,N3)
% PACKS RIGHT BYTE OF 32 BIT WORDS INTO A CONTIGUOUS STRING OF 8 BIT BYTES
% VERSION 811001
       EXPORT BLO8W,BUN8W
       ROUTINE BLO8W,BUN8W
       LIB BLO8W,BUN8W
VBAS:  STACK FIXED
PAR:   W BLOCK 5
SRCE:  W BLOCK 1
TRGT:  W BLOCK 1
       ENDSTACK
BLO8W:  ENTF VBAS
       W1 CLR
       W2:=IND(B.PAR+16)
       IF <= GO BACK
       W2-1
       W3:=IND(B.PAR+4)
       W3-1
       W3+B.PAR
       W3=:B.SRCE
       W4:=IND(B.PAR+12)
       W4-1
       W4 MULAD 4,B.PAR+8
       W4=:B.TRGT
LOOP1: BY3:=IND(B.SRCE)(R2)
       W3=:IND(B.TRGT)(R2)
       W LOOPD R2,R1,LOOP1
       RET
BUN8W:  ENTF VBAS
       W1 CLR
       W2:=IND(B.PAR+16)
       IF <= GO BACK
       W2-1
       W3:=IND(B.PAR+4)
       W3-1
       W3 MULAD 4,B.PAR
       W3=:B.SRCE
       W4:=IND(B.PAR+12)
       W4-1
       W4+B.PAR+8
       W4=:B.TRGT
LOOP2: W BYCONV IND(B.SRCE)(R1),IND(B.TRGT)(R1)
       W LOOPI R1,R2,LOOP2
BACK:  RET
       ENDROUTINE
       ENDMODULE
#endif