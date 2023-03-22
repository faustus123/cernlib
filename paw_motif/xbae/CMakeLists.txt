
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# /Imakefile

########################################################################
set_package_flags(xbae)
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#xbae//Imakefile
 
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_MOTIF)
if (CERNLIB_MOTIF)
  set(xbae_CSRC caption.c cell.c clip.c matrix.c version.c)
endif()
  list(TRANSFORM xbae_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../xbae/")
 
set(xbae_esources )
if (CERNLIB_BUILD_STATIC)
add_library(xbae_static STATIC ${xbae_esources}
                             ${xbae_CSRC} 
)
target_include_directories(xbae_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(xbae_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(xbae_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(xbae_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(xbae_static PRIVATE ${X11_LIBRARIES})
target_link_libraries(xbae_static PRIVATE ${X11_Xt_LIB})
target_link_libraries(xbae_static PRIVATE ${X11_Xaw_LIB})
set_target_properties(xbae_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME xbae)
endif()
