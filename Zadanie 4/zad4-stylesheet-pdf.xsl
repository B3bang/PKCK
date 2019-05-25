<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" encoding="utf-8"/>

    <xsl:key use="gatunek-albumu" name="KluczGatunku" match="/płytoteka/albumy/album"/>

	<xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
			    <fo:simple-page-master master-name="podsumowanie" page-height="14in" page-width="10in">
                    <fo:region-body region-name="only_region" margin="0.5in" background-color="#dee8f7"/>
                </fo:simple-page-master>
			    <fo:simple-page-master master-name="albumy" page-height="14in" page-width="10in">
                    <fo:region-body region-name="only_region" margin="0.5in" background-color="#dee8f7"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="podsumowanie">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-size="20">Informacje</fo:block>
					<fo:block><fo:leader/></fo:block>
						<fo:list-block >
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Nazwa: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/informacje/nazwa"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Ostatnia modyfikacja: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="concat(/płytoteka/informacje/Ostatnia-modyfikacja/@dzień, ' ', /płytoteka/informacje/Ostatnia-modyfikacja/@miesiąc, ' ', /płytoteka/informacje/Ostatnia-modyfikacja/@rok, ' przez ', substring(/płytoteka/informacje/Ostatnia-modyfikacja/@autor, 2))"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Autorzy: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<xsl:for-each select="/płytoteka/informacje/autorzy/autor">
										<fo:block margin-left="15em"><xsl:value-of select="concat(imię-i-nazwisko, ' - ', Indeks)"/></fo:block>
									</xsl:for-each>
									<fo:block><fo:leader/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
		
                    <fo:block text-align="center" font-weight="bold" font-size="20">Podsumowanie</fo:block>
					<fo:block><fo:leader/></fo:block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Liczba płyt: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/Liczba-płyt"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Liczba płyt metal: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/Liczba-płyt-metal"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Liczba płyt pop: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/Liczba-płyt-pop"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Liczba płyt rock: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/Liczba-płyt-rock"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Liczba płyt rap: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/Liczba-płyt-rap"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Cena wszystkich płyt w PLN: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/cena-kolekcji-PLN"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						<fo:list-block>
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>Cena wszystkich płyt w USD: </fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block margin-left="15em"><xsl:value-of select="/płytoteka/podsumowanie/cena-kolekcji-USD"/></fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
                </fo:flow>
            </fo:page-sequence>

 			<fo:page-sequence master-reference="albumy">
                <fo:flow flow-name="only_region">
				    <fo:block text-align="center" font-weight="bold" font-size="20">Albumy</fo:block>
					<fo:block><fo:leader/></fo:block>
					<xsl:for-each select="/płytoteka/gatunki-muzyki/gatunek">
							<fo:block text-align="center" text-decoration="underline"><xsl:value-of select="nazwa-gatunku"/></fo:block>
							<fo:table border="1px solid black" table-layout="fixed" width="100%" font-size="10">
							    <fo:table-header>
									<fo:table-row background-color="#4CAF50">
										<fo:table-cell width="150px">
                                    		<fo:block font-weight="bold" font-size="15" color="red">Wykonawca</fo:block>
                               			 </fo:table-cell>
										<fo:table-cell width="150px">
                                    		<fo:block font-weight="bold" font-size="15" color="red">Album</fo:block>
                               			 </fo:table-cell>
									</fo:table-row>
								</fo:table-header>
								<xsl:for-each select="key('KluczGatunku', nazwa-gatunku)">
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell>
												<fo:block>
													<xsl:value-of select="wykonawca"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block>
													<xsl:value-of select="nazwa-albumu"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</xsl:for-each>
                    		</fo:table>
					</xsl:for-each>
				</fo:flow>
            </fo:page-sequence>

        </fo:root>
    </xsl:template>

</xsl:stylesheet>