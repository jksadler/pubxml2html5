<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:import href="pubmain.xsl"/>
<xsl:import href="common.xsl"/>

<xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="yes" doctype-system="about:legacy-compat" />

<xsl:template match="papers">
    <html>
      <head>
	      <title><xsl:value-of select="@title"/></title>
	      <script type="text/javascript" src="checks.js"></script>
      </head>
      
      <body>
        <div id="container">
          <div id="content">
          <strong>Options</strong>
						<form name="options" action="#">
							<xsl:apply-templates select="papertype"/>
						</form>
            <div id="maintext">
              		<xsl:apply-templates select="mainpub"/>
            	</div>
          </div>
        </div>
      </body>
    </html>
</xsl:template>

</xsl:stylesheet>
