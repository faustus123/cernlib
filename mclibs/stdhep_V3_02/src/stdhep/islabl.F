      function ISLABL(ID)
C
C          Return the character*8 label for the particle ID.
C          Quark-based IDENT code.
C          MSSM names for squarks, sleptons, Higgs bosons.
C
C  5/11/92  LAG  Modified ISAJET original function to return LERR if INDEX < 1
C  2/23/94  LAG  OBSOLETE - use ISAJET LABEL function
C
#include "itapes.inc"
#include "qlmass.inc"
#include "stdlun.inc"
C
#if defined(LEVEL2)
C          DUMMY COMMON BLOCK TO ALLOW LEVEL2 STORAGE.
      COMMON/XLABEL/LLEP,LMES0,LMES1,LBAR0,LABAR0,LBAR1,LABAR1,LQQ,LAQQ
      LEVEL2,/XLABEL/
#endif
      character*8 ISLABL
      character*8 LLEP,LMES0,LMES1,LBAR0,LABAR0,LBAR1,LABAR1
      character*8 LQQ,LAQQ
      DIMENSION LLEP(145)
      DIMENSION LMES0(64),LMES1(64)
      DIMENSION LBAR0(109),LABAR0(109),LBAR1(109),LABAR1(109)
      DIMENSION LQQ(21),LAQQ(21)
C          DIQUARK LABELS
      data LQQ/
     1'UU0. ','UD0. ','DD0. ','US0. ','DS0. ','SS0. ','UC0. ','DC0. ',
     2'SC0. ','CC0. ','UB0. ','DB0. ','SB0. ','CB0. ','BB0. ','UT0. ',
     3'DT0. ','ST0. ','CT0. ','BT0. ','TT0. '/
      data LAQQ/
     1'AUU0.','AUD0.','ADD0.','AUS0.','ADS0.','ASS0.','AUC0.','ADC0.',
     2'ASC0.','ACC0.','AUB0.','ADB0.','ASB0.','ACB0.','ABB0.','AUT0.',
     3'ADT0.','AST0.','ACT0.','ABT0.','ATT0.'/
C          QUARK AND LEPTON LABELS
      data LLEP/
     $'     ','UP   ','UB   ','DN   ','DB   ','ST   ','SB   ','CH   ',
     $'CB   ','BT   ','BB   ','TP   ','TB   ','Y    ','YB   ','X    ',
     $'XB   ','GL   ','ERR  ','GM   ','ERR  ','NUE  ','ANUE ','E-   ',
     $'E+   ','NUM  ','ANUM ','MU-  ','MU+  ','NUT  ','ANUT ','TAU- ',
     $'TAU+ ','ERR  ','ERR  ','ERR  ','ERR  ','ERR  ','ERR  ','KS   ',
     $'ERR  ','ERR  ','KL   ',
     $'UPL  ','UBL  ','DNL  ','DBL  ','STL  ','SBL  ','CHL  ','CBL  ',
     $'BTL  ','BBL  ','TPL  ','TBL  ','ERR  ','ERR  ','ERR  ','ERR  ',
     $'GLSS ','ERR  ','Z1SS ','ERR  ','NUEL ','ANUEL','EL-  ','EL+  ',
     $'NUML ','ANUML','MUL- ','MUL+ ','NUTL ','ANUTL','TAUL-','TAUL+',
     $'ERR  ','ERR  ','ERR  ','ERR  ','W1SS+','W1SS-','Z2SS ','ERR  ',
     $'UPR  ','UBR  ','DNR  ','DBR  ','STR  ','SBR  ','CHR  ','CBR  ',
     $'BTR  ','BBR  ','TPR  ','TBR  ','ERR  ','ERR  ','ERR  ','ERR  ',
     $'W2SS+','W2SS-','Z3SS ','ERR  ','NUER ','ANUER','ER-  ','ER+  ',
     $'NUMR ','ANUMR','MUR- ','MUR+ ','NUTR ','ANUTR','TAUR-','TAUR+',
     $'ERR  ','ERR  ','ERR  ','ERR  ','ERR  ','ERR  ','Z4SS ','ERR  ',
     $'W+   ','W-   ','HIGGS','ERR  ','HL0  ','ERR  ','HH0  ','ERR ',
     $'HA0  ','ERR  ','H40  ','AH40 ','H+   ','H-   ','H2+  ','H2-  ',
     $'H1++ ','H1-- ','H2++ ','H2-- ','Z0   ','ERR  '/
C          0- MESON LABELS
      data LMES0/
     1'PI0  ','PI+  ','ETA  ','PI-  ','K+   ','K0   ','ETAP ','AK0  ',
     2'K-   ','AD0  ','D-   ','F-   ','ETAC ','F+   ','D+   ','D0   ',
     2'UB.  ','DB.  ','SB.  ','CB.  ','BB.  ','BC.  ','BS.  ','BD.  ',
     3'BU.  ','UT.  ','DT.  ','ST.  ','CT.  ','BT.  ','TT.  ','TB.  ',
     4'TC.  ','TS.  ','TD.  ','TU.  ','UY.  ','DY.  ','SY.  ','CY.  ',
     5'BY.  ','TY.  ','YY.  ','YT.  ','YB.  ','YC.  ','YS.  ','YD.  ',
     6'YU.  ','UX.  ','DX.  ','SX.  ','CX.  ','BX.  ','TX.  ','YX.  ',
     7'XX.  ','XY.  ','XT.  ','XB.  ','XC.  ','XS.  ','XD.  ','XU.  '/
C          1- MESON LABELS
      data LMES1/
     1'RHO0 ','RHO+ ','OMEG ','RHO- ','K*+  ','K*0  ','PHI  ','AK*0 ',
     2'K*-  ','AD*0 ','D*-  ','F*-  ','JPSI ','F*+  ','D*+  ','D*0  ',
     3'UB*  ','DB*  ','SB*  ','CB*  ','UPSL ','BC*  ','BS*  ','BD*  ',
     4'BU*  ','UT*  ','DT*  ','ST*  ','CT*  ','BT*  ','TT*  ','TB*  ',
     5'TC*  ','TS*  ','TD*  ','TU*  ','UY*  ','DY*  ','SY*  ','CY*  ',
     6'BY*  ','TY*  ','YY*  ','YT*  ','YB*  ','YC*  ','YS*  ','YD*  ',
     7'YU*  ','UX*  ','DX*  ','SX*  ','CX*  ','BX*  ','TX*  ','YX*  ',
     8'XX*  ','XY*  ','XT*  ','XB*  ','XC*  ','XS*  ','XD*  ','XU*  '/
C          1/2+ BARYON LABELS
      data LBAR0/
     1'ERR  ','P    ','N    ','ERR  ','ERR  ','S+   ','S0   ','S-   ',
     2'L    ','XI0  ','XI-  ','ERR  ','ERR  ','ERR  ','SC++ ','SC+  ',
     3'SC0  ','LC+  ','USC. ','DSC. ','SSC. ','SDC. ','SUC. ','UCC. ',
     4'DCC. ','SCC. ','ERR  ','ERR  ','ERR  ','ERR  ','UUB. ','UDB. ',
     5'DDB. ','DUB. ','USB. ','DSB. ','SSB. ','SDB. ','SUB. ','UCB. ',
     6'DCB. ','SCB. ','CCB. ','CSB. ','CDB. ','CUB. ','UBB. ','DBB. ',
     7'SBB. ','CBB. ','ERR  ','ERR  ','ERR  ','ERR  ','ERR  ','UUT. ',
     8'UDT. ','DDT. ','DUT. ','UST. ','DST. ','SST. ','SDT. ','SUT. ',
     9'UCT. ','DCT. ','SCT. ','CCT. ','CST. ','CDT. ','CUT. ','UBT. ',
     1'DBT. ','SBT. ','CBT. ','BBT. ','BCT. ','BST. ','BDT. ','BUT. ',
     2'UTT. ','DTT. ','STT. ','CTT. ','BTT. ','ERR  ','ERR  ','ERR  ',
     3'ERR  ','ERR  ','ERR  ','UUY. ','UDY. ','DDY. ','DUY. ','USY. ',
     4'DSY. ','SSY. ','SDY. ','SUY. ','UUX. ','UDX. ','DDX. ','DUX. ',
     5'USX. ','DSX. ','SSX. ','SDX. ','SUX. '/
      data LABAR0/
     1'ERR  ','AP   ','AN   ','ERR  ','ERR  ','AS-  ','AS0  ','AS+  ',
     2'AL   ','AXI0 ','AXI+ ','ERR  ','ERR  ','ERR  ','ASC--','ASC- ',
     3'ASC0 ','ALC- ','AUSC.','ADSC.','ASSC.','ASDC.','ASUC.','AUCC.',
     4'ADCC.','ASCC.','ERR  ','ERR  ','ERR  ','ERR  ','AUUB.','AUDB.',
     5'ADDB.','ADUB.','AUSB.','ADSB.','ASSB.','ASDB.','ASUB.','AUCB.',
     6'ADCB.','ASCB.','ACCB.','ACSB.','ACDB.','ACUB.','AUBB.','ADBB.',
     7'ASBB.','ACBB.','ERR  ','ERR  ','ERR  ','ERR  ','ERR  ','AUUT.',
     8'AUDT.','ADDT.','ADUT.','AUST.','ADST.','ASST.','ASDT.','ASUT.',
     9'AUCT.','ADCT.','ASCT.','ACCT.','ACST.','ACDT.','ACUT.','AUBT.',
     1'ADBT.','ASBT.','ACBT.','ABBT.','ABCT.','ABST.','ABDT.','ABUT.',
     2'AUTT.','ADTT.','ASTT.','ACTT.','ABTT.','ERR  ','ERR  ','ERR  ',
     3'ERR  ','ERR  ','ERR  ','AUUY.','AUDY.','ADDY.','ADUY.','AUSY.',
     4'ADSY.','ASSY.','ASDY.','ASUY.','AUUX.','AUDX.','ADDX.','ADUX.',
     5'AUSX.','ADSX.','ASSX.','ASDX.','ASUX.'/
C          3/2+ BARYON LABELS
      data LBAR1/
     1'DL++ ','DL+  ','DL0  ','DL-  ','ERR  ','S*+  ','S*0  ','S*-  ',
     2'ERR  ','XI*0 ','XI*- ','OM-  ','ERR  ','ERR  ','UUC* ','UDC* ',
     3'DDC* ','ERR  ','USC* ','DSC* ','SSC* ','ERR  ','ERR  ','UCC* ',
     4'DCC* ','SCC* ','CCC* ','ERR  ','ERR  ','ERR  ','UUB* ','UDB* ',
     5'DDB* ','ERR  ','USB* ','DSB* ','SSB* ','ERR  ','ERR  ','UCB* ',
     6'DCB* ','SCB* ','CCB* ','ERR  ','ERR  ','ERR  ','UBB* ','DBB* ',
     7'SBB* ','CBB* ','BBB* ','ERR  ','ERR  ','ERR  ','ERR  ','UUT* ',
     8'UDT* ','DDT* ','ERR  ','UST* ','DST* ','SST* ','ERR  ','ERR  ',
     9'UCT* ','DCT* ','SCT* ','CCT* ','ERR  ','ERR  ','ERR  ','UBT* ',
     1'DBT* ','SBT* ','CBT* ','BBT* ','ERR  ','ERR  ','ERR  ','ERR  ',
     2'UTT* ','DTT* ','STT* ','CTT* ','BTT* ','TTT* ','ERR  ','ERR  ',
     3'ERR  ','ERR  ','ERR  ','UUY* ','UDY* ','DDY* ','ERR  ','USY* ',
     4'DSY* ','SSY* ','ERR  ','ERR  ','UUX* ','UDX* ','DDX* ','ERR  ',
     5'USX* ','DSX* ','SSX* ','ERR  ','ERR  '/
      data LABAR1/
     1'ADL--','ADL- ','ADL0 ','ADL+ ','ERR  ','AS*- ','AS*0 ','AS*+ ',
     2'ERR  ','AXI*0','AXI*+','AOM+ ','ERR  ','ERR  ','AUUC*','AUDC*',
     3'ADDC*','ERR  ','AUSC*','ADSC*','ASSC*','ERR  ','ERR  ','AUCC*',
     4'ADCC*','ASCC*','ACCC*','ERR  ','ERR  ','ERR  ','AUUB*','AUDB*',
     5'ADDB*','ERR  ','AUSB*','ADSB*','ASSB*','ERR  ','ERR  ','AUCB*',
     6'ADCB*','ASCB*','ACCB*','ERR  ','ERR  ','ERR  ','AUBB*','ADBB*',
     7'ASBB*','ACBB*','ABBB*','ERR  ','ERR  ','ERR  ','ERR  ','AUUT*',
     8'AUDT*','ADDT*','ERR  ','AUST*','ADST*','ASST*','ERR  ','ERR  ',
     9'AUCT*','ADCT*','ASCT*','ACCT*','ERR  ','ERR  ','ERR  ','AUBT*',
     1'ADBT*','ASBT*','ACBT*','ABBT*','ERR  ','ERR  ','ERR  ','ERR  ',
     2'AUTT*','ADTT*','ASTT*','ACTT*','ABTT*','ATTT*','ERR  ','ERR  ',
     3'ERR  ','ERR  ','ERR  ','AUUY*','AUDY*','ADDY*','ERR  ','AUSY*',
     4'ADSY*','ASSY*','ERR  ','ERR  ','AUUX*','AUDX*','ADDX*','ERR  ',
     5'AUSX*','ADSX*','ASSX*','ERR  ','ERR  '/
C          ENTRY
C
C  issue warning and exit - 2/23/94
C
      ISLABL='LERR'
      write(lnhout,1001)
1001  format(' ISLABL is obsolete - use LABEL from ISAJET')
      GO TO 999
      call FLAVOR(ID,ifL1,ifL2,ifL3,JSPIN,INDEX)
      if(INDEX.LE.0) return
      if(IABS(ID).LT.100) GO TO 200
      if(IABS(ID).LT.1000) GO TO 100
      if(ID.NE.0.AND.MOD(ID,100).EQ.0) GO TO 300
C          BARYONS
      INDEX=INDEX-109*JSPIN-36*NMES-NQLEP
      INDEX=INDEX-11
      if(JSPIN.EQ.0.AND.ID.GT.0) ISLABL=LBAR0(INDEX)
      if(JSPIN.EQ.0.AND.ID.LT.0) ISLABL=LABAR0(INDEX)
      if(JSPIN.EQ.1.AND.ID.GT.0) ISLABL=LBAR1(INDEX)
      if(JSPIN.EQ.1.AND.ID.LT.0) ISLABL=LABAR1(INDEX)
      GO TO 999
C          MESONS
100   CONTINUE
      I=MAX0(ifL2,ifL3)
      J=-MIN0(ifL2,ifL3)
      INDEX=MAX0(I-1,J-1)**2+I+MAX0(I-J,0)
      if(JSPIN.EQ.0) ISLABL=LMES0(INDEX)
      if(JSPIN.EQ.1) ISLABL=LMES1(INDEX)
      GO TO 999
C          QUARKS, LEPTONS, ETC.
200   CONTINUE
      INDEX=2*INDEX
      if(ID.LE.0) INDEX=INDEX+1
      ISLABL=LLEP(INDEX)
      GO TO 999
300   I=IABS(ifL1)
      J=IABS(ifL2)
      INDEX=I+J*(J-1)/2
      if(ID.GT.0) ISLABL=LQQ(INDEX)
      if(ID.LT.0) ISLABL=LAQQ(INDEX)
C
999   CONTINUE
C.      if(ISLABL(1:3).EQ.'ERR') then
C.        write(ITLIS,1000) ID
C.1000    format(' ERROR IN LABEL, ID = ',I8)
C.      endif
      return
      end
