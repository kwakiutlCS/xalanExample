<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h1>Jornal</h1>
  <div class="container">
    <xsl:for-each select="jornalType/categoria">
    <div class="category">
      <div><xsl:value-of select="@tipo" /></div>
      <div>
      	<xsl:for-each select="noticia">
      		<div><xsl:value-of select="titulo" /></div>
      	</xsl:for-each>
      </div>
    </div>
    </xsl:for-each>
  </div>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 