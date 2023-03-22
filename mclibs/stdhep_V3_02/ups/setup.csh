#!/bin/csh
# **********************************************************************
# * setup    Program Library Installlation ENVironment                 *
# *                                                                    *
# * Garren     6/17/94 Configured for stdhep                           *
# **********************************************************************
 
  setenv UNAME `uname`
  setenv PDG_MASS_TBL  $STDHEP_DIR/pdg_mass.tbl
  alias  stdrepair $STDHEP_DIR/bin/stdrepair
  alias  Phase $STDHEP_DIR/bin/Phase
  alias  Space $STDHEP_DIR/bin/Space
