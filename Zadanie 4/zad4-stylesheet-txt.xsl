<?xml version='1.0' encoding='utf-8'?>
<?schema href='\zad4-pomocniczy.xml'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8" indent="no"/>

    <xsl:key use="gatunek-albumu" name="KluczGatunku" match="/płytoteka/albumy/album"/>

	<xsl:template match="/płytoteka">
        <xsl:apply-templates select="informacje"/>
		<xsl:apply-templates select="gatunki-muzyki"/>
		<xsl:apply-templates select="/płytoteka/podsumowanie"/>
	</xsl:template>	

    <xsl:template match="informacje">
        <xsl:value-of select="concat('&#x9;&#x9;&#x9;', /płytoteka/informacje/nazwa, '&#xA;')"/>
        <xsl:text>Ostatnia modyfikacja: </xsl:text>
		<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@dzień"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@miesiąc"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@rok"/>
		<xsl:text> przez </xsl:text>
		<xsl:value-of select="substring(/płytoteka/informacje/Ostatnia-modyfikacja/@autor, 2)"/>
        <xsl:text>&#xA;Autorzy:</xsl:text>
        <xsl:apply-templates select="/płytoteka/informacje/autorzy"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

	<xsl:template match="/płytoteka/informacje/autorzy/autor">
        <xsl:value-of select="imię-i-nazwisko"/>
        <xsl:text> - </xsl:text>
        <xsl:value-of select="Indeks"/>
        <xsl:value-of select="@id"/>
    </xsl:template>

	<xsl:template match="gatunki-muzyki">
        <xsl:text>Gatunki:&#xA;</xsl:text>
		<xsl:apply-templates select="/płytoteka/gatunki-muzyki/gatunek"/>
	</xsl:template>

	<xsl:template match="gatunek">
		<xsl:value-of select="concat('&#xA;&#x9;&#x9;&#x9;', nazwa-gatunku)"/>
        <xsl:text>&#xA;</xsl:text>	
		<xsl:for-each select="key('KluczGatunku', nazwa-gatunku)">		
		<xsl:value-of select="concat('    ',wykonawca)"/>
		<xsl:text> - </xsl:text>
		<xsl:value-of select="nazwa-albumu"/>
        <xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="podsumowanie">
	    <xsl:text>&#xA;Podsumowanie:&#xA;</xsl:text>
		<xsl:text>    Liczba płyt: </xsl:text>
		<xsl:value-of select="concat(Liczba-płyt, '&#xA;')"/>
		<xsl:text>    Liczba płyt metal: </xsl:text>
		<xsl:value-of select="concat(Liczba-płyt-metal, '&#xA;')"/>
		<xsl:text>    Liczba płyt pop: </xsl:text>
		<xsl:value-of select="concat(Liczba-płyt-pop, '&#xA;')"/>
		<xsl:text>    Liczba płyt rock: </xsl:text>
		<xsl:value-of select="concat(Liczba-płyt-rock, '&#xA;')"/>
		<xsl:text>    Liczba płyt rap: </xsl:text>
		<xsl:value-of select="concat(Liczba-płyt-rap, '&#xA;')"/>
		<xsl:text>    cena wszystkich płyt w PLN: </xsl:text>
		<xsl:value-of select="concat(cena-kolekcji-PLN, '&#xA;')"/>
		<xsl:text>    cena wszystkich płyt w USD: </xsl:text>
		<xsl:value-of select="cena-kolekcji-USD"/>
	</xsl:template>

</xsl:stylesheet>
