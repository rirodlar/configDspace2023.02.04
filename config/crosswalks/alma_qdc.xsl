<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai_qdc="http://alma.exlibrisgroup.com/schemas/qdc-1.0/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/1.1/"
    xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
    exclude-result-prefixes="oai_qdc dc dcterms">

  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
    <dim:dim>

      <!-- Títulos -->
      <xsl:for-each select="//oai_qdc:dc/dc:title">
        <dim:field mdschema="dc" element="title">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Autores/Creadores -->
      <xsl:for-each select="//oai_qdc:dc/dc:creator">
        <dim:field mdschema="dc" element="creator">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Contribuyentes (dc:contributor y dcterms:contributor) -->
      <xsl:for-each select="//oai_qdc:dc/dc:contributor | //oai_qdc:dc/dcterms:contributor">
        <dim:field mdschema="dc" element="contributor">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Editorial/Publisher -->
      <xsl:for-each select="//oai_qdc:dc/dc:publisher">
        <dim:field mdschema="dc" element="publisher">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Fechas: texto libre (dc:date) y dcterms:date) -->
      <xsl:for-each select="//oai_qdc:dc/dc:date | //oai_qdc:dc/dcterms:date">
        <dim:field mdschema="dc" element="date">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Fechas específicas -->
      <xsl:for-each select="//oai_qdc:dc/dcterms:dateAccepted">
        <dim:field mdschema="dc" element="date" qualifier="accepted">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>
      <xsl:for-each select="//oai_qdc:dc/dcterms:dateSubmitted">
        <dim:field mdschema="dc" element="date" qualifier="submitted">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Descripción -->
      <xsl:for-each select="//oai_qdc:dc/dcterms:description | //oai_qdc:dc/dc:description">
        <dim:field mdschema="dc" element="description">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Nivel educativo (campo local sugerido) -->
      <xsl:for-each select="//oai_qdc:dc/dcterms:educationLevel">
        <dim:field mdschema="dc" element="description" qualifier="degree">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Extensión -->
      <xsl:for-each select="//oai_qdc:dc/dcterms:extent">
        <dim:field mdschema="dc" element="format" qualifier="extent">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Formato -->
      <xsl:for-each select="//oai_qdc:dc/dc:format">
        <dim:field mdschema="dc" element="format">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Idioma -->
      <xsl:for-each select="//oai_qdc:dc/dc:language">
        <dim:field mdschema="dc" element="language">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Derechos / Licencia -->
      <xsl:for-each select="//oai_qdc:dc/dcterms:license | //oai_qdc:dc/dcterms:rights">
        <dim:field mdschema="dc" element="rights">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Materias -->
      <xsl:for-each select="//oai_qdc:dc/dc:subject">
        <dim:field mdschema="dc" element="subject">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Tipo -->
      <xsl:for-each select="//oai_qdc:dc/dc:type">
        <dim:field mdschema="dc" element="type">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

      <!-- Identificadores: URL → dc.identifier.uri; otros → dc.identifier -->
      <xsl:for-each select="//oai_qdc:dc/dc:identifier">
        <xsl:choose>
          <xsl:when test="contains(., '://')">
            <dim:field mdschema="dc" element="identifier" qualifier="uri">
              <xsl:value-of select="normalize-space(.)"/>
            </dim:field>
          </xsl:when>
          <xsl:otherwise>
            <dim:field mdschema="dc" element="identifier">
              <xsl:value-of select="normalize-space(.)"/>
            </dim:field>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>

      <!-- Provenance (IDs y aprobaciones internas) -->
      <xsl:for-each select="//oai_qdc:dc/dcterms:provenance">
        <dim:field mdschema="dc" element="description" qualifier="provenance">
          <xsl:value-of select="normalize-space(.)"/>
        </dim:field>
      </xsl:for-each>

    </dim:dim>
  </xsl:template>

</xsl:stylesheet>