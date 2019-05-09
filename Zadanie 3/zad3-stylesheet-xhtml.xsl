<?xml version="1.0" encoding="UTF-8"?>
<?schema href='\zad3-pomocniczy-xhtml.xsl'?>
<xsl:stylesheet  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times" 
  extension-element-prefixes="date"> 

	<xsl:key use="Gatunek-albumu" name="KluczGatunku" match="/Płytoteka/Albumy/Album" />

	<xsl:template match="/Płytoteka">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />
				<title>
					<xsl:text>Płytoteka</xsl:text>
				</title>
			</head>
			<body>
				<div style="border: solid #000 1px; text-align:center">
                    <h1>
                        <xsl:apply-templates select="Informacje"/>
                    </h1>
                </div>
				<table border="1" cellpadding="5px" style="clear: both; margin: 3ex 2em;" >
					<xsl:apply-templates select="Gatunki-muzyki"/>
                </table>
				<div style="border: solid #123 1px; text-align:center">
					<xsl:apply-templates select="/Płytoteka/Podsumowanie"/>
				</div>
			</body>
		</html>
	</xsl:template>	
    <xsl:template match="Informacje">
        <Informacje>
            <h1>
                <xsl:value-of select="/Płytoteka/Informacje/Nazwa"/>
            </h1>
            <h3>
				Ostatnia modyfikacja: 
                <span style="text-decoration:underline">
					<xsl:value-of select="/Płytoteka/Informacje/Ostatnia-modyfikacja/@dzień"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/Płytoteka/Informacje/Ostatnia-modyfikacja/@miesiąc"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/Płytoteka/Informacje/Ostatnia-modyfikacja/@rok"/>
					<xsl:text> przez </xsl:text>
					<xsl:value-of select="/Płytoteka/Informacje/Ostatnia-modyfikacja/@Autor"/>
                </span>
            </h3>
            <h3>
                Autorzy:
                <xsl:apply-templates select="/Płytoteka/Informacje/Autorzy"/>
            </h3>
        </Informacje>
    </xsl:template>
	<xsl:template match="/Płytoteka/Informacje/Autorzy/Autor">
        <xsl:value-of select="Imię-i-nazwisko"/>
        <xsl:value-of select="@id"/>
    </xsl:template>
	<xsl:template match="Gatunki-muzyki">
			<xsl:apply-templates select="/Płytoteka/Gatunki-muzyki/Gatunek"/>
	</xsl:template>
	<xsl:template match="Gatunek">
		<div class="row" style="border: solid #000 3px; text-align:center">
			<div style="font-size:40px"> <xsl:value-of select="Nazwa-gatunku"/> </div>
			<Albumy>
				<xsl:for-each select="key('KluczGatunku', Nazwa-gatunku)">
					<div class="column">
					<Album>
					<div style="font-size:20px">
						<xsl:value-of select="Wykonawca"/>
						<xsl:text> - </xsl:text>
						<xsl:value-of select="Nazwa-albumu"/>
					</div>
					</Album>
					</div>
				</xsl:for-each>
			</Albumy>
		</div>
		<div style="border: solid #FFF 1px"/>
	</xsl:template>
	<xsl:template match="Podsumowanie">
		<div style="font-size:40px"> <xsl:text>Podsumowanie</xsl:text> </div>
		<div style="font-size:18px"><xsl:text>Liczba płyt:</xsl:text>
		<xsl:value-of select="Liczba-płyt"/>
		</div>
		<div style="font-size:18px"><xsl:text>Liczba płyt metal: </xsl:text>
		<xsl:value-of select="Liczba-płyt-metal"/>
		</div>
		<div style="font-size:18px"><xsl:text>Liczba płyt pop: </xsl:text>
		<xsl:value-of select="Liczba-płyt-pop"/>
		</div>
		<div style="font-size:18px"><xsl:text>Liczba płyt rock: </xsl:text>
		<xsl:value-of select="Liczba-płyt-rock"/>
		</div>
		<div style="font-size:18px"><xsl:text>Liczba płyt rap: </xsl:text>
		<xsl:value-of select="Liczba-płyt-rap"/>
		</div>
		<div style="font-size:18px"><xsl:text>Cena wszystkich płyt w PLN: </xsl:text>
		<xsl:value-of select="Cena-kolekcji-PLN"/>
		</div>
		<div style="font-size:18px"><xsl:text>Cena wszystkich płyt w USD: </xsl:text>
		<xsl:value-of select="Cena-kolekcji-USD"/>
		</div>
	</xsl:template>
</xsl:stylesheet>