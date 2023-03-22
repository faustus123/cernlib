#
# stdhep examples makefile
#
include Makefile.$(UNAME)

INCS = -I../stdhep -I$(LUND_DIR)/jetset74 -I$(HERWIG_DIR)/herwig58 -I$(ISAJET_DIR)/isajet714 -I../code/qq -I../code/mcfio

CRNLIB = /cern/95b/lib
LIBS = $(LIB)/libstdhep.a
LIBSX = $(LIB)/libstdhep.a $(LIB)/libFmcfio.a
LIBSCX = $(LIB)/libstdhepC.a $(LIB)/libFmcfio.a

#------------------------------------------

all: stdtst stdtsth stdtsthz stdtsti stdtstiz stdtstio stdtstioz stdtstiom \
     stdtstj stdtstjx stdtstjz stdtstp stdtstpx stdtstiox \
     stdtstxin stdtstxout

stdtst: stdtst.o $(LIBS)
	$(F77) -o stdtst stdtst.o $(LIB)/libstdhep.a 

stdtsth: stdtsth.o testhst.o $(LIBS)
	$(F77) -o stdtsth stdtsth.o testhst.o \
		-L$(LIB) -lstdhep -lherwig \
		$(CRNLIB)/libpacklib.a

stdtsthz: stdtsth.F testhstz.o $(LIBS)
	$(F77) $(ZFLAGS) -c -o stdtsthz.o stdtsth.F
	$(F77) -o stdtsthz stdtsthz.o testhstz.o \
		-L$(LIB) -lstdhep -lherwig \
		$(CRNLIB)/libpacklib.a

stdtsti: stdtsti.o testhst.o $(LIBS)
	$(F77) -o stdtsti stdtsti.o testhst.o \
		$(LIB)/libstdhep.a \
		-L$(CRNLIB) -lisajet \
		-lmathlib -lpacklib

stdtstio: stdtstio.o testhst.o $(LIBS)
	$(F77) -o stdtstio stdtstio.o testhst.o \
		$(LIB)/libstdhep.a \
		$(CRNLIB)/libpacklib.a

stdtstiom: stdtstiom.o $(LIBS)
	$(F77) -o stdtstiom stdtstiom.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libpacklib.a

stdtstiox: stdtstiox.o testhst.o $(LIBSX)
	$(F77) -g -o stdtstiox stdtstiox.o testhst.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libpacklib.a \
		$(LIB)/libFmcfio.a $(LOCAL)

stdtstioz: stdtstio.F testhstz.o $(LIBS)
	$(F77) $(ZFLAGS) -c -o stdtstioz.o stdtstio.F
	$(F77) -o stdtstioz stdtstioz.o testhstz.o \
		$(LIB)/libstdhep.a \
		$(CRNLIB)/libpacklib.a

stdtstiz: stdtsti.F testhstz.o $(LIBS)
	$(F77) $(ZFLAGS) -c -o stdtstiz.o stdtsti.F
	$(F77) -o stdtstiz stdtstiz.o testhstz.o \
		$(LIB)/libstdhep.a \
		-L$(CRNLIB) -lisajet \
		-lmathlib -lpacklib

stdtstj: stdtstj.o testhst.o $(LIBS)
	$(F77) -o stdtstj stdtstj.o testhst.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libjetset.a \
		$(CRNLIB)/libpacklib.a

stdtstjx: stdtstj.F testhst.o $(LIBSX)
	$(F77) $(XFLAGS) -c -o stdtstjx.o stdtstj.F
	$(F77) -o stdtstjx stdtstjx.o testhst.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libjetset.a \
		$(CRNLIB)/libpacklib.a \
		$(LIB)/libFmcfio.a $(LOCAL)

stdtstjz: stdtstj.F testhstz.o $(LIBS)
	$(F77) $(ZFLAGS) -c -ostdtstjz.o stdtstj.F
	$(F77) -o stdtstjz stdtstjz.o testhstz.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libjetset.a \
		$(CRNLIB)/libpacklib.a

stdtstp: stdtstp.o pygive.o $(LIBS)
	$(F77) -o stdtstp stdtstp.o pygive.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libjetset.a \
		$(CRNLIB)/libpacklib.a

stdtstpx: stdtstp.F pygive.o $(LIBSX)
	$(F77) $(XFLAGS) -c -o stdtstpx.o stdtstp.F
	$(F77) -o stdtstpx stdtstpx.o pygive.o \
		$(LIB)/libstdhep.a $(CRNLIB)/libjetset.a \
		$(CRNLIB)/libpacklib.a \
		$(LIB)/libFmcfio.a $(LOCAL)

stdtstq: stdtstq.o $(LIBS)
	$(F77) -o stdtstq stdtstq.o \
		$(LIB)/libstdhep.a \
		$(QQLIB) $(TYPSCN) \
		$(CRNLIB)/libpacklib.a

stdtstxin: stdtstxin.o $(LIBSCX)
	$(CC) -g -o stdtstxin stdtstxin.o \
		$(LIBSCX) $(LOCAL)

stdtstxout: stdtstxout.o $(LIBSCX)
	$(CC) -g -o stdtstxout stdtstxout.o \
		$(LIBSCX) $(LOCAL)

clean:
	rm -f *.o

realclean:
	rm -f stdtst stdtsth stdtsthz stdtsti stdtstiz
	rm -f stdtstio stdtstioz stdtstiom stdtstiox
	rm -f stdtstj stdtstjx stdtstjz stdtstp stdtstpx
	rm -f stdtstxin stdtstxout
	rm -f log.* *.bak *.o

#------------------------------------------

testhstz.o: testhst.F
	$(F77) $(ZFLAGS) -c -o testhstz.o testhst.F

#------------------------------------------

.SUFFIXES : .o .c .F .f

.F.o:
	$(F77) $(FFLAGS) -c $<
