<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times" 
  extension-element-prefixes="date"> 

  <xsl:key use="@Id-gatunku" name="KluczGatunku" match="/Płytoteka/Gatunki-muzyki/Gatunek" />

  <xsl:template match="node/@TEXT | text()">
    <xsl:if test="normalize-space(.)">
      <xsl:value-of select="concat(normalize-space(.), '&#10;')"/>
    </xsl:if>
    <xsl:apply-templates />
  </xsl:template>


	<xsl:template match="/">
		<Płytoteka>
			<xsl:apply-templates />
		</Płytoteka>
		<Podsumowanie>
			<Liczba-płyt>
				<xsl:value-of select="count(/Płytoteka/Albumy/Album)"/>
			</Liczba-płyt>
			<Liczba-płyt-metal>
				<xsl:value-of select="count(/Płytoteka/Albumy/Album[@Id-gatunku='G1'])"/>
			</Liczba-płyt-metal>
			<Liczba-płyt-pop>
				<xsl:value-of select="count(/Płytoteka/Albumy/Album[@Id-gatunku='G2'])"/>
			</Liczba-płyt-pop>
			<Liczba-płyt-rock>
				<xsl:value-of select="count(/Płytoteka/Albumy/Album[@Id-gatunku='G3'])"/>
			</Liczba-płyt-rock>
			<Liczba-płyt-rap>
				<xsl:value-of select="count(/Płytoteka/Albumy/Album[@Id-gatunku='G4'])"/>
			</Liczba-płyt-rap>
			<Cena-kolekcji-PLN>
				<xsl:value-of select="format-number(sum(/Płytoteka/Albumy/Album/Cena[@waluta='PLN']), '0.00')"/>
			</Cena-kolekcji-PLN>
			<Cena-kolekcji-USD>
				<xsl:value-of select="format-number(sum(/Płytoteka/Albumy/Album/Cena[@waluta='USD']), '0.00')"/>
            </Cena-kolekcji-USD>
		</Podsumowanie>
	</xsl:template>

    <xsl:template match="Informacje">
        <Informacje>
            <xsl:copy-of select="Nazwa"/> 
            <xsl:apply-templates select="Autorzy"/>
            <xsl:copy-of select="Ostatnia-modyfikacja"/>
        </Informacje>
    </xsl:template>

    <xsl:template match="Autorzy">
        <Autorzy>
            <xsl:for-each select="Autor">
                <Autor>
                    <Indeks>
                        <xsl:value-of select="substring(@id,2)"/>
                    </Indeks>
                    <xsl:copy-of select="Imię-i-nazwisko"/>
                </Autor>
            </xsl:for-each>
        </Autorzy>
    </xsl:template>

    <xsl:template match="Albumy">
        <Albumy>
            <xsl:for-each select="Album">
                <Album>
					<Wykonawca>
						<xsl:value-of select="Zespół/@Wykonawca"/>
					</Wykonawca>
                    <Nazwa-albumu>
                    	<xsl:value-of select="@Nazwa-albumu"/>
                    </Nazwa-albumu>
                    <xsl:variable name="Gatunek-Album" select="key('KluczGatunku', @Id-gatunku)" /> 
                    <Gatunek-albumu>
                    	<xsl:value-of select="$Gatunek-Album/Nazwa-gatunku"/>
                    </Gatunek-albumu>
                    <Zespół>
						<xsl:for-each select="Zespół/Członek">
                			<Członek>
            					<xsl:copy-of select="Imię-i-nazwisko"/>
                			</Członek>
            			</xsl:for-each>
					</Zespół>
					<xsl:for-each select="Cena">
						<Cena>
							<Waluta>
  								<xsl:copy-of select="@waluta"/>
  							</Waluta>
  							<Kwota>
  								<xsl:value-of select="."/>
  							</Kwota>
						</Cena>
					</xsl:for-each>
                </Album>
            </xsl:for-each>
        </Albumy>
    </xsl:template>

    <xsl:template match="Gatunki-muzyki">
        <Gatunki-muzyki>
            <xsl:for-each select="Gatunek">
                <Gatunek>
            		<xsl:copy-of select="Nazwa-gatunku"/>
                    <xsl:copy-of select="Czas-powstania"/>
                </Gatunek>
            </xsl:for-each>
        </Gatunki-muzyki>
    </xsl:template>

</xsl:stylesheet>