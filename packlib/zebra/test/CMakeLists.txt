set(cq_FSRC cqcomp.F cqdata.F cqhead.F cqinit.F cqmust.F cqoct.F cqpos.F)
list(TRANSFORM cq_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/cq/")

set(cqaux_FSRC cqbkin.F cqhids.F cqlods.F)
list(TRANSFORM cqaux_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/cqaux/")

set(cqhi_FSRC cqdivi.F cqdlin.F cqdtab.F cqdwsp.F cqfixu.F cqlink.F cqlrta.F cqmota.F cqstoc.F cqstom.F cqstor.F)
list(TRANSFORM cqhi_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/cqhi/")

set(fqtest_FSRC  fqback.F fqbkco.F fqbkfa.F fqbkfi.F fqbkra.F fqcget.F 
    fqcput.F fqmake.F fqmget.F fqmput.F fqread.F fqrset.F fqtest.F 
    fqtinf.F fqunus.F qcomds.F)
list(TRANSFORM fqtest_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/fqtest/")

set(jqtest_FSRC  jqtest.F taa1.F taaa.F tbb1.F tbb2.F tbbb.F tcc1.F 
    tccc.F tjidle.F tjmuan.F tjmufl.F tjwsp.F)
list(TRANSFORM jqtest_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/jqtest/")

set(mzcot_FSRC mzcote.F)
list(TRANSFORM sq_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/mzcot/")

set(tzebra_FSRC zetece.F zetemq.F zetere.F zeteut.F)
list(TRANSFORM tzebra_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/tzebra/")


add_library(zebtlib_static STATIC ${cq_FSRC}
                                  ${cqaux_FSRC} 
                                  ${cqhi_FSRC}
                                  ${fqtest_FSRC}
                                  ${jqtest_FSRC}
                                  ${mzcote_FSRC}
                                  ${tzebra_FSRC}
)
target_include_directories(zebtlib_static PRIVATE ${PROJECT_SOURCE_DIR}/include )
target_include_directories(zebtlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")


CLCernlibFortranProgramTarget(zebmz1 zebmz1.F "A" zebtlib_static packlib_static kernlib_static)

CLCernlibFortranProgramTarget(zebfz1 zebfz1.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz2 zebfz2.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz3 zebfz3.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz4 zebfz4.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz5 zebfz5.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz6 zebfz6.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz7 zebfz7.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz8 zebfz8.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfz9 zebfz9.F "A" zebtlib_static packlib_static kernlib_static)

CLCernlibFortranProgramTarget(zebfc1 zebfc1.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfc2 zebfc2.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebfc3 zebfc3.F "A" zebtlib_static packlib_static kernlib_static)

CLCernlibFortranProgramTarget(zebjz1 zebjz1.F "A" zebtlib_static packlib_static kernlib_static)

CLCernlibFortranProgramTarget(zebrz1 zebrz1.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebrz2 zebrz2.F "A" zebtlib_static packlib_static kernlib_static)
CLCernlibFortranProgramTarget(zebrz3 zebrz3.F "A" zebtlib_static packlib_static kernlib_static)

CLATestTarget("zebmz1 zxtest.dat")

CLATestTarget(zebfz1)
CLATestTarget(zebfz2)
CLATestTarget(zebfz3)
CLATestTarget(zebfz4)
CLATestTarget(zebfz5)
CLATestTarget(zebfz6)
CLATestTarget(zebfz7)
CLATestTarget(zebfz8)
CLATestTarget(zebfz9)

CLATestTarget(zebfc1)
CLATestTarget(zebfc2)
CLATestTarget(zebfc3)

CLATestTarget("zebjz1 jztest.dat")
CLATestTarget(zebrz1)
CLATestTarget(zebrz2)
CLATestTarget(zebrz3)

CopyFile(zxtest.data zxtest.dat)
CopyFile(jztest.data jztest.dat)
