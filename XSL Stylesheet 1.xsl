<?xml version="1.0" encoding="UTF-8"?>
<!-- 
  XSLT Stylesheet to transform Real Estate XML data into an HTML table
  Purpose: Create a clean listing of all properties from the XML data
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- 
    MAIN TEMPLATE - Matches the root node of the XML document
    This is where the transformation begins
  -->
  <xsl:template match="/">
    <!-- Start building the HTML structure -->
    <html>
      <body>
        <!-- Page heading -->
        <h2>List of Properties</h2>
        
        <!-- Create a table to display the property data -->
        <table border="1">
          <!-- Table header row with column titles -->
          <tr>
            <th>ID</th>            <!-- Property ID column -->
            <th>Title</th>         <!-- Property title/name -->
            <th>Location</th>       <!-- Street and city -->
            <th>Price</th>          <!-- Property price -->
            <th>Type</th>           <!-- Property type (apartment, house, etc.) -->
            <th>Rooms</th>          <!-- Number of rooms -->
          </tr>
          
          <!-- 
            LOOP THROUGH PROPERTIES
            For each Property element found at this path:
            RealEstate/Properties/Property 
          -->
          <xsl:for-each select="RealEstate/Properties/Property">
            <!-- Create a new table row for each property -->
            <tr>
              <!-- Property ID cell -->
              <td><xsl:value-of select="propertyId"/></td>
              
              <!-- Property title cell -->
              <td><xsl:value-of select="title"/></td>
              
              <!-- Location cell (combines street and city) -->
              <td>
                <xsl:value-of select="address/street"/>, 
                <xsl:value-of select="address/city"/>
              </td>
              
              <!-- Price cell -->
              <td><xsl:value-of select="price"/></td>
              
              <!-- Property type cell -->
              <td><xsl:value-of select="propertyType"/></td>
              
              <!-- Number of rooms cell -->
              <td><xsl:value-of select="numberOfRooms"/></td>
            </tr>
          </xsl:for-each>
          <!-- END OF PROPERTY LOOP -->
          
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- END OF MAIN TEMPLATE -->
</xsl:stylesheet>