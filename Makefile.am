## Process this file with automake to produce Makefile.in

SP_XML_DB = serviceproviders.xml

dist_pkgdata_DATA = $(SP_XML_DB) serviceproviders.2.dtd

EXTRA_DIST = mobile-broadband-provider-info.pc.in

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = mobile-broadband-provider-info.pc

check-local:
	xmllint --valid $(top_srcdir)/$(SP_XML_DB) 2>&1 > /dev/null || exit 1;

