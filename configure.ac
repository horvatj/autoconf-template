AC_PREREQ([2.69])
AC_COPYRIGHT ([Indiecam GmbH])
AC_INIT([autotools], [0.1], [johann@indiecam.com])
AM_INIT_AUTOMAKE([subdir-objects])
AC_CANONICAL_HOST
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([config.h])

# ---------------------------------------
# Checks for programs.
# ---------------------------------------
AM_PROG_LIBTOOL
AC_ISC_POSIX
AC_PROG_CXX
AC_PROG_CC
AC_PROG_CPP
AC_HEADER_STDC
AC_PROG_INSTALL

# ---------------------------------------
# Initialize pkg-config.
# ---------------------------------------
PKG_PROG_PKG_CONFIG
PKG_INSTALLDIR

# ---------------------------------------
# Initialize libtool.
# ---------------------------------------
LT_LANG([C++])
          
# ---------------------------------------
# Print out platform compiling on/for.
# ---------------------------------------
AC_MSG_NOTICE([compiling platform is: ${host}])

# ---------------------------------------
# Check endianess.
# ---------------------------------------
AC_C_BIGENDIAN
if test "$ac_cv_c_bigendian" = yes ; then
	HOST_BIGENDIAN=1
	AC_MSG_NOTICE([compiling on a host with big endian byte order...])
else
	HOST_BIGENDIAN=0                                               
	AC_MSG_NOTICE([compiling on a host with little endian byte order...])
fi
AC_DEFINE_UNQUOTED(HOST_BIGENDIAN,$HOST_BIGENDIAN,[Native cpu byte order: 1 if big-endian (PowerPC, Motorola) or 0 if little-endian (Intel)])


# ---------------------------------------
# Checks for libraries.
# ---------------------------------------
# ---------------------------------------
# libxml++
# ---------------------------------------
PKG_CHECK_MODULES(XML, libxml++-2.6, [ 
    AC_SUBST(XML_CFLAGS)
    AC_SUBST(XML_LIBS)
],
[
	AC_MSG_ERROR([
    Could not find libxml++-2.6
 	])
])
PREDEFINED_MACROS="$PREDEFINED_MACROS -DHAVE_LIBXMLXX=1"

AC_MSG_NOTICE([  XML_CFLAGS     : $XML_CFLAGS])
AC_MSG_NOTICE([  XML_LIBS       : $XML_LIBS])

# ---------------------------------------
# libtiff
# ---------------------------------------
PKG_CHECK_MODULES(TIFF, libtiff-4, [ 
    AC_SUBST(TIFF_CFLAGS)
    AC_SUBST(TIFF_LIBS)
],
[
	AC_MSG_ERROR([
    Could not find libtiff-4
 	])
])
PREDEFINED_MACROS="$PREDEFINED_MACROS -DHAVE_LIBTIFF=1"

AC_MSG_NOTICE([  TIFF_CFLAGS     : $TIFF_CFLAGS])
AC_MSG_NOTICE([  TIFF_LIBS       : $TIFF_LIBS])

# ---------------------------------------
# boost
# ---------------------------------------
AX_BOOST_BASE
AX_BOOST_FILESYSTEM
AX_BOOST_PROGRAM_OPTIONS
AX_BOOST_REGEX
AX_BOOST_SYSTEM

# ---------------------------------------
# Checks for header files.
# ---------------------------------------

# ---------------------------------------
# Checks for typedefs, structures, and compiler characteristics.
# ---------------------------------------

# ---------------------------------------
# Checks for library functions.
# ---------------------------------------

# ---------------------------------------
# Configure argumets.
# ---------------------------------------
AC_ARG_ENABLE(debug,
  AS_HELP_STRING([--enable-debug],
  [enable debugging, default: no]),
  [case "${enableval}" in
    yes) debug=true ;;
    no)  debug=false ;;
     *)   AC_MSG_ERROR([bad value ${enableval} for --enable-debug]);;
  esac],
  [debug=false])
AM_CONDITIONAL(DEBUG, test x"$debug" = x"true")
if test "$debug" = true ; then
  AC_DEFINE_UNQUOTED(_DEBUG_, 1, [Debug Mode enabled])
  AC_MSG_NOTICE([debug mode enabled.])
  CXXFLAGS="-g3 -O0"
  CFLAGS  ="-g3 -O0"
else
  AC_MSG_NOTICE([debug mode disabled.])
fi

# ---------------------------------------
# Output.
# ---------------------------------------
AC_OUTPUT( \
  Makefile \
	src/Makefile \
)
