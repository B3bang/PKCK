package Model;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.ElementList;

import java.util.ArrayList;

public class Album {
    @Attribute(name = "Nazwa-albumu")
    private String albumName;
    @Element(name = "Zespół")
    private Band band;
    @Element(name = "Data-wydania")
    private ReleaseDate releaseDate;
    @Element(name = "Nagradzana")
    private AwardWinning awardWinning;
    @ElementList(name = "Ceny", type = Price.class, entry = "Cena")
    private ArrayList<Price> prices;

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public Band getBand() {
        return band;
    }

    public void setBand(Band band) {
        this.band = band;
    }

    public ReleaseDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(ReleaseDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public AwardWinning getAwardWinning() {
        return awardWinning;
    }

    public void setAwardWinning(AwardWinning awardWinning) {
        this.awardWinning = awardWinning;
    }

    public ArrayList<Price> getPrices() {
        return prices;
    }

    public void setPrices(ArrayList<Price> prices) {
        this.prices = prices;
    }

    public String getFormattedDate() {
        return releaseDate.getDay() + " " + releaseDate.getMonth() + " " + releaseDate.getYear();
    }

    public String getFormattedBand() {
        return band.getPerformer();
    }

    public String getFormattedAward() {
        return awardWinning.getAward().toString();
    }
}
