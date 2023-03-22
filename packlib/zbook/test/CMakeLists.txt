set( SRCS_F recovb.F recovz.F zepex1.F zepex2.F zexam1.F zexam2.F 
    zexam3.F zexam4.F zexam5.F zexam6.F zexam7.F zexam8.F zexam9.F)
list(TRANSFORM SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")
add_library(zbookt STATIC ${SRCS_F} )
target_include_directories(zbookt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../  )

CLCernlibFortranProgramTarget(zexam zexam.F "L" zbookt mathlib_static kernlib_static packlib_static)

CLATestTarget(zexam)
