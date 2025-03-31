<?xml version="1.0" encoding="UTF-8"?>
<!-- Scenario 6: Export Appointments grouped by Property in a new XML format -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:key name="propertyKey" match="Appointment" use="propertyId"/>

    <xsl:template match="/">
        <AppointmentsByProperty>
            <xsl:for-each select="RealEstate/Appointments/Appointment[generate-id() = generate-id(key('propertyKey', propertyId)[1])]">
                <PropertyAppointments propertyId="{propertyId}">
                    <xsl:for-each select="key('propertyKey', propertyId)">
                        <Appointment>
                            <User><xsl:value-of select="userId"/></User>
                            <Agent><xsl:value-of select="agentId"/></Agent>
                            <DateTime><xsl:value-of select="appointmentDateTime"/></DateTime>
                            <Status><xsl:value-of select="status"/></Status>
                        </Appointment>
                    </xsl:for-each>
                </PropertyAppointments>
            </xsl:for-each>
        </AppointmentsByProperty>
    </xsl:template>
</xsl:stylesheet>
