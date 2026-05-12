<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:strip-space elements="*"/>

<xsl:template match="/">
<html>
<head>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="../docs.css"/>
</head>

<body>
<h2>Table of contens</h2>
<xsl:for-each select="/document/element">
<xsl:sort select="title"/>
<xsl:call-template name="element-toc"/>
</xsl:for-each>

<xsl:for-each select="/document/element">
<xsl:sort select="title"/>
<xsl:call-template name="element"/>
</xsl:for-each>

</body>

</html>
</xsl:template>

<!-- ================================================================ -->
<xsl:template match="br">
<br/>
</xsl:template>

<!-- ================================================================ -->
<xsl:template name="element-toc" match="element" mode="toc">
<a href="#{generate-id()}">
<xsl:value-of select="title"/></a><br/>
</xsl:template>

<!-- ================================================================ -->
<xsl:template name="element" match="element">
<div id="{generate-id()}">
<xsl:attribute name="class">element</xsl:attribute>
<hr/>
<a>
<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:apply-templates select="title"/>
</a>
</div>
<xsl:apply-templates select="text"/>
<xsl:apply-templates select="code"/>
<xsl:apply-templates select="sample"/>
</xsl:template>

<!-- Sample code block==================================================== -->
<xsl:template match="sample">
<div>
<xsl:attribute name="class">sample</xsl:attribute>
<xsl:apply-templates/>  
<!-- <xsl:value-of select="." disable-output-escaping="yes"/> -->
</div>
<br/>
</xsl:template>

<!-- Code block ========================================================= -->
<xsl:template match="c">
<span>
<xsl:attribute name="class">c</xsl:attribute>
<xsl:apply-templates/>  
</span>
</xsl:template>

<!-- Element text ============================================ -->
<xsl:template match="name">
<xsl:value-of select="."/>
</xsl:template>

<!-- Element text ============================================ -->
<xsl:template match="text">
<xsl:apply-templates/>
<br/>
</xsl:template>

<!-- Variable parameter in code block ============================================ -->
<xsl:template match="v">
<span>
<xsl:attribute name="class">v</xsl:attribute>
<xsl:apply-templates/>  
</span>
</xsl:template>

<!-- Variable parameter in code block ============================================ -->
<xsl:template match="s">
<span>
<xsl:attribute name="class">s</xsl:attribute>
<xsl:apply-templates/>  
</span>
</xsl:template>

<!-- Optional parameter in code block ============================================ -->
<xsl:template match="o">
<span>
<xsl:attribute name="class">o</xsl:attribute>
<xsl:apply-templates/>  
</span>
</xsl:template>

<!--  ============================================ -->
<xsl:template match="p">
<span>
<xsl:attribute name="class">p</xsl:attribute>
</span>
</xsl:template>

</xsl:stylesheet>