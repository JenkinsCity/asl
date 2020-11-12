<?xm version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" encoding="UTF-8" indent="yes" />
    <xsl:variable name="ci.tools.settings" select="/project[@name='asl-tasks-settings']" />

    <xsl:template match="/">
        <xsl:if test="count($ci.tools.settings)">
          <xsl:apply-templates select="$ci.tools.settings/property" mode="ci.tools.setting"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="property" mode="ci.tools.setting">
      <xsl:value-of select="@name" />=<xsl:value-of select="@value"/>
      <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
