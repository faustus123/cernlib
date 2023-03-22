CDECK  ID>, IQBCD.
      FUNCTION IQBCD (CHAR)

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
C--------------    END CDE                             -----------------  ------
      DIMENSION    CHAR(9)


      IQBCD = IUFIND (CHAR(1),IQLETT(1),1,48)
      RETURN
      END
