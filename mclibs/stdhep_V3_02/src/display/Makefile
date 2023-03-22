# SCCS ID: Makefile.common 1.2 5/1/92
#
# Platform independent part of make procedure for Nirvana phase space 
# event display, included by machine specific makefiles.
#
include Makefile.$(UNAME)

DEBUG=-g
#DEBUG=

NLIBDIR = $(LIB)
NBINDIR = $(BIN)

OBJS  =	phase.o panel.o menu.o drawEvent.o pick.o pixmaps.o settings.o \
	rotation.o hepnmg.o stdHepFortranUtil.o \
	Tree.o dispTree.o listNodeHep.o stdHepFiles.o help.o \
	panelSpace.o space.o panelPara.o Space_main.o
SRCS  =	phase.c panel.c menu.c drawEvent.c pick.c pixmaps.c settings.c \
	rotation.c help.c hepnmg.f stdHepFortranUtil.f \
	Tree.c dispTree.c listNodeHep.c stdHepFiles.c \
	panelSpace.c space.c panelPara.c Space_main.c 
INCLS =	drawEvent.h panel.h phaseP.h pixmaps.h settings.h menu.h phase.h \
	pick.h rotation.h stdHepFiles.h tree.h treeP.h dispTree.h \
	listNodeHep.h help.h \
	panelSpace.h space.h panelPara.h
INCS = ../../stdhep

all: libPhaseStdHep.a Phase Space

libPhaseStdHep.a: $(OBJS)
	$(AR) -urs libPhaseStdHep.a $(OBJS)

Phase: Phase.o TestParticles.o libPhaseStdHep.a
	$(CC) $(CFLAGS) $(OPTS) Phase.o  TestParticles.o \
	      libPhaseStdHep.a  -L$(LIB) \
	      -lSpin -lNUtil -lstdhep -lstdhepC -lFmcfio \
	      -L/cern/95b/lib -lpacklib \
	      -o $@ $(LIBS)
      
Space: Space_main.o libPhaseStdHep.a
	$(CC) $(CFLAGS) $(OPTS) Space_main.o \
	      libPhaseStdHep.a -L$(LIB) \
	      -lSpin -lNUtil -lstdhep -lstdhepC -lFmcfio \
	      -L/cern/95b/lib -lpacklib \
	      -o $@ $(LIBS)

help.o: help.c
	$(CC) $(CFLAGS) $(BIGGER_STRINGS) -c help.c -o $@

install:
	-mv libPhaseStdHep.a $(NLIBDIR)/.
	-mv Phase $(NBINDIR)/.
	-mv Space $(NBINDIR)/.

clean:
	rm -f $(OBJS) Phase.o space.o \
	TestParticles.o Phase Space libPhaseStdHep.a
	
sccs_clean: clean
	rm -f Phase.c TestParticles.c $(SRCS) $(INCLS) Makefile.*

sources:
	$(SCCS) get phase
	
depend:
	$(MAKEDEPEND) -fMakefile.common -- $(CFLAGS) -- $(SRCS) Phase.c \
		     space.c TestParticles.c

#------------------------------------------

.SUFFIXES : .o .c .F .f

.F.o:
	$(F77) $(FFLAGS2) -c $<

# DO NOT DELETE THIS LINE -- make depend depends on it.

phase.o: spin/Spin.h
phase.o: phase.h
phase.o: space.h
phase.o: phaseP.h
phase.o: panel.h
phase.o: pixmaps.h
phase.o: pick.h
phase.o: drawEvent.h
phase.o: dispTree.h
panel.o: spin/Spin.h
panel.o: util/DialogF.h
panel.o: phase.h
panel.o: space.h
panel.o: phaseP.h
panel.o: panel.h
panel.o: menu.h
panel.o: pick.h
panel.o: rotation.h
menu.o: phase.h
menu.o: space.h
menu.o: phaseP.h
menu.o: menu.h
menu.o: panel.h
menu.o: settings.h
menu.o: rotation.h
menu.o: stdHepFiles.h
menu.o: pick.h
menu.o: dispTree.h
menu.o: util/printUtils.h
menu.o: util/getfiles.h
menu.o: util/DialogF.h
menu.o: util/misc.h
menu.o: spin/Spin.h
menu.o: util/help.h
menu.o: help.h
drawEvent.o: spin/Spin.h
drawEvent.o: util/stringUtils.h
drawEvent.o: phase.h
drawEvent.o: space.h
drawEvent.o: phaseP.h
drawEvent.o: drawEvent.h
pick.o: spin/Spin.h
pick.o: util/stringUtils.h
pick.o: phase.h
pick.o: space.h
pick.o: phaseP.h
pick.o: pick.h
pick.o: drawEvent.h
pick.o: dispTree.h
pixmaps.o: pixmaps.h
settings.o: phase.h
settings.o: space.h
settings.o: phaseP.h
rotation.o: phase.h
rotation.o: space.h
rotation.o: phaseP.h
help.o: util/help.h
help.o: help.h
Tree.o: tree.h
Tree.o: treeP.h
dispTree.o: tree.h
dispTree.o: phase.h
dispTree.o: space.h
dispTree.o: phaseP.h
dispTree.o: dispTree.h
dispTree.o: pick.h
dispTree.o: spin/Spin.h
dispTree.o: drawEvent.h
dispTree.o: listNodeHep.h
dispTree.o: util/stringUtils.h
listNodeHep.o: phase.h
listNodeHep.o: space.h
listNodeHep.o: phaseP.h
listNodeHep.o: dispTree.h
listNodeHep.o: spin/Spin.h
listNodeHep.o: drawEvent.h
listNodeHep.o: listNodeHep.h
stdHepFiles.o: phase.h
stdHepFiles.o: space.h
stdHepFiles.o: phaseP.h
stdHepFiles.o: spin/Spin.h
stdHepFiles.o: drawEvent.h
panelSpace.o: spin/Spin.h
panelSpace.o: util/DialogF.h
panelSpace.o: phase.h
panelSpace.o: space.h
panelSpace.o: phaseP.h
panelSpace.o: panelSpace.h
panelSpace.o: menu.h
panelSpace.o: pick.h
panelSpace.o: rotation.h
panelPara.o: spin/Spin.h
panelPara.o: util/DialogF.h
panelPara.o: phase.h
panelPara.o: space.h
panelPara.o: phaseP.h
panelPara.o: panelPara.h
panelPara.o: menu.h
panelPara.o: pick.h
panelPara.o: rotation.h
space.o: spin/Spin.h
space.o: phase.h
space.o: space.h
space.o: phaseP.h
space.o: panelSpace.h
space.o: pixmaps.h
space.o: pick.h
space.o: drawEvent.h
space.o: dispTree.h
Phase.o: phase.h
Phase.o: space.h
Phase.o: phaseP.h
Phase.o: spin/Spin.h
Phase.o: drawEvent.h
TestParticles.o: phase.h
