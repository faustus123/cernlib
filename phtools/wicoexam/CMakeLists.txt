CLCernlibFortranProgramTarget(wicoex  wicoex.F "A" phtools_static kernlib_static  )
set_target_properties(wicoex        PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE})
CLATestTarget(wicoex)
