<?xm version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:param name="layerNames" />

    <xsl:template match="/">
        <xsl:if test="starts-with($layerNames, '/') and string-length($layerNames) > 0">
            <xsl:variable name="restLayerNames" select="substring-after($layerNames, '/')" />
            <xsl:call-template name="ci.add.layer">
                <xsl:with-param name="layerNames" select="$restLayerNames" />
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="string-length($layerNames) = 0">
            <xsl:copy-of select="/child::node()" />
        </xsl:if>
    </xsl:template>

    <xsl:template name="ci.add.layer">
        <xsl:param name="layerNames" />
        <xsl:choose>
            <xsl:when test="contains($layerNames, '/')">
                <xsl:variable name="midLayerName" select="substring-before($layerNames, '/')" />
                <xsl:variable name="restLayerNames" select="substring-after($layerNames, '/')" />
                <layer>
                    <xsl:attribute name="name"><xsl:value-of select="$midLayerName"/></xsl:attribute>
                    <xsl:call-template name="ci.add.layer">
                        <xsl:with-param name="layerNames" select="$restLayerNames" />
                    </xsl:call-template>
                </layer>
            </xsl:when>
            <xsl:otherwise>
                <layer>
                    <xsl:variable name="lastLayerName" select="$layerNames" />
                    <xsl:attribute name="name"><xsl:value-of select="$lastLayerName"/></xsl:attribute>
                    <xsl:copy-of select="/child::node()" />
                </layer>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
