CDECK  ID>, PABEND.
      SUBROUTINE PABEND

C-    ABNORMAL STOP ON FATAL ERROR

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      LOGICAL      INTRAC


      WRITE (IQPRNT,9000)
      WRITE (IQPRNT,9001)

      IF     (IQTYPE.NE.0)  THEN
          IF (IQPRNT.NE.IQTYPE)  WRITE (IQTYPE,9001)
        ENDIF

      STOP 99
      CALL ABEND

 9000 FORMAT (1X,2(/1X,20(1H*)))
 9001 FORMAT (1X,20(1H*),16H   ABNORMAL END.)
      END
