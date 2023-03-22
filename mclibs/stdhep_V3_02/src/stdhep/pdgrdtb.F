
      subroutine PDGRDTB
C
C   read mass and width table supplied by PDG
C   fill two common blocks 
C        PDGTBL - complete list of particles in PDG table
C        STDTBL - list of particles in PDG table defined by STDHEP
C
#include "pdgtbl.inc"
#include "stdtbl.inc"
#include "stdlun.inc"
C
      character CLINE*80
      character CTYPE*1
      character CPARTIC*21,CHEPN*20
      integer I,J,IIDNUM,INDX,ITR,pdgtran,ICNT,ICNT2
      integer AIDNUM(4),ITMP(NMXLN2)
      real RPOS,RNEG,TMPL(NMXLN2),TMPH(NMXLN2)
      doUBLE PRECISION RVAL,TMPW(NMXLN2)
#ifdef UNIX
      character*100 PDGMASST
#endif

      integer hepcmp
      external hepcmp
C
      logical lfirst
      data lfirst/.TRUE./
      save lfirst

C...print version number if this is the first call
      if(lfirst)then
        call stdversn
        lfirst=.FALSE.
      endif
#ifdef UNIX
C  point to standard decay tables
      call GETENV( 'PDG_MASS_TBL', PDGMASST )
      if ( PDGMASST .EQ. ' ' ) then
         PDGMASST = 'pdg_mass.tbl'
      endif
      OPEN(UNIT=lnhdcy, FILE=PDGMASST, STATUS='OLD')
#endif
#ifdef VMS
      OPEN(UNIT=lnhdcy, FILE='PDG_MASS_TBL', STATUS='OLD', REAdoNLY)
#endif
      ICNT = 0
      ICNT2 = 0
 100  CONTINUE
      READ (lnhdcy, FMT = '(A)', end = 600) CLINE
      if (CLINE (1 : 1) .EQ. 'M' .OR. CLINE (1 : 1) .EQ. 'W') then
          READ (CLINE,
     &    FMT = '(BN, A1, 4I6, 1X, E15.0, 1X, 2E8.0, 1X, A21)')
     &    CTYPE, (AIDNUM(IIDNUM), IIDNUM = 1, 4), RVAL, RPOS, RNEG,
     &    CPARTIC
C... fill stdtbl here
        do J=1,4
          if(AIDNUM(J).NE.0)then
C... translate to STDHEP numbering
            ITR = pdgtran(AIDNUM(J),1)
            if(ITR.NE.0)then
C... get stdhep compressed index
              INDX = hepcmp(ITR)
              if(INDX.GT.0)then
                if(CTYPE.EQ.'M')then
C... this is a mass definition
                  call HEPNAM(ITR,CHEPN)
                  IDT(INDX) = ITR
                  STMASS(INDX) = RVAL
                  STMERR(1,INDX) = RPOS
                  STMERR(2,INDX) = RNEG
                  STNAME(INDX) = CHEPN
                elseif(CTYPE.EQ.'W')then
C... this is a width definition
                  STWIDTH(INDX) = RVAL
                  STWERR(1,INDX) = RPOS
                  STWERR(2,INDX) = RNEG
                endif
              endif
            endif
          endif
        enddo
C... fill pdgtbl here
        do J=1,4
          if(AIDNUM(J).NE.0)then
            if(CTYPE.EQ.'M')then
C... this is a mass definition
              ICNT = ICNT + 1
              IDPDG(ICNT) = AIDNUM(J)
              PDMASS(ICNT) = RVAL
              PDMERR(1,ICNT) = RPOS
              PDMERR(2,ICNT) = RNEG
              PDNAME(ICNT)=CPARTIC
            elseif(CTYPE.EQ.'W')then
C... this is a width definition
              ICNT2 = ICNT2 + 1
              ITMP(ICNT2) = AIDNUM(J)
              TMPW(ICNT2) = RVAL
              TMPH(ICNT2) = RPOS
              TMPL(ICNT2) = RNEG
            endif
          endif
        enddo
      endif
      GO TO 100
 600  CLOSE(UNIT=lnhdcy)
C... match widths to masses for PDG list
      do I=1,ICNT2
        do J=1,ICNT
          if(ITMP(I).EQ.IDPDG(J))then
            PDWIDTH(J) = TMPW(I)
            PDWERR(1,J) = TMPH(I)
            PDWERR(2,J) = TMPL(I)
            GO TO 610
          endif
        enddo
C... no match??
        write(lnhout,111) ITMP(I)
 610    CONTINUE
      enddo
      return
 101  format(' Cannot compress particle  ',
     1     A1, 1X, A21, 1X, 4I8, 1X, E25.16, 1X, 2E9.1)
 102  format(' Cannot translate particle ',
     1     A1, 1X, A21, 1X, 4I8, 1X, E25.16, 1X, 2E9.1)
 111  format(' Failed to find match of width for ',I8)
      end
