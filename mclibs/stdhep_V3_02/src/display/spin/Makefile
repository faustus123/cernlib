# SCCS ID: Makefile.common 1.2 5/1/92
#
# Platform independent part of make procedure for Nirvana spin widget, 
# included by machine specific makefiles.
#
include Makefile.$(UNAME)

DEBUG=-g
#DEBUG=

OBJS = Spin.o geometry.o
SRCS = Spin.c geometry.c
INCLS= Spin.h SpinP.h geometry.h

NLIBDIR = $(STDHEP_DIR)/lib

all: libSpin.a

libSpin.a: Spin.o geometry.o
	$(AR) -urs libSpin.a Spin.o geometry.o

install:
	-mv libSpin.a $(NLIBDIR)

clean:
	rm -f $(OBJS) libSpin.a

# DO NOT DELETE THIS LINE -- make depend depends on it.

Spin.o: geometry.h
Spin.o: SpinP.h
Spin.o: Spin.h
geometry.o: geometry.h
