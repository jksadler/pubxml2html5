# Transform an XML abstract file into HTML5 using Saxon-HE

Select "XML abstracts" under "Retrieve the above record in other formats" in the query results at [The SAO/NASA Astrophysics Data System](http://adsabs.harvard.edu/).

Install the [Java Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/index.html).

Use the [Saxon-HE](https://sourceforge.net/projects/saxon/files/Saxon-HE/) XSLT processor by placing the .jar file in the same directory as these files and running the following command*:

`java -jar _____.jar -o html5result.html pub.xml pub.xsl`

The checks.js file shows/hides table rows of content.

The path that points to the .xml file retrieved from The SAO/NASA Astrophysics Data System is located in the pubmain.xsl file.

*Replace the underscore in the _____.jar path with the version of your jar file.

*Saxon can produce the HTML5 doctype using the following:

`<xsl:output method="html" version="5.0" />`
