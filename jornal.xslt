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
							<div>
								<xsl:value-of select="@tipo" />
							</div>
							<div>
								<xsl:for-each select="noticia">
									<div>
										<xsl:value-of select="titulo" />
										<xsl:value-of select="author" />
										<xsl:value-of select="date" />
									</div>
									
									<div style="display:inline-block;" >
										<div style="display:inline-block; width: 25%; padding: 10px;">
											
											<p>Resumo:</p>
											<xsl:for-each select="highlights">
												<p><xsl:value-of select="." /></p>
											</xsl:for-each>
											
											<p>
											<xsl:for-each select="image">
												<img src="{url}" alt="image" style="width:70%" />
												<p style="font-size:9px"><xsl:value-of select="caption" /></p>
											</xsl:for-each>
											</p>
											
											<p>
											<xsl:for-each select="videoURLS">
												<p>
												<a href="{url}" style="margin-right:10px">Video</a>
												<xsl:value-of select="caption" />
												</p>
											</xsl:for-each>
											</p>
										</div>
										<div style="display:inline-block; width: 60%; padding: 10px;">
											<xsl:value-of select="newstext" />
										</div>
									</div>

								</xsl:for-each>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet> 