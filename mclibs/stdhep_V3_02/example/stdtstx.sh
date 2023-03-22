#!/bin/csh
# run the standard jetset translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup lund 
set echo

  mv stdtstxout.lpt stdtstxout.lpt.bak
  mv stdtstxin.lpt stdtstxin.lpt.bak
  mv stdtstx.io  stdtstx.io.bak
 stdtstxout >& stdtstxout.lpt 
 stdtstxin >& stdtstxin.lpt 
