<?xml version="1.0" encoding="UTF-8"?>
<!-- 
  XSLT Stylesheet to transform Appointment XML data into an HTML table
  Purpose: Create a clean listing of all confirmed appointments
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
        <h2>List of Appointments</h2>
        
        <!-- Create a table to display the appointment data -->
        <table border="1">
          <!-- Table header row with column titles -->
          <tr>
            <th>Appt ID</th>        <!-- Appointment ID column -->
            <th>Property</th>       <!-- Property details column -->
            <th>Agent</th>          <!-- Agent name column -->
            <th>Client</th>         <!-- Client name column -->
            <th>When</th>           <!-- Date/time column -->
          </tr>
          
          <!-- 
            LOOP THROUGH CONFIRMED APPOINTMENTS
            For each Appointment where status='confirmed'
          -->
          <xsl:for-each select="RealEstate/Appointments/Appointment[status='confirmed']">
            
            <!-- Get related data from other sections -->
            <xsl:variable name="property" select="../../Properties/Property[propertyId=current()/propertyId]"/>
            <xsl:variable name="agent" select="../../Users/User[id=current()/agentId]"/>
            <xsl:variable name="client" select="../../Users/User[id=current()/userId]"/>
            
            <!-- Create a new table row for each appointment -->
            <tr>
              <!-- Appointment ID cell -->
              <td><xsl:value-of select="appointmentId"/></td>
              
              <!-- Property cell (title + ID) -->
              <td>
                <xsl:value-of select="$property/title"/>
                (ID: <xsl:value-of select="propertyId"/>)
              </td>
              
              <!-- Agent cell (full name) -->
              <td>
                <xsl:value-of select="$agent/firstName"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$agent/lastName"/>
              </td>
              
              <!-- Client cell (full name) -->
              <td>
                <xsl:value-of select="$client/firstName"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$client/lastName"/>
              </td>
              
              <!-- Date/Time cell (formatted) -->
              <td>
                <xsl:value-of select="substring(appointmentDateTime, 1, 10)"/>
                <xsl:text> at </xsl:text>
                <xsl:value-of select="substring(appointmentDateTime, 12, 5)"/>
              </td>
            </tr>
          </xsl:for-each>
          <!-- END OF APPOINTMENT LOOP -->
          
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- END OF MAIN TEMPLATE -->
</xsl:stylesheet>