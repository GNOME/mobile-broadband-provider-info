<?xml version="1.0" encoding="utf-8"?>

<!-- THIS WORK IS IN PUBLIC DOMAIN:
The person or persons who have associated work with this document
(the "Dedicator" or "Certifier") hereby either (a) certifies that, to the best
of his knowledge, the work of authorship identified is in the public domain of
the country from which the work is published, or (b) hereby dedicates whatever
copyright the dedicators holds in the work of authorship identified below
(the "Work") to the public domain. A certifier, moreover, dedicates any
copyright interest he may have in the associated work, and for these purposes,
is described as a "dedicator" below.

A certifier has taken reasonable steps to verify the copyright status of this
work. Certifier recognizes that his good faith efforts may not shield him from
liability if in fact the work certified is not in the public domain.

Dedicator makes this dedication for the benefit of the public at large and to
the detriment of the Dedicator's heirs and successors. Dedicator intends this
dedication to be an overt act of relinquishment in perpetuity of all present
and future rights under copyright law, whether vested or contingent, in the
Work. Dedicator understands that such relinquishment of all rights includes the
relinquishment of all rights to enforce (by lawsuit or otherwise) those
copyrights in the Work.

Dedicator recognizes that, once placed in the public domain, the Work may be
freely reproduced, distributed, transmitted, used, modified, built upon, or
otherwise exploited by anyone for any purpose, commercial or non-commercial,
and in any way, including by methods that have not yet been invented or
conceived.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">

    <xsl:comment> Automatically generated from serviceproviders.xml </xsl:comment>
    <xsl:for-each select="comment()">
      <xsl:copy/>
    </xsl:for-each>

    <apns version="8">
      <xsl:text>&#xa;</xsl:text>
      <xsl:for-each select="serviceproviders/country/provider/gsm/apn">
        <xsl:text>&#x9;</xsl:text>
        <apn>

          <xsl:attribute name="carrier">
            <xsl:choose>
              <xsl:when test="name">
                <xsl:value-of select="name" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="../../name" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>

          <xsl:attribute name="mcc">
            <xsl:value-of select="../network-id/@mcc" />
          </xsl:attribute>

          <xsl:attribute name="mnc">
            <xsl:value-of select="../network-id/@mnc" />
          </xsl:attribute>

          <xsl:attribute name="apn">
            <xsl:value-of select="@value" />
          </xsl:attribute>

          <xsl:if test="username">
            <xsl:attribute name="user">
              <xsl:value-of select="username" />
            </xsl:attribute>
          </xsl:if>

          <xsl:if test="password">
            <xsl:attribute name="password">
              <xsl:value-of select="password" />
            </xsl:attribute>
          </xsl:if>

          <xsl:if test="contains(usage/@type,'mms')">
            <xsl:attribute name="mmsc">
              <xsl:value-of select="mmsc" />
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="contains(mmsproxy,':')">
                <xsl:attribute name="mmsproxy">
                  <xsl:value-of select="substring-before(mmsproxy,':')" />
                </xsl:attribute>
                <xsl:attribute name="mmsport">
                  <xsl:value-of select="substring-after(mmsproxy,':')" />
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="mmsproxy">
                  <xsl:value-of select="mmsproxy" />
                </xsl:attribute>
                <xsl:attribute name="mmsport">8080</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>

          <xsl:attribute name="type">
            <xsl:value-of select="'default'" />
            <xsl:if test="usage/@type = 'internet'">,supl</xsl:if>
            <xsl:if test="usage/@type = 'mms'">,mms</xsl:if>
            <xsl:if test="usage/@type = 'mms-internet-hipri'">,mms,supl,hipri</xsl:if>
            <xsl:if test="usage/@type = 'mms-internet-hipri-fota'">,mms,supl,hipri,fota</xsl:if>
          </xsl:attribute>
        </apn>
        <xsl:text>&#xa;</xsl:text>
      </xsl:for-each>
    </apns>

  </xsl:template>
</xsl:stylesheet>
