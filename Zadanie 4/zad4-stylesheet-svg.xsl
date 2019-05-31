<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns="http://www.w3.org/2000/svg">
 
    <xsl:output
        method="xml"
        indent="yes"
        standalone="no"
        doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
        media-type="image/svg" />

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="1300" height="950">
            <xsl:apply-templates/>
        </svg>
    </xsl:template>
	
	<xsl:template match="/płytoteka">
        <xsl:apply-templates select="podsumowanie"/>
		<xsl:call-template name="pokażPrzyciskStop"/>
		<xsl:call-template name="pokażPrzyciskRePlay"/>
		<xsl:call-template name="wszczyknijSkrypty"/>
    </xsl:template>
	
	
	
	
	<xsl:template match="podsumowanie">
        <xsl:call-template name="osie"/>
		<xsl:apply-templates select="Liczba-płyt"/>
        <xsl:apply-templates select="Liczba-płyt-metal"/>
		<xsl:apply-templates select="Liczba-płyt-pop"/>
		<xsl:apply-templates select="Liczba-płyt-rock"/>
		<xsl:apply-templates select="Liczba-płyt-rap"/>
		<xsl:apply-templates select="cena-kolekcji-PLN"/>
		<xsl:apply-templates select="cena-kolekcji-USD"/>
    </xsl:template>
	
	
	<xsl:template match="Liczba-płyt">
			<text x="95" y="800">
                Liczba płyt
            </text>
			<svg x="{80*1+20*0+100}" y="771" height="-770" width="-200" overflow="visible">
		<rect x="0" y="0" height="{. * 30}" width="100" transform="rotate(180)">
			<xsl:attribute name="fill">
				#5CDB95
			</xsl:attribute>
			<animate id= "anim{(.)}" attributeName="height" from="0" to="{. * 30}" dur="{(.) * 0.3}" begin="0"/>
		</rect>
		</svg>
	</xsl:template>
	
	
	<xsl:template match="Liczba-płyt-metal">
			<text x="230" y="800">
                Liczba płyt metal
            </text>
			<svg x="{80*2+70*1+100}" y="771" height="-770" width="-200" overflow="visible">
		<rect x="0" y="0" height="{. * 30}" width="100" transform="rotate(180)">
			<xsl:attribute name="fill">
				#AA00FF
			</xsl:attribute>
			<animate id= "anim{(.)}" attributeName="height" from="0" to="{. * 30}" dur="{(.) * 0.3}" begin="0"/>
		</rect>
		</svg>
	</xsl:template>
	
	
	<xsl:template match="Liczba-płyt-pop">
			<text x="380" y="800">
                Liczba płyt pop
            </text>
			<svg x="{80*3+70*2+100}" y="771" height="-770" width="-200" overflow="visible"> 
		<rect x="0" y="0" height="{. * 30}" width="100" transform="rotate(180)">
			<xsl:attribute name="fill">
				#F472D0
			</xsl:attribute>
			<animate id= "anim{(.)}" attributeName="height" from="0" to="{. * 30}" dur="{(.) * 0.3}" begin="0"/>
		</rect>
		</svg>
	</xsl:template>
	
	
	<xsl:template match="Liczba-płyt-rock">
			<text x="530" y="800">
                Liczba płyt rock
            </text>
			<svg x="{80*4+70*3+100}" y="771" height="-770" width="-200" overflow="visible"> 
		<rect x="0" y="0" height="{. * 30}" width="100" transform="rotate(180)">
			<xsl:attribute name="fill">
				#76608A
			</xsl:attribute>
			<animate id= "anim{(.)}" attributeName="height" from="0" to="{. * 30}" dur="{(.) * 0.3}" begin="0"/>
		</rect>
		</svg>
	</xsl:template>
	
	
	<xsl:template match="Liczba-płyt-rap">
			<text x="685" y="800">
                Liczba płyt rap
            </text>
			<svg x="{80*5+70*4+100}" y="771" height="-770" width="-200" overflow="visible"> 
		<rect x="0" y="0" height="{. * 30}" width="100" transform="rotate(180)">
			<xsl:attribute name="fill">
				 #E51400
			</xsl:attribute>
			<animate id= "anim{(.)}" attributeName="height" from="0" to="{. * 30}" dur="{(.) * 0.3}" begin="0"/>
		</rect>
		</svg>
	</xsl:template>
	
	
	<xsl:template match="cena-kolekcji-PLN">
			<text y="850" x="30" text-align="center">
                <tspan x="30">
                    <xsl:text>Cena całej kolekcji w PLN: </xsl:text>
					<xsl:value-of select="/płytoteka/podsumowanie/cena-kolekcji-PLN"/>
                </tspan>
            </text>
	</xsl:template>
	
	
	<xsl:template match="cena-kolekcji-USD">
			<text y="900" x="30" text-align="center">
                <tspan x="30">
                    <xsl:text>Cena całej kolekcji w USD: </xsl:text>
					<xsl:value-of select="/płytoteka/podsumowanie/cena-kolekcji-USD"/>
                </tspan>
            </text>
	</xsl:template>
	
	
    <xsl:template name="osie">
		<rect x="15" y="50" width="950" height="900" fill="#EDF5E1"/>
        <text x="30" y="{770-0*30}">0</text>
        <text x="30" y="{770-1*30}">1</text>
        <text x="30" y="{770-2*30}">2</text>
        <text x="30" y="{770-3*30}">3</text>
        <text x="30" y="{770-4*30}">4</text>
        <text x="30" y="{770-5*30}">5</text>
        <text x="30" y="{770-6*30}">6</text>
        <text x="30" y="{770-7*30}">7</text>
        <text x="30" y="{770-8*30}">8</text>
        <text x="30" y="{770-9*30}">9</text>
        <text x="30" y="{770-10*30}">10</text>
        <text x="30" y="{770-11*30}">11</text>
        <text x="30" y="{770-12*30}">12</text>
        <text x="30" y="{770-13*30}">13</text>
		<text x="30" y="{770-14*30}">14</text>
        <text x="30" y="{770-15*30}">15</text>
        <text x="30" y="{770-16*30}">16</text>
        <text x="30" y="{770-17*30}">17</text>
        <text x="30" y="{770-18*30}">18</text>
        <text x="30" y="{770-19*30}">19</text>
        <text x="30" y="{770-20*30}">20</text>
        <text x="30" y="{770-21*30}">21</text>
        <text x="30" y="{770-22*30}">22</text>
        
        <line x1="60" x2="933" y1="{770-0*30}" y2="{770-0*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-1*30}" y2="{770-1*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-2*30}" y2="{770-2*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-3*30}" y2="{770-3*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-4*30}" y2="{770-4*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-5*30}" y2="{770-5*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-6*30}" y2="{770-6*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-7*30}" y2="{770-7*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-8*30}" y2="{770-8*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-9*30}" y2="{770-9*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-10*30}" y2="{770-10*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-11*30}" y2="{770-11*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-12*30}" y2="{770-12*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-13*30}" y2="{770-13*30}" stroke="black" stroke-dasharray="5,5"/>
		<line x1="60" x2="933" y1="{770-14*30}" y2="{770-14*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-15*30}" y2="{770-15*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-16*30}" y2="{770-16*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-17*30}" y2="{770-17*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-18*30}" y2="{770-18*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-19*30}" y2="{770-19*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-20*30}" y2="{770-20*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-21*30}" y2="{770-21*30}" stroke="black" stroke-dasharray="5,5"/>
        <line x1="60" x2="933" y1="{770-22*30}" y2="{770-22*30}" stroke="black" stroke-dasharray="5,5"/>     
    </xsl:template>
	
	<xsl:template name="pokażPrzyciskStop">
        <image x="450" y="818" id="przyciskStopu" xlink:href="stop.png" height="100" width="100"></image>
    </xsl:template>
	
	<xsl:template name="pokażPrzyciskRePlay">
        <image x="750" y="818" id="przyciskReplay" xlink:href="replay.png" height="100" width="100"></image>
    </xsl:template>
	
	<xsl:template name="wszczyknijSkrypty">
		<script type="text/javascript">
			document.getElementById("przyciskReplay").onclick = function() {
                var anims = document.querySelectorAll('[id^="anim"]');
                for (i = 0; i &lt; anims.length; i++) {
                    anims[i].beginElement();
                }
            }
			
			document.getElementById("przyciskStopu").onclick = function() {
                var anims = document.querySelectorAll('[id^="anim"]');
                for (i = 0; i &lt; anims.length; i++) {
                    anims[i].endElement();
                }
            }
		</script>
	</xsl:template>
	
</xsl:stylesheet>