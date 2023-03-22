
#kernlib/kernnum/test/numchk0:
set(numchk0_SRCS_F c205d3.F  c205r3.F  cvdist.F  dvdist.F   rvdist.F  stamp.F)

#kernlib/kernnum/test/numchk1:
set(numchk1_SRCS_F check1.F  e100ch.F  e104ch.F  e105ch.F  e208ch.F )

#kernlib/kernnum/test/numchk2:
set(numchk2_SRCS_F check2.F  d509ch.F  d509f.F  d703ch.F  d704ch.F  d704tm.F  f010c.F  f010ch.F  f010d.F  
f010mc.F  f010md.F  f010mr.F  f010r.F  f406ch.F  f406rd.F  f406rr.F  f406sd.F  f406sr.F  f406zd.F  f406zr.F)

#kernlib/kernnum/test/numchk3:
set(numchk3_SRCS_F check3.F  f002ch.F      f002dat2.inc  f004ch.F  f012ch.F  g901ch.F   n001ch.F  taadd.F  tamula.F  tamuna.F  tascl.F  tasub.F
e106ch.F  f002dat1.inc  f003ch.F      f011ch.F  g900ch.F  Imakefile  nrdist.F  tadiv.F  tamul.F   tasca.F   tascs.F)

#kernlib/kernnum/test/numchk4:
set(numchk4_SRCS_F c205ch.F  c205d1.F  c205r1.F  check4.F)


set(DIRLIST numchk0 numchk1 numchk2 numchk3 numchk4)
set(ALL_SRCS_F )
foreach(fl ${DIRLIST})
  list(TRANSFORM ${fl}_SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/${fl}/")
  set(ALL_SRCS_F ${ALL_SRCS_F} ${${fl}_SRCS_F})
endforeach(fl ${DIRLIST})
add_library(kernnumt ${ALL_SRCS_F})
target_include_directories(kernnumt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/)
target_include_directories(kernnumt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../)
target_include_directories(kernnumt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../)

CLCernlibFortranProgramTarget(kernnumtest "test.F abend.F" "L" kernlib_static kernnumt)

CLATestTarget(kernnumtest)
