      PARAMETER (MAXSTK=2)
      COMMON /ARSTAK/ BPP(MAXPAR,5,MAXSTK),IFLP(MAXPAR,MAXSTK),
     $                QEXP(MAXPAR,MAXSTK),QQP(MAXPAR,MAXSTK),
     $                IDIP(MAXPAR,MAXSTK),IDOP(MAXPAR,MAXSTK),
     $                INOP(MAXPAR,MAXSTK),INQP(MAXPAR,MAXSTK),
     $                XPMUP(MAXPAR,MAXSTK),XPAP(MAXPAR,MAXSTK),
     $                PT2GGP(MAXPAR,MAXSTK),IPARTP(MAXSTK),
     $                BX1P(MAXDIP,MAXSTK),BX3P(MAXDIP,MAXSTK),
     $                PT2INP(MAXDIP,MAXSTK),SDIPP(MAXDIP,MAXSTK),
     $                IP1P(MAXDIP,MAXSTK),IP3P(MAXDIP,MAXSTK),
     $                AEX1P(MAXDIP,MAXSTK),AEX3P(MAXDIP,MAXSTK),
     $                QDONEP(MAXDIP,MAXSTK),QEMP(MAXDIP,MAXSTK),
     $                IRADP(MAXDIP,MAXSTK),ISTRP(MAXDIP,MAXSTK),
     $                ICOLIP(MAXDIP,MAXSTK),IDIPSP(MAXSTK),
     $                IPFP(MAXSTR,MAXSTK),IPLP(MAXSTR,MAXSTK),
     $                IFLOWP(MAXSTR,MAXSTK),PT2LSP(MAXSTK),
     $                PT2MAP(MAXSTK),IMFP(MAXSTK),IMLP(MAXSTK),
     $                IOP(MAXSTK),QDUMPP(MAXSTK),ISTRSP(MAXSTK)
      SAVE /ARSTAK/