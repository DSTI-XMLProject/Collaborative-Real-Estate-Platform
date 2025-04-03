<?xml version="1.0" encoding="UTF-8"?>
<!-- 
  XSLT Stylesheet to transform RealEstate XML data into an HTML table
  Purpose: List contact information for agencies located in Lyon
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- 
    MAIN TEMPLATE - Matches the root node of the XML document
    This is where the transformation begins
  -->
  <xsl:template match="/">
    <!-- Start building the HTML structure -->
    <html>
      <head>
        <style>
          th {
            background-color: #00FF00; /* Bright green */
            color: #000000; /* Black text for contrast */
            padding: 8px;
          }
          table {
            border-collapse: collapse;
            width: 100%;
          }
          td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
          }
        </style>
      </head>
      <body>
        <!-- Page heading -->
        <h2>Lyon Real Estate Agencies</h2>
        
        <!-- Create a table to display the agency data -->
        <table border="1">
          <!-- Table header row with column titles -->
          <tr>
            <th>Agency Name</th>     <!-- Agency name column -->
            <th>Phone</th>           <!-- Contact number column -->
            <th>Email</th>           <!-- Email address column -->
            <th>Website</th>         <!-- Website URL column -->
          </tr>
          
          <!-- 
            LOOP THROUGH AGENCIES IN LYON
            Select agencies where the city is Lyon
          -->
          <xsl:for-each select="RealEstate/Agencies/Agency[address/city='Lyon']">
            
            <!-- Create a new table row for each Lyon agency -->
            <tr>
              <!-- Agency name cell -->
              <td><xsl:value-of select="name"/></td>
              
              <!-- Phone number cell -->
              <td><xsl:value-of select="phoneNumber"/></td>
              
              <!-- Email cell (as clickable mailto link) -->
              <td>
                <a href="mailto:{email}">
                  <xsl:value-of select="email"/>
                </a>
              </td>
              
              <!-- Website cell (as clickable link) -->
              <td>
                <a href="{website}" target="_blank">
                  <xsl:value-of select="website"/>
                </a>
              </td>
            </tr>
          </xsl:for-each>
          <!-- END OF AGENCY LOOP -->
          
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- END OF MAIN TEMPLATE -->
  
</xsl:stylesheet>