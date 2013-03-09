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

<xsl:template match="/">

<!-- start writing XSLT -->
  <xsl:variable name="sliderNode" select="$currentPage/parent::*/child::*[@level=1]"/>
	<div class="rslides_container">
		<ul class="rslides rslides1">
			<xsl:for-each select="$sliderNode/child::umediaSlider">
			<li>
				<img src="{umbracoFile}"  />

				<div class="rslidesCopy">
					<xsl:attribute name="style">background-color:#<xsl:value-of select="textBackgroundColour"/></xsl:attribute>
					
					
					<h2>
						
							<xsl:value-of select="headline"/>
						
					</h2>

					<a href="{umbraco.library:NiceUrl(link)}">

						
						<xsl:value-of select="linkText"/>
					</a>
					<h3>
						
					<xsl:value-of select="subHeadline"/>
						
					</h3>


					
						
					
					
				</div>	
				
			</li>
			</xsl:for-each>
		</ul>
	</div>

</xsl:template>

</xsl:stylesheet>