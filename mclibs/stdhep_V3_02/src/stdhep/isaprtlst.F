
      subroutine ISAPRTLST(JTLIS)
C
C      list defined particles
C
C  2/24/94  LAG  OBSOLETE - use ISAJET PRTLST subroutine
C
      integer JTLIS,ID
      integer ifL1,ifL2,ifL3,JSPIN,INDEX
      character*8 LB,LABEL
C
C
C  issue warning and call PRTLST here - 2/24/94
C
      write(JTLIS,1001)
1001  format(' ISAPRTLST is obsolete - use PRTLST from ISAJET'
     1        /'          calling PRTLST(JTLIS,-1.,-1.)'//)
      call PRTLST(JTLIS,-1.,-1.)
      return

      write(JTLIS,101)
      do 200 I=1,10000
        ID = I
        call FLAVOR(ID,ifL1,ifL2,ifL3,JSPIN,INDEX)
        if(INDEX.GT.0)then
          LB = LABEL(ID)
          if(LB.NE.'LERR' .AND. LB.NE.'ERR')then
            AM = AMASS(ID)
            CG = CHARGE(ID)
            write(JTLIS,102) ID,LB,AM,CG,ifL1,ifL2,ifL3,JSPIN,INDEX
          endif
        endif
        ID = -I
        call FLAVOR(ID,ifL1,ifL2,ifL3,JSPIN,INDEX)
        if(INDEX.GT.0)then
          LB = LABEL(ID)
          if(LB.NE.'LERR' .AND. LB.NE.'ERR')then
            AM = AMASS(ID)
            CG = CHARGE(ID)
            write(JTLIS,102) ID,LB,AM,CG,ifL1,ifL2,ifL3,JSPIN,INDEX
          endif
        endif
 200  CONTINUE
      return
 101  format(//10X,'ISAJET particles'/2X,'ID     PARTICLE',
     1     5X,'MASS',8X,'CHARGE',9X,'FLAVOR',6X,'SPIN',2X,'INDEX')
 102  format(1X,I6,A10,F15.8,F7.2,5I6)
      end
