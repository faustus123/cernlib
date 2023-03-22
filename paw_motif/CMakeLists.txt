
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# cdf/Imakefile
# cmotif/Imakefile
# code/Imakefile
# fmotif/Imakefile
# fpanelsc/Imakefile
# fpanelsf/Imakefile
# uimx/Imakefile

########################################################################
set_package_flags(paw_motif)
#paw_motif/cdf/Imakefile
 
  set(paw_motif_cdf_CDFSRC pamcdf.cdf)
  list(TRANSFORM paw_motif_cdf_CDFSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/cdf/")
 
#paw_motif/cmotif/Imakefile
 
  set(paw_motif_cmotif_CSRC about.c att_color.c att_define_color.c att_font.c att_general.c att_geometry.c att_main.c attatch.c axis.c chain_tree.c cuts.c file.c histo.c init.c mail.c ntuple.c ntwork.c
 readfs.c scan.c style.c utils.c)
  list(TRANSFORM paw_motif_cmotif_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/cmotif/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#paw_motif/code/Imakefile
 
  set(paw_motif_code_FSRC pawintm.F pawpp.F)
#include "pilot.h"
  list(TRANSFORM paw_motif_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/code/")
 
#paw_motif/fmotif/Imakefile
 
  set(paw_motif_fmotif_FSRC cube.F gettitle.F matlab.F matrow.F mhlattr.F ntwchk.F ntwini.F pamloc.F pbhist.F pbhlun.F pbpiaf.F pbplun.F plotisto.F pmhist.F pminit.F show_chain.F)
#ORIGINAL #if (defined(CERNLIB_LINUX) && (!defined(CERNLIB_GFORTRAN)))
if (CERNLIB_LINUX AND NOT CERNLIB_GFORTRAN)
endif()
  list(TRANSFORM paw_motif_fmotif_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/fmotif/")
 
#paw_motif/fpanelsc/Imakefile
 
  set(paw_motif_fpanelsc_CSRC adjust.c busy.c cfort.c contpanel.c defaults.c errordb.c examenu.c filemenu.c fileselpanel.c helpmenu.c hfpanel.c lexer.c mainclbs.c mainpanel.c minimenu.c mutil.c parhdrform.c
 parline.c parlineform.c scanmenu.c scanpanel.c text.c transmenu.c vectpanel.c vfpanel.c viewmenu.c)
  list(TRANSFORM paw_motif_fpanelsc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/fpanelsc/")
 
#paw_motif/fpanelsf/Imakefile
 
  set(paw_motif_fpanelsf_FSRC fpgetpnam.F fpgoptd.F fpgoptu.F fpgoptw.F fphgetfmod.F fphgetrng.F fphgrend.F fphgrinit.F fphgrupdt.F fphplot.F fphsetfmod.F fphsetid.F fphsetrng.F fphstart.F fpmninit.F fpsavev.F
 fpsetnpar.F fpsetpnam.F fpsetufcn.F fpsoptd.F fpsoptu.F fpsoptw.F fpvexist.F fpvgetfmod.F fpvgetnam.F fpvgrend.F fpvgrinit.F fpvgrupdt.F fpvplot.F fpvset.F fpvsetfmod.F fpvstart.F)
  list(TRANSFORM paw_motif_fpanelsf_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/fpanelsf/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#paw_motif/uimx/Imakefile
 
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_MOTIF)
if (CERNLIB_MOTIF)
  set(paw_motif_uimx_CSRC angleformdialog.c attributesformdialog.c axisformdialog.c chaintree.c closefbdialog.c colordialog.c columnselection.c cuteditor.c cutexpr.c dateformdialog.c definecolordialog.c
 dynamiccedialog.c execdialog.c fileformdialog.c fitformdialog.c fontdialog.c fontsettingsdialog.c generalattributesdialog.c geometrydialog.c hatchstyledialog.c helpdialog.c histostyle.c indentcedialog.c
 labelformdialog.c maildialog.c ntuplebrowser.c ntuplescan.c ntuplework.c opencedialog.c openfbdialog.c orientationformdialog.c rangeformdialog.c saveascedialog.c statformdialog.c styleopendialog.c stylesavedialog.c
 zoneformdialog.c)
endif()
  list(TRANSFORM paw_motif_uimx_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../paw_motif/uimx/")
 
set(paw_motif_esources )
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/cdf/pamcdf.cdf ${CMAKE_CURRENT_BINARY_DIR}/pamcdf.cdf.c)
list(APPEND paw_motif_esources ${CMAKE_CURRENT_BINARY_DIR}/pamcdf.cdf.c)
if (CERNLIB_BUILD_STATIC)
add_library(paw_motif_static STATIC ${paw_motif_esources}
                             ${paw_motif_cdf_CDFSRC} 
                             ${paw_motif_cmotif_CSRC} 
                             ${paw_motif_code_FSRC} 
                             ${paw_motif_fmotif_FSRC} 
                             ${paw_motif_fpanelsc_CSRC} 
                             ${paw_motif_fpanelsf_FSRC} 
                             ${paw_motif_uimx_CSRC} 
)
target_include_directories(paw_motif_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(paw_motif_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(paw_motif_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(paw_motif_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(paw_motif_static PRIVATE ${X11_LIBRARIES})
install(TARGETS paw_motif_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(paw_motif_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME pawlib-lesstif)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(paw_motif SHARED ${paw_motif_esources}
                             ${paw_motif_cdf_CDFSRC} 
                             ${paw_motif_cmotif_CSRC} 
                             ${paw_motif_code_FSRC} 
                             ${paw_motif_fmotif_FSRC} 
                             ${paw_motif_fpanelsc_CSRC} 
                             ${paw_motif_fpanelsf_FSRC} 
                             ${paw_motif_uimx_CSRC} 
)
target_include_directories(paw_motif PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(paw_motif PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(paw_motif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(paw_motif PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(paw_motif PRIVATE ${X11_LIBRARIES})
install(TARGETS paw_motif DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(paw_motif        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME pawlib-lesstif SOVERSION 3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libpawlib-lesstif.so.3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libpawlib-lesstif.so.3_${COMPSUFFIX})
endif()
