<?xml version="1.0" encoding="UTF-8"?>
<!-- Scenario 7: Export user data as JSON format -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="text" indent="no"/>

    <xsl:template match="/">
        {
        "users": [
            <xsl:for-each select="RealEstate/Users/User">
                {
                "id": <xsl:value-of select="id"/>,
                "name": "<xsl:value-of select="firstName"/> <xsl:value-of select="lastName"/>",
                "email": "<xsl:value-of select="email"/>",
                "role": "<xsl:value-of select="role"/>"
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>
