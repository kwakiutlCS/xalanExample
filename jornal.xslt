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
									<div style="display:inline-block">
										<div style="display:inline-block">
											<p>Resumo:</p>
											<xsl:value-of select="highlights" />
											<p>Imagem:</p>
											<xsl:for-each select="image">
												<xsl:value-of select="url" />
												<xsl:value-of select="caption" />
											</xsl:for-each>
											<p>Videos:</p>
											<xsl:for-each select="videoURLS">
												<xsl:value-of select="url" />
												<xsl:value-of select="caption" />
											</xsl:for-each>
										</div>
										<div style="display:inline-block">
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