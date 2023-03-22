;
; $Id$
;
; $Log$
; Revision 1.1  1996/02/15 17:50:32  mclareni
; Initial revision
;
;
 .TITLE VMAX
;++
; CERN PROGLIB# F121    VMAX            .VERSION KERNVAX  2.05  830901
; ORIG.  J. VORBRUEGGEN 4/5/83
;
; FUNCTION VMAX(A, N)
; Give maximum of A(I), I=1,...,N
;
; Register usage:
; R0    maximum (initialized with A(1))
; R1    address of A(I)
; R2    counter from N to 1
;--
        .IDENT  /01/
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
        .ENTRY  VMAX,^M<R2>

        MOVL    @8(AP),R2               ; get counter
        BLEQ    40$                     ; return if <= 0
        MOVAL   @4(AP),R1               ; get base address of A
        MOVF    (R1)+,R0                ; initialize maximum
        DECL    R2                      ; update counter
        BEQL    30$                     ; return if N = 1

10$:    CMPF    R0,(R1)+                ; new maximum ?
        BGEQ    20$
        MOVF    -4(R1),R0               ; yes, save it
20$:    SOBGTR  R2,10$                  ; loop
30$:    RET

40$:    CLRF    R0                      ; return a function value of zero
        RET

        .END
