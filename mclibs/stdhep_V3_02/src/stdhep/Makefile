#
# stdhep makefile
#
include Makefile.$(UNAME)

CFLAGS = -g $(CFLG) -I../../stdhep -I../mcfio
INCS = -I../../stdhep -I$(LUND_DIR)/jetset74 -I$(HERWIG_DIR)/herwig58 -I$(ISAJET_DIR)/isajet -I../qq -I../mcfio

FOBJS =	stdversn.o stdflhwxsec.o stdrqqbg.o stdlst.o \
	stdrstbg.o hepchg.o stdflpyxsec.o stdrstnd.o \
	hepcmp.o stdparent.o stdsort.o heplst.o \
	stdparentlst.o stdspin.o hepnam.o lunhep.o stdqqadd.o stdstdsclst.o \
	heprd.o lutran.o stdqqdcy.o heprdm.o stdqquset.o stdwbgn.o \
	heptree.o pdgprtb.o  stdquarkcnt.o stdwend.o hepwrt.o pdgrdtb.o \
	stdquarklst.o stdwhwbg.o hepzinit.o pdgtran.o  stdquarks.o \
	hepzrd.o qqhep.o stdrbgn.o hepzwrt.o qqtran.o stdrd.o \
	stdwlubg.o hptrlsth.o stdchg.o stdrdbuf.o stdwpybg.o \
	stdchgdsclst.o stdrend.o  stdwqqbg.o hptrlstj.o stdcquarks.o \
	stdrhwbg.o stdwrt.o hptrlstq.o stddautr.o stdwstbg.o \
	hpzflb.o stddautrlst.o stdwstnd.o hpzflc.o stddecayqq.o \
	stdrlubg.o stdzero.o hwghep.o stddscndlst.o stdrotboost.o stdzeroqq.o \
	hwtran.o stdexpname.o stdrpybg.o stdoldcopy.o hep2geant.o gtran.o
IOBJS =	isaprtlst.o stdflisxsec.o  isflavr.o islabl.o istran.o \
	stdwisbg.o stdwisnd.o hptrlsti.o stdrisbg.o stdrisnd.o isahep.o
XOBJS = stdtcopy.o stdxend.o stdxrd.o stdxrdm.o stdxrinit.o stdxwevt.o \
        stdxwinit.o stdxwrt.o stdxwcm1.o stdxropen.o stdxwopen.o
COBJS =	mcf_Stdhep_xdr.o stdhep_internal_utils.o stdhep_mcfio.o

#------------------------------------------

all: libstdhep.a libstdhepC.a stdrepair

libstdhep.a:	$(FOBJS) $(XOBJS) mcf_Stdhep_xdr.o $(IOBJS)
	$(AR) -urs libstdhep.a $(FOBJS) $(XOBJS) mcf_Stdhep_xdr.o $(IOBJS)

libstdhepC.a:	$(COBJS)
	$(AR) -urs libstdhepC.a $(COBJS)

stdrepair:   stdrepair.o stdrd_old.o libstdhep.a
	$(F77) -o stdrepair stdrepair.o stdrd_old.o \
		libstdhep.a

install: libstdhep.a stdrepair
	mv libstdhep.a $(LIB)
	mv libstdhepC.a $(LIB)
	mv stdrepair   $(BIN)
	rm -f *.o

clean:
	rm -f *.o *.a stdrepair

#------------------------------------------

.SUFFIXES : .o .c .F .f

.F.o:
	$(F77) $(FFLAGS) -c $<
