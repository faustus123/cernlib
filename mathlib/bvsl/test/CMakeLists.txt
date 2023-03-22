set(SRCS_F copy.F dot.F intg.F iyeqx.F iygex.F iygtx.F iylex.F 
     iyltx.F iynex.F scal.F smod3.F sxpy.F sxy.F vset.F 
     vxpy.F xypwz.F yeqx.F ygex.F ygtx.F ylex.F yltx.F ynex.F)
list(TRANSFORM SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")
add_library(bvsl_static STATIC ${SRCS_F})
target_include_directories(bvsl_static PRIVATE ${PROJECT_SOURCE_DIR}/include )
target_include_directories(bvsl_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")

CLCernlibFortranProgramTarget(bvslt tsbvsl.F "L" bvsl_static mathlib_static kernlib_static)

CLATestTarget(bvslt)
