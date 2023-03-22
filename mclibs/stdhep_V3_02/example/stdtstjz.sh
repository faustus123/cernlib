#!/bin/csh
# run the standard jetset translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup lund 
set echo

 mv stdtstjz.lpt stdtstjz.lpt.bak
 mv stdtstjz.fz  stdtstjz.fz.bak
 stdtstjz
