C -------------------------------------------------------------
C
      integer NMXLN2
      parameter (NMXLN2=1000)
      integer IDPDG
      real PDMERR,PDWERR
      double precision PDMASS,PDWIDTH
      character*21 PDNAME
      common/PDGTBL/ IDPDG(NMXLN2),PDMERR(2,NMXLN2),PDWERR(2,NMXLN2),
     1             PDMASS(NMXLN2),PDWIDTH(NMXLN2),PDNAME(NMXLN2)
      save /PDGTBL/
C
C -------------------------------------------------------------
