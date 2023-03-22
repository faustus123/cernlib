#if defined(CERNLIB_IBMRT)
#ifndef CERNLIB_IBMRS
#define CERNLIB_IBMRS
#endif
#endif

#if defined(CERNLIB_VAXVMS)||defined(CERNLIB_VAXULTRIX)
#ifndef CERNLIB_VAX
#define CERNLIB_VAX
#endif
#endif

#if defined(CERNLIB_VAX)
#ifndef CERNLIB_DOUBLE
#define CERNLIB_DOUBLE
#endif
#endif

#if (defined(CERNLIB_UNIX))&&(!defined(CERNLIB_SINGLE))
#ifndef CERNLIB_DOUBLE
#define CERNLIB_DOUBLE
#endif
#endif

#if defined(CERNLIB_VAXVMS)
#ifndef CERNLIB_NUMDE
#define CERNLIB_NUMDE
#endif

#ifndef CERNLIB_NUMCDBLE
#define CERNLIB_NUMCDBLE
#endif

#ifndef CERNLIB_NUMD38
#define CERNLIB_NUMD38
#endif

#ifdef CERNLIB_NUMD279
#undef CERNLIB_NUMD279
#endif
#endif

#if defined(CERNLIB_LINUX)
#ifndef CERNLIB_NUMLN
#define CERNLIB_NUMLN
#endif
#if defined(CERNLIB_QMLXIA64)
#ifndef CERNLIB_NUM64
#define CERNLIB_NUM64
#endif
#endif
#endif

#if defined(CERNLIB_MSDOS)
#ifndef CERNLIB_NUMMS
#define CERNLIB_NUMMS
#endif
#endif

#if defined(CERNLIB_WINNT)
#ifndef CERNLIB_NUMNT
#define CERNLIB_NUMNT
#endif
#endif

#if defined(CERNLIB_LINUX)||defined(CERNLIB_MSDOS)
#ifndef CERNLIB_NUMCDBLE
#define CERNLIB_NUMCDBLE
#endif
#ifdef CERNLIB_NUMD38
#undef CERNLIB_NUMD38
#endif
#ifndef CERNLIB_NUMD279
#define CERNLIB_NUMD279
#endif
#endif

#if (defined(CERNLIB_UNIX))&&(!defined(CERNLIB_MSDOS))&&(!defined(CERNLIB_LINUX))
#ifndef CERNLIB_NUMAP
#define CERNLIB_NUMAP
#endif
#ifdef CERNLIB_NUMCDBLE
#undef CERNLIB_NUMCDBLE
#endif
#ifndef CERNLIB_NUMD38
#define CERNLIB_NUMD38
#endif
#ifdef CERNLIB_NUMD279
#undef CERNLIB_NUMD279
#endif
#endif
#ifndef CERNLIB_NUMLOPRE
#define CERNLIB_NUMLOPRE
#endif
#ifdef CERNLIB_NUMHIPRE
#undef CERNLIB_NUMHIPRE
#endif
#ifndef CERNLIB_NUMRDBLE
#define CERNLIB_NUMRDBLE
#endif
#ifndef CERNLIB_NUME38
#define CERNLIB_NUME38
#endif
#ifdef CERNLIB_NUME75
#undef CERNLIB_NUME75
#endif
#ifdef CERNLIB_NUME293
#undef CERNLIB_NUME293
#endif
#ifdef CERNLIB_NUME2465
#undef CERNLIB_NUME2465
#endif
#ifdef CERNLIB_NUMD75
#undef CERNLIB_NUMD75
#endif
#ifdef CERNLIB_NUMD2465
#undef CERNLIB_NUMD2465
#endif
#ifndef CERNLIB_NUMCHK1
#define CERNLIB_NUMCHK1
#endif
#ifndef CERNLIB_NUMCHK2
#define CERNLIB_NUMCHK2
#endif
#ifndef CERNLIB_NUMCHK3
#define CERNLIB_NUMCHK3
#endif
#ifndef CERNLIB_NUMCHK4
#define CERNLIB_NUMCHK4
#endif
