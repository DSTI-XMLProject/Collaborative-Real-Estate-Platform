<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Define template for matching the root element -->
    <xsl:template match="/RealEstate">
        <AllTransactionsExport>
            <!-- Loop through all Transactions -->
            <xsl:for-each select="Transactions/Transaction">
                <TransactionRecord>
                    <TransactionID><xsl:value-of select="transactionId"/></TransactionID>
                    <TransactionType><xsl:value-of select="transactionType"/></TransactionType>
                    <TransactionDate><xsl:value-of select="transactionDate"/></TransactionDate>
                    <Amount><xsl:value-of select="amount"/></Amount>
                    <Status><xsl:value-of select="status"/></Status>

                    <!-- Get Buyer Info -->
                    <xsl:variable name="buyerId" select="buyerId"/>
                    <xsl:variable name="buyer" select="/RealEstate/Users/User[id = $buyerId]"/>
                    <Buyer>
                        <BuyerID><xsl:value-of select="$buyer/id"/></BuyerID>
                        <Name><xsl:value-of select="concat($buyer/firstName, ' ', $buyer/lastName)"/></Name>
                    </Buyer>

                    <!-- Get Seller Info -->
                    <xsl:variable name="sellerId" select="sellerId"/>
                    <xsl:variable name="seller" select="/RealEstate/Users/User[id = $sellerId]"/>
                    <Seller>
                        <SellerID><xsl:value-of select="$seller/id"/></SellerID>
                        <Name><xsl:value-of select="concat($seller/firstName, ' ', $seller/lastName)"/></Name>
                    </Seller>

                    <!-- Get Property Info -->
                    <xsl:variable name="propertyId" select="propertyId"/>
                    <xsl:variable name="property" select="/RealEstate/Properties/Property[propertyId = $propertyId]"/>
                    <Property>
                        <PropertyID><xsl:value-of select="$property/propertyId"/></PropertyID>
                        <Title><xsl:value-of select="$property/title"/></Title>
                        <Price><xsl:value-of select="$property/price"/></Price>
                    </Property>
                </TransactionRecord>
            </xsl:for-each>
        </AllTransactionsExport>
    </xsl:template>

</xsl:stylesheet>
