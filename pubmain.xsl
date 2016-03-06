<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template match="mainpub">
  	<xsl:apply-templates select="h1"/>
  	<xsl:apply-templates select="document('saonasaads.xml')/records/record"/>
  </xsl:template> 
  
  <xsl:template match="record">
  <xsl:variable name="doinumber" select="DOI"/>
  <xsl:variable name="doilink" select="concat('http://dx.doi.org/', $doinumber)"/>
    <table>
    <tbody>
  <!--<tr class="s_position">
  <th>[<xsl:value-of select="position()"/>]</th>
  </tr>-->
  <xsl:if test="title">
  <tr class="s_title">
  <th>Title:</th>
<td><xsl:apply-templates select="title"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="author">
  <tr class="s_author">
  <th>Authors:</th>
<td><xsl:apply-templates select="author"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="affiliation">
  <tr class="s_affiliation">
  <th>Affiliation:</th>
<td><xsl:apply-templates select="affiliation"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="journal">
  <tr class="s_journal">
  <th>Journal:</th>
<td><xsl:apply-templates select="journal"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="pubdate">
  <tr class="s_pubdate">
  <th>Publication Date:</th>
<td><xsl:apply-templates select="pubdate"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="origin">
  <tr class="s_origin">
  <th>Origin:</th>
<td><xsl:apply-templates select="origin"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="keywords/keyword">
  <tr class="s_keywords">
  <th>Keywords:</th>
<td><xsl:apply-templates select="keywords/keyword"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="copyright">
  <tr class="s_abscopy">
  <th>Abstract Copyright:</th>
<td><xsl:apply-templates select="copyright"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="DOI">
  <tr class="s_doi">
  <th>DOI:</th>
<td><a class="doi" href="{$doilink}"><xsl:value-of select="$doilink"/></a><a class="shorturl" href=""></a></td>
  </tr>
  </xsl:if>
  <xsl:if test="bibcode">
  <tr class="s_bibcode">
  <th>Bibliographic Code:</th>
<td><xsl:apply-templates select="bibcode"/></td>
  </tr>
  </xsl:if>
  <xsl:if test="abstract">
  <tr class="s_abstract">
  <th>Abstract:</th>
<td><xsl:apply-templates select="abstract"/></td>
  </tr>
  </xsl:if>
  </tbody>
  </table>
  </xsl:template>
  
  <xsl:template match="keywords/keyword">
  	<xsl:value-of select="."/>
  	<xsl:if test="position() != last()">, </xsl:if>
  </xsl:template>
  
  <xsl:template match="emptypara">
  	<p><xsl:value-of select="text()|*" disable-output-escaping="yes"/></p>
  	</xsl:template>
  
  <xsl:template match="papertype">
		<xsl:apply-templates/>
</xsl:template>

<xsl:template match="publist">
	<ul id="{@i}"><xsl:apply-templates/></ul>
</xsl:template>

<xsl:template match="pubbutton">
	<ul>
	<xsl:for-each select="listitem">
  		<li class="{@c}"><input onclick="{@o}" type="{@t}" value="{@v}" /></li>
  	</xsl:for-each>
  	</ul>
</xsl:template>

<xsl:template match="checkbx">
	<xsl:choose>
		<xsl:when test="@c">
			<li id="{@i}"><input checked="{@c}" name="{@n}" onclick="{@o}" type="{@t}" /><xsl:copy-of select="text()|*"/></li>
		</xsl:when>
		<xsl:otherwise>
			<li id="{@i}"><input name="{@n}" onclick="{@o}" type="{@t}" /><xsl:copy-of select="text()|*"/></li>
		</xsl:otherwise>
	</xsl:choose>
  	</xsl:template>
  	
  	  	<xsl:template match="acr">
  	<acronym title="{@t}"><xsl:apply-templates/></acronym>
  </xsl:template>
  
  <xsl:template match="h2list">
    <h2><xsl:value-of select="@desc"/></h2>
    <xsl:choose>
    	<xsl:when test="@c">
    	<ul class="{@c}"><xsl:apply-templates/></ul>
    	</xsl:when>
		<xsl:otherwise>
		<ul><xsl:apply-templates/></ul>
		</xsl:otherwise>
		</xsl:choose>
  	</xsl:template>

</xsl:stylesheet>
