<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet 
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xhtml="http://www.w3.org/1999/xhtml" 
    xmlns="http://www.w3.org/1999/xhtml"> 

<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
<xsl:variable name="version" select="system-property('xsl:version')"/>
<xsl:variable name="vendor-url" select="system-property('xsl:vendor-url')"/>


	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="xhtml:html">
		<xsl:copy>
			<xsl:for-each select="@*">
				<!--属性のコピー--><xsl:copy />
        		</xsl:for-each>
			<xsl:apply-templates select="xhtml:head"/>
			<xsl:apply-templates select="xhtml:body"/>
		</xsl:copy>
	</xsl:template>
	

	<xsl:template match="xhtml:head">
		<xsl:copy>	
			<xsl:for-each select="@*">
				<!--属性のコピー--><xsl:copy />
        	</xsl:for-each>
			<xsl:copy-of select="*"/>
			<xsl:choose>
				<xsl:when test="$vendor='Microsoft'">
					<link rel="stylesheet" href="css/ie.css" media="screen,print" />
				</xsl:when>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>	

	<xsl:template match="xhtml:body">
		<xsl:copy>	
			<xsl:for-each select="@*">
				<!--属性のコピー--><xsl:copy />
        		</xsl:for-each>
			<div id="foundation">
				<div class="foundation-inner">
					<xsl:for-each select="*">
						<xsl:choose>
							<xsl:when test=".=../xhtml:aside/."/>
							<xsl:when test=".=../xhtml:footer/."/>
							<xsl:when test=".=../xhtml:span/."/>
							<xsl:otherwise>
								<xsl:copy-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				<!-- /.foundation-inner --></div>
			<!-- /#foundation --></div>
		<xsl:copy-of select="xhtml:aside" />
		<xsl:copy-of select="xhtml:footer" />
		<xsl:copy-of select="xhtml:span" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
