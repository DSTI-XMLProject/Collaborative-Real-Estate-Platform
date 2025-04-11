<?xml version="1.0" encoding="UTF-8"?>
<!--
Scenario 7: Export of User Data as JSON
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" indent="no"/>

	<xsl:template match="/">
		{
		"users": [
		<xsl:for-each select="RealEstate/Users/User">
			{
			"id": <xsl:value-of select="id"/>,
			"name": "<xsl:value-of select="firstName"/> <xsl:value-of select="lastName"/>",
			"email": "<xsl:value-of select="email"/>",
			"phoneNumber": "<xsl:value-of select="phoneNumber"/>",
			"role": "<xsl:value-of select="role"/>",
			"isActive": <xsl:value-of select="isActive"/>,
			"rating": <xsl:choose>
				<xsl:when test="rating">
					<xsl:value-of select="rating"/>
				</xsl:when>
				<xsl:otherwise>null</xsl:otherwise>
			</xsl:choose>,
			"registrationDate": "<xsl:value-of select="registrationDate"/>",
			"profilePicture": <xsl:choose>
				<xsl:when test="profilePicture">
					"<xsl:value-of select="profilePicture"/>"
				</xsl:when>
				<xsl:otherwise>null</xsl:otherwise>
			</xsl:choose>,
			"address": {
			"street": "<xsl:value-of select="address/street"/>",
			"city": "<xsl:value-of select="address/city"/>",
			"state": "<xsl:value-of select="address/state"/>",
			"postalCode": "<xsl:value-of select="address/postalCode"/>",
			"country": "<xsl:value-of select="address/country"/>",
			"latitude": <xsl:choose>
				<xsl:when test="address/latitude">
					<xsl:value-of select="address/latitude"/>
				</xsl:when>
				<xsl:otherwise>null</xsl:otherwise>
			</xsl:choose>,
			"longitude": <xsl:choose>
				<xsl:when test="address/longitude">
					<xsl:value-of select="address/longitude"/>
				</xsl:when>
				<xsl:otherwise>null</xsl:otherwise>
			</xsl:choose>
			}
			}
			<xsl:if test="position() != last()">,</xsl:if>
		</xsl:for-each>
		]
		}
	</xsl:template>

</xsl:stylesheet>
