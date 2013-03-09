<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  xmlns:vimeo="urn:vimeo"
  exclude-result-prefixes="msxml umbraco.library vimeo ">

  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:variable name="field" select="/macro/field" />

  <xsl:param name="currentPage"/>

  <xsl:template match="/">
    <xsl:if test="string-length($field) &gt; 0 and string-length($currentPage/*[not(isDoc) and local-name() = $field]) &gt; 0">
      <xsl:variable name="item" select="vimeo:GetMedia($currentPage/*[not(isDoc) and local-name() = $field]/value/@dataTypeId, $currentPage/*[not(isDoc) and local-name() = $field]/value)" />
      <xsl:value-of select="$item/EmbedCode" disable-output-escaping="yes" />
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>