<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template match="h1">
	<xsl:choose>
	<xsl:when test="@m">
		<h3><xsl:apply-templates/></h3>
	</xsl:when>
	<xsl:otherwise>
		<h1><xsl:apply-templates/></h1>
	</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="h2">
	<h2><xsl:apply-templates/></h2>
</xsl:template>
  
<xsl:template match="list">
	<ul><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="listitem">
	<li><xsl:apply-templates/></li>
</xsl:template>
  
<xsl:template match="para">
	<xsl:choose>
	<xsl:when test="@c">
		<p class="{@c}"><xsl:apply-templates/></p>
	</xsl:when>
	<xsl:otherwise>
		<p><xsl:apply-templates/></p>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="link">
	<a href="{@h}"><xsl:apply-templates/></a>
</xsl:template>

<xsl:template match="image">
	<img src="{@src}" width="{@x}" height="{@y}" alt="{@a}" title="{@t}" />
</xsl:template>

<xsl:template match="emph">
	<strong><xsl:apply-templates/></strong>
</xsl:template>

<xsl:template match="text">
	<xsl:value-of select="text()|*" disable-output-escaping="yes"/>
</xsl:template>

<xsl:template match="author">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">; </xsl:if>
</xsl:template>
    
</xsl:stylesheet>
