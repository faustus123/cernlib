set(SRCS_F b100m.F b101m.F b102m.F b300m.F blkdt.F c200m.F
     c201m.F c201s.F c202m.F c206m.F c206s1.F c207m.F c208m.F
     c209m.F c209s.F c210m.F c300m.F c301m.F c302m.F
     c303m.F c304m.F c306m.F c307m.F c310m.F c312m.F
     c313m.F c315m.F c316m.F c318m.F c320m.F c321m.F
     c322m.F c323m.F c324m.F c326m.F c327m.F c328m.F c330m.F c331m.F
     c333m.F c334m.F c335m.F c336m.F c337m.F c338m.F c339m.F
     c340m.F c342m.F c343d.F c343m.F c343s.F
     c345m.F c346m.F c347m.F c348m.F c349m.F d101m.F
     d103m.F d104m.F d105m.F d105s1.F d105s2.F d105s3.F
     d107m.F d108m.F d110m.F d110s1.F d110s2.F d110s3.F d110s4.F
     d110s5.F d110s6.F d110s7.F d110s8.F d113m.F d115f1.F d115f2.F
     d115f3.F d115m.F d200m.F d201m.F d202m.F d203m.F d401m.F
     d503m.F d510m.F d601m.F d705m.F d706m.F
     e211m.F e406f1.F e406f2.F e406f3.F
     e406f4.F e406m.F e407m.F e408m.F f106m.F f106s1.F f106s2.F
     f500m.F fc346.F funct.F g100m.F g101m.F g102m.F g104m.F
     g105m.F g106m.F g110m.F g115m.F g116m.F gtopen.F h101m.F
     h301m.F header.F itest.F pagend.F rc346.F u501m.F
     v100m.F v101m.F v106m.F v110m.F v135m.F v136m.F v137m.F
     v138m.F v152m.F v202m.F v700m.F vecdraw.F)

if (NOT CERNLIB_DOUBLE)
  list(APPEND SRCS_F  c344m.F c344q.F)
endif()

if (CERNLIB_QUAD OR NOT  CERNLIB_IBMRT)
  list(APPEND SRCS_F d103q.F)
endif()

if (CERNLIB_QUAD AND CERNLIB_DOUBLE)
  list(APPEND SRCS_F c343q.F)
endif()

if (CERNLIB_QUAD)
  list(APPEND SRCS_F  c302q.F c310q.F)
endif()

list(TRANSFORM SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")
add_library(gentest STATIC ${SRCS_F} )
target_include_directories(gentest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../  )
target_compile_definitions(gentest PRIVATE FOOVECDRAW)

CLCernlibFortranProgramTarget(gent main.F "L" gentest mathlib_static kernlib_static packlib_static)
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/Y.txt "Y") 

CLATestTarget("gent < Y.txt")
