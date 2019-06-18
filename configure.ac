AC_PREREQ(2.52)

AC_INIT(mobile-broadband-provider-info,
	20190618,
	[https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/issues],
	mobile-broadband-provider-info)
AM_INIT_AUTOMAKE([foreign no-dist-gzip dist-xz])
AM_MAINTAINER_MODE([enable])

AC_PATH_PROG(XSLTPROC, xsltproc)
if test -z "$XSLTPROC"; then
	AC_MSG_ERROR([xsltproc not found])
fi

AC_CONFIG_FILES([
	Makefile
	mobile-broadband-provider-info.pc
])
AC_OUTPUT
