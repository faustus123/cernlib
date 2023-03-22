#
# Platform independent part of make procedure for mcfast io
# tool, included by machine specific makefiles.
#
include Makefile.$(UNAME)

NLIBDIR = $(LIB)

CL_F_OBJS    = mcfio_FPrintDictionary.o \
               mcf_evt_xdr.o mcfio_FBinding.o mcfio_Util1.o \
               mcfio_Direct.o mcfio_SeqDummy.o mcfio_Block.o 

CL_F_OBJS_RBIO = mcfio_FPrintDictionary.o \
               mcf_evt_xdr.o mcfio_FBinding.o mcfio_Util1.o \
               mcfio_Direct.o mcfio_Block.o mcfio_Sequential.o
               
SRCS  =	mcfio_FPrintDictionary.f \
               mcf_evt_xdr.c mcfio_FBinding.c mcfio_Util1.c \
               mcfio_Direct.c mcfio_SeqDummy.c mcfio_Block.c 

SRCS_RBIO  =	mcfio_FPrintDictionary.f \
               mcf_evt_xdr.c mcfio_FBinding.c mcfio_Util1.c \
               mcfio_Direct.c mcfio_Block.c mcfio_Sequential.c
               
INCLS =mcf_xdr.h  mcfio_Dict.h mcfio_Sequential.h \
       mcfio_Block.h  mcfio_Direct.h mcfio_Util1.h  track_offline.h

all: libFmcfio.a libFmcfioRbio.a

install: libFmcfio.a libFmcfioRbio.a
	mv libFmcfio.a $(NLIBDIR)/.
	mv libFmcfioRbio.a $(NLIBDIR)/.
	rm -f $(CL_F_OBJS) mcfio_Sequential.o

libFmcfio.a: $(CL_F_OBJS) 
	$(AR) -urs libFmcfio.a $(CL_F_OBJS) 
	
libFmcfioRbio.a: $(CL_F_OBJS_RBIO) 
	$(AR) -urs libFmcfioRbio.a $(CL_F_OBJS_RBIO) 
	
clean:
	rm -f $(CL_F_OBJS) mcfio_Sequential.o libFmcfio.a
	rm -f $(NLIBDIR)/libFmcfio.a
	rm -f $(NLIBDIR)/libFmcfioRbio.a

# DO NOT DELETE THIS LINE -- make depend depends on it.

mcf_evt_xdr.o: mcf_xdr.h
mcfio_Direct.o: mcf_xdr.h mcfio_Dict.h mcfio_Util1.h mcfio_Direct.h
mcfio_SeqDummy.c:mcfio_Sequential.h
mcfio_Util1.o: mcf_xdr.h mcfio_Dict.h mcfio_Util1.h mcfio_Direct.h \
                mcfio_Sequential.h
mcfio_block.o: mcf_xdr.h mcfio_Dict.h mcfio_Util1.h mcfio_Block.h              

