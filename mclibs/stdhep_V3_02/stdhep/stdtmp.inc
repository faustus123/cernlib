C -------------------------------------------------------------
C
C  This is the temporary common block used to get events to and
C  from xdr.  It enables reading multiple stdhep input streams.
C
      common/stdtmp/ phept(5,NMXHEP),vhept(4,NMXHEP),
     1 nevhept,nhept,isthept(NMXHEP),idhept(NMXHEP),
     & jmohept(2,NMXHEP),jdahept(2,NMXHEP)
      integer nevhept,nhept,isthept,idhept,jmohept,jdahept
      double precision phept,vhept
      save /stdtmp/
C...      nevhept       - event number
C...      nhept         - number of entries in this event
C...      isthept(..)   - status code
C...      idhept(..)    - particle ID, P.D.G. standard
C...      jmohept(1,..) - position of mother particle in list
C...      jmohept(2,..) - position of second mother particle in list
C...      jdahept(1,..) - position of first daughter in list
C...      jdahept(2,..) - position of last daughter in list
C...      phept(1,..)   - x momentum in GeV/c
C...      phept(2,..)   - y momentum in GeV/c
C...      phept(3,..)   - z momentum in GeV/c
C...      phept(4,..)   - energy in GeV
C...      phept(5,..)   - mass in GeV/c**2
C...      vhept(1,..)   - x vertex position in mm
C...      vhept(2,..)   - y vertex position in mm
C...      vhept(3,..)   - z vertex position in mm
C...      vhept(4,..)   - production time in mm/c
C
C -------------------------------------------------------------
