*
* $Id$
*
* $Log$
* Revision 1.1  1996/05/21 08:39:52  cernlib
* Initial revision
*
* Revision 1.1.1.1  1994/10/08  02:21:32  zfiles
* first version of qqlib in CVS
*
*
*CMZ :  1.04/00 21/09/94  22.55.01  by  Paul Avery
*CMZ :  1.03/70 01/11/90  18.24.10  by  Paul Avery
*CMZ :  1.00/00 04/06/90  18.55.55  by  Jorge L. Rodriguez
*-- Author :
C  -------------------------------------------------------------------
C     CLMCX:MCGEN.INC
C  -------------------------------------------------------------------
C
*  IST         Used in GGGJET, QQGJET, ANGGEN
*  IFR         1 = ff frag. 2 = Lund frag.
*  PUD         Fraction of qqbar pairs popped as (uu/dd) 0 < PUD < 0.5
*  PS1         Not used anymore
*  SIGMA       PT width of jets generated in QCD. Very simplistic.
*  QMAS(15)    Diquark masses? Not used in QDECAY.
*  PAR(25)     Parameters used in generation
*  CZF(15)     For light quarks, used to gen. FF distribution (ZDIST only)
*  MESO(36)    Converts qqbar to meson (pseudoscalar?). Used in QDECAY.
*  CMIX(6,2)   Not used
*  CND(3)      Not used
*  BSPIN(5)    Used for generating baryons in KBPART. Proportion of
*              spin 1/2 vs spin 3/2 for the following cases
*                 (1) qqq (where q = u/d)
*                 (2) sqq (where q = u/d)
*                 (3) ssq (where q = u/d)
*                 (4) cxx (where x = u/d/s)
*                 (5) ccx (where x = u/d/s)
*  BSYMM       Used for generating baryons in KBPART. Specifies what
*              fraction of lambda-like (versus sigma) baryons for the
*              following cases:
*                 (1) sud
*                 (2) cud
*                 (3) csq (where q = u/d)
*  WBAR        Min. invariant mass required to allow baryon generation
*  FLIP        Fraction of times to generate diquark pair (as opposed to
*              qqbar pairs) when popping from vacuum.
*  PBFL(6)     Cumulative probs. to produce various diquarks in DIQFLV
*              uu, ud, us, dd, ds, ss
*  IQFLV(2,6)  Specifies which quarks are to be used in building a baryon
*  KBRFLV(6,4)

      INTEGER IST, IFR, N, K, MESO, NC, KC, LASTN, KBRFLV
      INTEGER IQFLV
      REAL PUD, PS1, SIGMA, QMAS, PAR, CMIX, CND, BSPIN, BSYMM, P
      REAL PC, CZF, FLIP, WBAR, PBFL

      COMMON/DATA1/IST,IFR,PUD,PS1,SIGMA,QMAS(15),PAR(25)
      COMMON/DATA2/CZF(15),MESO(36),CMIX(6,2)
      COMMON/DATA3/CND(3)
      COMMON/DATA5/BSPIN(5),BSYMM(3)
      COMMON/JET/N,K(250,2),P(250,5),NC,KC(10),PC(10,4),
     *  LASTN
      COMMON/BARYON/PBFL(6),FLIP,WBAR,KBRFLV(6,4),IQFLV(2,6)
