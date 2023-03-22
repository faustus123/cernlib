set(SRCS_F kbhdr.F m433t.F m442t.F m443t.F z100t.F z265t.F z268t.F z009t.F)

if (CERNLIB_VAXVMS OR CERNLIB_IBMVM)
  list(APPEND SRCS_F z313t.F)
endif()

if (CERNLIB_IBMVM)
  list(APPEND SRCS_F m444t.F z305t.F z307t.F)
endif()
list(TRANSFORM SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")

add_library(kernbitt ${SRCS_F})
target_include_directories(kernbitt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/)
target_include_directories(kernbitt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../)
target_include_directories(kernbitt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../)

CLCernlibFortranProgramTarget(kbtest kbtest.F "A" kernbitt kernlib_static ${X11_Xt_LIB} ${X11_LIBRARIES})

CopyFile(namefd.input fatmen.names)

CLATestTarget("kbtest fatmen.names")
