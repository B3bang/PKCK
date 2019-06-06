package Model;

import org.simpleframework.xml.*;

import java.util.ArrayList;

@Root(name = "Płytoteka")
public class RecordCollection {
    @Attribute(name = "schemaLocation")
    @Namespace(reference = "http://www.w3.org/2001/XMLSchema-instance", prefix = "xsd")
    private String mSchemaLocation;

    @Element(name="Informacje")
    private Information information;
    @ElementList(name = "Gatunki-muzyki", type = Genre.class, entry = "Gatunek-muzyki")
    private ArrayList<Genre> genreList;

    private Information getInformation() {
        return information;
    }

    public void setInformation(Information information) {
        this.information = information;
    }

    public ArrayList<Genre> getGenreList() {
        return genreList;
    }

    public void setGenreList(ArrayList<Genre> genreList) {
        this.genreList = genreList;
    }
}
