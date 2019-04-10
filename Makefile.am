## Process this file with automake to produce Makefile.in

SP_XML_DB = serviceproviders.xml

dist_pkgdata_DATA = $(SP_XML_DB) serviceproviders.2.dtd

EXTRA_DIST = mobile-broadband-provider-info.pc.in \
	apns-conf.xsl

CLEANFILES = apns-conf.xml

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = mobile-broadband-provider-info.pc

apns-conf.xml: $(top_srcdir)/apns-conf.xsl $(top_srcdir)/$(SP_XML_DB)
	$(AM_V_GEN) $(XSLTPROC) --output $@ $^

pkgdata_DATA = apns-conf.xml

check-local:
	xmllint --valid $(top_srcdir)/$(SP_XML_DB) 2>&1 > /dev/null || exit 1;

