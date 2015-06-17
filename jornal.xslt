<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body style="font-family:Verdana;">
				<h1 style="text-align:center; color:blue;">Jornal</h1>
				<div class="container"
					style="margin-left:auto; margin-right:auto; text-align:justify;">
					<xsl:for-each select="jornalType/categoria">
						<div class="category" style="padding-bottom:20px; padding-top:20px;">
							<div
								style="font-size:24px; font-weight:bolder; text-transform: capitalize;">
								<xsl:value-of select="@tipo" />
							</div>
							<div style="border-style:solid; border-color:blue;">
								<xsl:for-each select="noticia">
									<div style="padding-top:30px;">
										<span
											style="font-size:18px; font-weight:bolder; text-transform: capitalize;">
											<xsl:value-of select="titulo" />
										</span>
										<p>
											<xsl:value-of select="author" />
										</p>
										<p>
											<xsl:value-of select="date" />
										</p>
									</div>
									<div style="display:inline-block;">
										<div style="display:inline-block; width: 25%; padding: 10px;">
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
										<div style="display:inline-block; width: 70%; padding: 10px;">
											<span style="text-align:justify;">
												<xsl:value-of select="newstext" />
											</span>
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