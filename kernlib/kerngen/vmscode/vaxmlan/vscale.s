;
; $Id$
;
; $Log$
; Revision 1.1  1996/02/15 17:50:32  mclareni
; Initial revision
;
;
 .TITLE VSCALE
;++
; CERN PROGLIB# F121    VSCALE          .VERSION KERNVAX  2.05  830901
; ORIG.  J. VORBRUEGGEN 2/5/83
;
; SUBROUTINE VSCALE(A, ALPHA, X, N)
; X(I) = A(I) * ALPHA , I=1,...,N
;
; Register usage:
; R0    address of A(I)
; R1    = ALPHA
; R2    address of X(I)
; R3    counter from N to 1
;--
        .IDENT  /01/
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
        .ENTRY  VSCALE,^M<R2,R3>

        MOVL    @16(AP),R3              ; get counter
        BLEQ    20$                     ; return if <= 0
        MOVAL   @4(AP),R0               ; get base address of A
        MOVL    @8(AP),R1               ; get ALPHA
        MOVAL   @12(AP),R2              ; get base address of X

10$:    MULF3   (R0)+,R1,(R2)+          ; multiply
        SOBGTR  R3,10$                  ; and loop
20$:    RET

        .END
