<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times" 
  extension-element-prefixes="date"> 

  <xsl:key use="@id-gatunku" name="KluczGatunku" match="/płytoteka/gatunki-muzyki/gatunek" />

  <xsl:template match="node/@TEXT | text()">
    <xsl:if test="normalize-space(.)">
      <xsl:value-of select="concat(normalize-space(.), '&#10;')"/>
    </xsl:if>
    <xsl:apply-templates />
  </xsl:template>


	<xsl:template match="/">
		<płytoteka>
			<xsl:apply-templates />
			<podsumowanie>
			<Liczba-płyt>
				<xsl:value-of select="count(/płytoteka/albumy/album)"/>
			</Liczba-płyt>
			<Liczba-płyt-metal>
				<xsl:value-of select="count(/płytoteka/albumy/album[@id-gatunku='G1'])"/>
			</Liczba-płyt-metal>
			<Liczba-płyt-pop>
				<xsl:value-of select="count(/płytoteka/albumy/album[@id-gatunku='G2'])"/>
			</Liczba-płyt-pop>
			<Liczba-płyt-rock>
				<xsl:value-of select="count(/płytoteka/albumy/album[@id-gatunku='G3'])"/>
			</Liczba-płyt-rock>
			<Liczba-płyt-rap>
				<xsl:value-of select="count(/płytoteka/albumy/album[@id-gatunku='G4'])"/>
			</Liczba-płyt-rap>
			<cena-kolekcji-PLN>
				<xsl:value-of select="format-number(sum(/płytoteka/albumy/album/cena[@waluta='PLN']), '0.00')"/>
			</cena-kolekcji-PLN>
			<cena-kolekcji-USD>
				<xsl:value-of select="format-number(sum(/płytoteka/albumy/album/cena[@waluta='USD']), '0.00')"/>
            </cena-kolekcji-USD>
		</podsumowanie>
		</płytoteka>
	</xsl:template>

    <xsl:template match="informacje">
        <informacje>
            <xsl:copy-of select="nazwa"/> 
            <xsl:apply-templates select="autorzy"/>
            <xsl:copy-of select="Ostatnia-modyfikacja"/>
        </informacje>
    </xsl:template>

    <xsl:template match="autorzy">
        <autorzy>
            <xsl:for-each select="autor">
                <autor>
                    <Indeks>
                        <xsl:value-of select="substring(@id,2)"/>
                    </Indeks>
                    <xsl:copy-of select="imię-i-nazwisko"/>
                </autor>
            </xsl:for-each>
        </autorzy>
    </xsl:template>

    <xsl:template match="albumy">
        <albumy>
            <xsl:for-each select="album">
                <album>
					<wykonawca>
						<xsl:value-of select="zespół/@wykonawca"/>
					</wykonawca>
                    <nazwa-albumu>
                    	<xsl:value-of select="@nazwa-albumu"/>
                    </nazwa-albumu>
                    <xsl:variable name="gatunek-album" select="key('KluczGatunku', @id-gatunku)" /> 
                    <gatunek-albumu>
                    	<xsl:value-of select="$gatunek-album/nazwa-gatunku"/>
                    </gatunek-albumu>
                    <zespół>
						<xsl:for-each select="zespół/członek">
                			<członek>
            					<xsl:copy-of select="imię-i-nazwisko"/>
                			</członek>
            			</xsl:for-each>
					</zespół>
					<xsl:for-each select="cena">
						<cena>
							<Waluta>
  								<xsl:copy-of select="@waluta"/>
  							</Waluta>
  							<Kwota>
  								<xsl:value-of select="."/>
  							</Kwota>
						</cena>
					</xsl:for-each>
                </album>
            </xsl:for-each>
        </albumy>
    </xsl:template>

    <xsl:template match="gatunki-muzyki">
        <gatunki-muzyki>
            <xsl:for-each select="gatunek">
                <gatunek>
            		<xsl:copy-of select="nazwa-gatunku"/>
                    <xsl:copy-of select="czas-powstania"/>
                </gatunek>
            </xsl:for-each>
        </gatunki-muzyki>
    </xsl:template>

</xsl:stylesheet>