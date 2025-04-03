<?xml version="1.0" encoding="UTF-8"?>
<!-- 
  XSLT Stylesheet to transform User XML data into an HTML table
  Purpose: Create a clean listing of all users from the XML data
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
        <h2>List of Users</h2>
        
        <!-- Create a table to display the user data -->
        <table border="1">
          <!-- Table header row with column titles -->
          <tr>
            <th>ID</th>            <!-- User ID column -->
            <th>Name</th>           <!-- Full name column -->
            <th>Email</th>          <!-- Email address column -->
            <th>Role</th>           <!-- User role column -->
            <th>Active</th>         <!-- Account status column -->
            <th>City</th>           <!-- Location column -->
          </tr>
          
          <!-- 
            LOOP THROUGH USERS
            For each User element found at this path:
            RealEstate/Users/User 
          -->
          <xsl:for-each select="RealEstate/Users/User">
            <!-- Create a new table row for each user -->
            <tr>
              <!-- User ID cell -->
              <td><xsl:value-of select="id"/></td>
              
              <!-- Full name cell (combines first and last name) -->
              <td>
                <xsl:value-of select="firstName"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="lastName"/>
              </td>
              
              <!-- Email cell -->
              <td><xsl:value-of select="email"/></td>
              
              <!-- Role cell -->
              <td><xsl:value-of select="role"/></td>
              
              <!-- Active status cell (converts true/false to Yes/No) -->
              <td>
                <xsl:choose>
                  <xsl:when test="isActive = 'true'">Yes</xsl:when>
                  <xsl:otherwise>No</xsl:otherwise>
                </xsl:choose>
              </td>
              
              <!-- City cell (from address section) -->
              <td><xsl:value-of select="address/city"/></td>
            </tr>
          </xsl:for-each>
          <!-- END OF USER LOOP -->
          
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- END OF MAIN TEMPLATE -->
</xsl:stylesheet>