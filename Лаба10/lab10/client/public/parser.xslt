<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/objects">
		<html>
			<body>
				<h2>Squares sequences</h2>

				<table border="1">
					<tr >
						<th>Sequence</th>
						<th>Length</th>
					</tr>
					<xsl:for-each select="/objects/object">
						<tr>
							<td><xsl:value-of select="subsequence"/></td>
							<td><xsl:value-of select="length"/></td>
						</tr>
					</xsl:for-each>
				</table>
				<!-- </xsl:template>
				<xsl:template match = "/hash">
					<p><xsl:value-of select="hash/message"/></p>
				</xsl:template>
			-->
		</body>
	</html>
</xsl:template>
<xsl:template match="/hash">
	<html>
		<body>
			<h2>Squares sequences</h2>
			<p><xsl:value-of select="/hash/message"/></p>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>