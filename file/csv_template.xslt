<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:variable name="separator">~</xsl:variable>
  <xsl:template match="/">
    <xsl:for-each select="//tr[not(th)]">
      <xsl:variable name="tr" select="position()"/>
      <xsl:for-each select="td">
        <xsl:variable name="td" select="position()"/>
        <xsl:if test="$td > 1">
          <xsl:value-of select="$separator"/>
        </xsl:if>
        <xsl:if test="not(span)">
          <xsl:value-of select="../preceding-sibling::tr[td[$td]/span][1]/td[$td]/span[normalize-space()]"/>
        </xsl:if>
        <xsl:if test="span">
          <xsl:value-of select="normalize-space(span)"/>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>&#xA;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
