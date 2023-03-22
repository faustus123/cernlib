;
; $Id$
;
; $Log$
; Revision 1.1  1996/02/15 17:47:46  mclareni
; Initial revision
;
;
 .TITLE  DXDIB
;
; CERN PROGLIB# M231    CVTIB
; ORIG.  HYDRA FQT PACKAGE ROUTINE FQTICD
; EXTRACTED AND NAME CHANGED BY H.RENSHALL/DD, 1984-05-11
; & THEN MODIFIED BY F.CARMINATI/DD TO CONVERT FROM VAX
; TO IBM DOUBLE PRECISION, 1985-14-02
;
; 29-MAR-1994 AXP compatibility
;
;      SUBROUTINE DXDIB (A,NWORDS)
;
; CONVERTS THE FIRST NWORDS DOUBLEWORDS OF VECTOR A FROM
; VAX D_FLOATING POINT NUMBER FORMAT TO IBM DOUBLE PRECISION
; FORMAT
;
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
;DXDIB::
        .ENTRY  DXDIB,^M<R6,R7,R8,R9,R10,R11>
        MOVAL   @4(AP),R11      ;GET ADRESS OF VECTOR
        MOVL    @8(AP), R9      ;LOAD COUNT
        TSTL    R9              ;COMPARE 0 WITH THE COUNT
        BGTR    LOOP            ;LOOP COUNT GT 0
        RET                     ;LOOP COUNT LE 0
;---
 LOOP:  MOVL    (R11)+,R1       ;FIELD SHIFTED ALREADY.
        MOVL    (R11)+,R0       ;INITIAL SWAP OF LONGWORDS
        TSTL    R1              ;CHECK IF EXACT ZERO
        BEQL    FIN             ;BRANCH ON ZERO
        ROTL    #16,R0,R0       ;SWAP WORDS IN R0
        EXTZV   #7,#8,R1,R8     ;EXTRACT EXPONENT (POWERS OF 2)
        SUBL2   #^X80,R8        ;TAKE AWAY EXCESS
        EXTZV   #0,#2,R8,R7     ;FIND THE REST
        ASHL    #-2,R8,R8       ;DIVIDE EXPONENT BY FOUR
                                ;SO YOU GET THE POWERS OF 16
        TSTB    R7              ;COMPARE THE REST WITH ZERO
        BNEQ    LAB1            ;BRANCH ON NOT EQUAL
        ADDL2   #4,R7           ;NORMALIZE EXPONENT
        SUBL2   #1,R8           ;NORMALIZE EXPONENT BASE 16
 LAB1:  SUBL3   #4,R7,R6        ;THIS IS THE SHIFT
        MOVL    R1,R10          ;SAVE R1 FOR LATER USE
        ROTL    #16,R1,R1       ;SWAP WORDS FOR SHIFT
        ASHQ    R6,R0,R0        ;PERFORM THE SHIFT
        ADDL2   #^X94,R7        ;THIS IS THE NEW EXP
        INSV    R7,#7,#8,R10    ;THIS IS THE FLOATING TO CONVERT
        CLRL    R7              ;CLEAR THE SIGN MASK
        BBCC    #15,R10,POS     ;BRANCH IF POSITIVE
        MOVL    #^X80000000,R7  ;LOAD R7 WITH THE SIGN
  POS:  CVTFL   R10,R1          ;THIS IS THE IBM MANTISSA
        ADDL2   #65,R8          ;THIS IS THE IBM EXPONENT
        INSV    R8,#24,#7,R1    ;THAT NOW WE HAVE PACKED
        BISL2   R7,R1           ;INSERT THE SIGN
        MOVL    R0,  -8(R11)
        MOVL    R1,  -4(R11)
  FIN:  SOBGTR  R9, LOOP        ;LOOP
        RET
  .END
