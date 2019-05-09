<?xml version="1.0" encoding="UTF-8"?>
<?schema href='\zad3-pomocniczy-xhtml.xsl'?>
<xsl:stylesheet  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times" 
  extension-element-prefixes="date"> 
	<xsl:key use="gatunek-albumu" name="KluczGatunku" match="/płytoteka/albumy/album" />

	<xsl:template match="/płytoteka">
		
			<head>
				<meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />
				<title>
					<xsl:text>płytoteka</xsl:text>
				</title>
			</head>
			<body>
				<div style="border: solid #000 1px; text-align:center">
                        <xsl:apply-templates select="informacje"/>
                </div>
				<div style="border: solid #000 1px; text-align:center" >
					<xsl:apply-templates select="gatunki-muzyki"/>
                </div>
				<div style="border: solid #123 1px; text-align:center">
					<xsl:apply-templates select="/płytoteka/podsumowanie"/>
				</div>
			</body>
	</xsl:template>	
    <xsl:template match="informacje">
        
            <h1>
                <xsl:value-of select="/płytoteka/informacje/nazwa"/>
            </h1>
            <h3>
				Ostatnia modyfikacja: 
                <span style="text-decoration:underline">
					<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@dzień"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@miesiąc"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@rok"/>
					<xsl:text> przez </xsl:text>
					<xsl:value-of select="/płytoteka/informacje/Ostatnia-modyfikacja/@autor"/>
                </span>
            </h3>
            <h3>
                autorzy:
                <xsl:apply-templates select="/płytoteka/informacje/autorzy"/>
            </h3>
        
    </xsl:template>
	<xsl:template match="/płytoteka/informacje/autorzy/autor">
        <xsl:value-of select="imię-i-nazwisko"/>
        <xsl:value-of select="@id"/>
    </xsl:template>
	<xsl:template match="gatunki-muzyki">
			<xsl:apply-templates select="/płytoteka/gatunki-muzyki/gatunek"/>
	</xsl:template>
	<xsl:template match="gatunek">
		<div class="row" style="border: solid #000 3px; text-align:center">
			<div style="font-size:40px"> <xsl:value-of select="nazwa-gatunku"/> </div>
			
				<xsl:for-each select="key('KluczGatunku', nazwa-gatunku)">
					<div class="column">
					
					<div style="font-size:20px">
						<xsl:value-of select="wykonawca"/>
						<xsl:text> - </xsl:text>
						<xsl:value-of select="nazwa-albumu"/>
					</div>
					
					</div>
				</xsl:for-each>
			
		</div>
		<div style="border: solid #FFF 1px"/>
	</xsl:template>
	<xsl:template match="podsumowanie">
		<div style="font-size:40px"> <xsl:text>podsumowanie</xsl:text> </div>
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
		<div style="font-size:18px"><xsl:text>cena wszystkich płyt w PLN: </xsl:text>
		<xsl:value-of select="cena-kolekcji-PLN"/>
		</div>
		<div style="font-size:18px"><xsl:text>cena wszystkich płyt w USD: </xsl:text>
		<xsl:value-of select="cena-kolekcji-USD"/>
		</div>
	</xsl:template>
</xsl:stylesheet>