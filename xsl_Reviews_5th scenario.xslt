<?xml version="1.0" encoding="UTF-8"?>
<!--
    XSLT stylesheet to display reviews and ratings for an agent or a property.
    This stylesheet selects <Review> elements whose <targetType> and <targetId>
    match the provided parameters, and generates an HTML document with a table.
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
    <!-- Specify output method as HTML with UTF-8 encoding and pretty printing -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Parameter to define the target type (e.g., "Property" or "User") -->
    <xsl:param name="targetType" select="'Property'"/>
    
    <!-- Parameter to define the target identifier -->
    <xsl:param name="targetId" select="'101'"/>
    
    <!-- Template matching the root node of the document -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Reviews for <xsl:value-of select="$targetType"/> <xsl:value-of select="$targetId"/></title>
            </head>
            <body>
                <h2>Reviews and Ratings for <xsl:value-of select="$targetType"/> <xsl:value-of select="$targetId"/></h2>
                <table border="1">
                    <tr>
                        <!-- Table headers -->
                        <th>Review ID</th>
                        <th>User ID</th>
                        <th>Rating</th>
                        <th>Comment</th>
                        <th>Review Date</th>
                    </tr>
                    <!-- Loop through each <Review> element that matches the parameters -->
                    <xsl:for-each select="/RealEstate/Reviews/Review[targetType = $targetType and targetId = $targetId]">
                        <tr>
                            <td><xsl:value-of select="reviewId"/></td>
                            <td><xsl:value-of select="userId"/></td>
                            <td><xsl:value-of select="rating"/></td>
                            <td><xsl:value-of select="comment"/></td>
                            <td><xsl:value-of select="reviewDate"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>