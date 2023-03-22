#!/bin/sh
# **********************************************************************
# * setup    Program Library Installlation ENVironment                 *
# *                                                                    *
# * Garren     6/17/94 Configured for stdhep                           *
# **********************************************************************
 
UNAME=`uname`; export UNAME
PDG_MASS_TBL=$STDHEP_DIR/pdg_mass.tbl;	export PDG_MASS_TBL
stdrepair=$STDHEP_DIR/bin/stdrepair; export stdrepair
Space=$STDHEP_DIR/bin/Space; export Space
Phase=$STDHEP_DIR/bin/Phase; export Phase
