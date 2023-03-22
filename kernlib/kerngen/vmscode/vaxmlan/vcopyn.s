;
; $Id$
;
; $Log$
; Revision 1.1  1996/02/15 17:50:31  mclareni
; Initial revision
;
;
 .TITLE VCOPYN
;++
; CERN PROGLIB# F121    VCOPYN          .VERSION KERNVAX  2.05  830901
; ORIG.  J. VORBRUEGGEN 4/5/83
;
; SUBROUTINE VCOPYN(A, X, N)
; X(I) =  - A(I) , I=1,...,N
;
; Register usage:
; R0, R1        addresses of A(I) and X(I), resp.
; R2            counter from N to 1
;--
        .IDENT  /01/
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
        .ENTRY  VCOPYN,^M<R2>

        MOVL    @12(AP),R2              ; get counter
        BLEQ    20$                     ; return if <= 0
        MOVAL   @4(AP),R0               ; get base addresses of A and X
        MOVAL   @8(AP),R1

10$:    MNEGF   (R0)+,(R1)+             ; copy the negative value
        SOBGTR  R2,10$                  ; and loop
20$:    RET

        .END
