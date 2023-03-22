C -------------------------------------------------------------
C
      integer NMXBUF
      parameter (NMXBUF = 15000)
      integer NBUF,IBUF
      common/OBUF/NBUF,IBUF(NMXBUF)
      save /OBUF/
C
C -------------------------------------------------------------
