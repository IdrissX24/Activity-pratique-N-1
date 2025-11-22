<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/meteo">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Météo</title>
                <style type="text/css">
                    body { font-family: Arial, Helvetica, sans-serif; margin: 20px; }
                    h1 { color: #2c3e50; }
                    .mesure { margin-bottom: 24px; border: 1px solid #ddd; border-radius: 6px; padding: 12px; box-shadow: 0 1px 2px rgba(0,0,0,0.04); }
                    .date { font-weight: bold; margin-bottom: 8px; color: #34495e; }
                    table { border-collapse: collapse; width: 100%; max-width: 600px; }
                    th, td { padding: 8px 10px; border: 1px solid #e1e1e1; text-align: left; }
                    th { background: #f7f7f7; }
                    .temp { text-align: right; font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Observations Météo</h1>
                
                <!-- Parcours des mesures -->
                <xsl:for-each select="mesure">
                    <div class="mesure">
                        <div class="date">
                            <!-- Affiche la date (attribut date) -->
                            <xsl:text>Date : </xsl:text>
                            <xsl:value-of select="@date"/>
                        </div>
                        
                        <table>
                            <thead>
                                <tr>
                                    <th>Ville</th>
                                    <th>Température (°C)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Parcours des villes d'une mesure -->
                                <xsl:for-each select="ville">
                                    <tr>
                                        <td><xsl:value-of select="@nom"/></td>
                                        <td class="temp"><xsl:value-of select="@temperature"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>