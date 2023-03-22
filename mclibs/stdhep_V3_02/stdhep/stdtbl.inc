C -------------------------------------------------------------
C
      integer NMXLN
      parameter (NMXLN=1600)
      integer IDT
      real STMERR,STWERR
      double precision STMASS,STWIDTH
      character*21 STNAME
      common/STDTBL/ IDT(NMXLN),STMERR(2,NMXLN),STWERR(2,NMXLN),
     1             STMASS(NMXLN),STWIDTH(NMXLN),STNAME(NMXLN)
      save /STDTBL/
C
C -------------------------------------------------------------
