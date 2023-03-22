
set(micky_SRCS_F chkver.F exitrc.F minit.F mveric.F mverif.F mverii.F 
     mveuns.F newguy.F prtest.F tchdir.F time77.F timing.F)

set(npbyt_SRCS_F  tbyt.F tmbyt.F tvcbyt.F)

set(pchar_SRCS_F  tbaby.F tpkch.F tublow.F tuctoh.F)

set(pdiv_SRCS_F  tmaxmu.F trandm.F tscale.F tsortn.F ttrigo.F)

set(pm432_SRCS_F  ticnth.F tlenoc.F)

set(pm434_SRCS_F  tvxinv.F)

set(pmatrix_SRCS_F  tmxm.F tmxtrp.F tmxuty.F)

set(ptlpac_SRCS_F  ttlpac.F)

set(ptrpac_SRCS_F  ttrcho.F ttrinv.F ttrla.F)

set(putil_SRCS_F  tcocop.F tiucha.F tiucom.F tiusam.F tucopy.F tuopt.F tuswop.F  tuzero.F)

set(pvect_SRCS_F  tcross.F tlor.F trot.F)

set(pvpack_SRCS_F  tvec.F)

set(DIRLIST micky npbyt pchar pdiv pm432 pm434 pmatrix ptlpac ptrpac putil pvect pvpack)
set(ALL_SRCS_F )
foreach(fl ${DIRLIST})
  list(TRANSFORM ${fl}_SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/${fl}/")
  set(ALL_SRCS_F ${ALL_SRCS_F} ${${fl}_SRCS_F})
endforeach(fl ${DIRLIST})
  add_library(kerngent ${ALL_SRCS_F})
  target_include_directories(kerngent PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/)
  target_include_directories(kerngent PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../)
  target_include_directories(kerngent PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../)

CLCernlibFortranProgramTarget(kerngentest test.F "L" kernlib_static kerngent)
target_link_libraries(kerngentest PRIVATE ${X11_Xt_LIB} ${X11_LIBRARIES} )

CLATestTarget(kerngentest)
