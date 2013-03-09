<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  exclude-result-prefixes="msxml umbraco.library">


    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:param name="currentPage"/>

    <!-- Input the documenttype you want here -->
    <xsl:variable name="level" select="1"/>

    <xsl:template match="/">

  <div class="utilNavigation">    
 <ul>
       <li >
         <xsl:if test="$currentPage/@id = $currentPage/ancestor-or-self::* [@level=$level]/@id">
             
         </xsl:if>
        
       </li>
      <xsl:for-each select="$currentPage/ancestor-or-self::* [@level=$level]/* [@isDoc and string(showInUtil) = '1']">
  <li>
     <xsl:if test="@id = $currentPage/@id">
       
      </xsl:if>
    [ <a  href="{umbraco.library:NiceUrl(@id)}">
      <span><xsl:value-of select="@nodeName"/></span>
    </a> ]
  </li>
  
  
</xsl:for-each>
</ul>
		</div>
    </xsl:template>

</xsl:stylesheet>