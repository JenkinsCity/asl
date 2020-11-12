<?xm version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:variable name="ci.tools.settings" select="/project[@name='asl-tasks-settings']" />

    <xsl:template match="/">
        <xsl:if test="count($ci.tools.settings)">
            <xsl:element name="xsl:stylesheet" namespace="http://www.w3.org/1999/XSL/Transform">
                <xsl:attribute name="version">2.0</xsl:attribute>
                <xsl:apply-templates select="$ci.tools.settings/property" mode="ci.tools.setting"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="property" mode="ci.tools.setting">
        <xsl:element name="xsl:variable">
            <xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
