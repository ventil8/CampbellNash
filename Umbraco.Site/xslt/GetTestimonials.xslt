<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:tagsLib="urn:tagsLib" xmlns:BlogLibrary="urn:BlogLibrary" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets tagsLib BlogLibrary ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>
<xsl:param name="MaxNoChars" select="200" />
<xsl:template match="/">
    


    <xsl:variable name="TestimonialNode" select="$currentPage/parent::*/child::*[@level=1]"/>  
      <div class="hpTestimonialsWrapper">
		  <h2>Anti-bribery and you </h2>
		  	<div class="lQuote"><img src="/images/leftQuote.png" /></div>
		  		<ul class="hpTestimonials">
					<xsl:for-each select="$TestimonialNode/child::Testimonial">
						<li><h4><xsl:value-of select="umbraco.library:TruncateString(umbraco.library:StripHtml(current()/testimonial), $MaxNoChars, '...')" /></h4>
						<h5><em><xsl:value-of select="writtenBy" /></em></h5>
						</li>
					</xsl:for-each>
		  		</ul>
		  	<div class="rQuote"><img src="/images/rightQuote.png" /></div>
        </div>
      
    </xsl:template>
</xsl:stylesheet>