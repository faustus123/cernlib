#!/bin/csh
# run the standard isajet translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup isajet
set echo

 mv stdtstiz.fz  stdtstiz.fz.bak
 mv stdtstiz.lpt stdtstiz.lpt.bak
 stdtstiz
