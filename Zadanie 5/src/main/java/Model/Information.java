package Model;

import org.simpleframework.xml.Element;
import org.simpleframework.xml.ElementList;

import java.util.ArrayList;

class Information {
    @Element(name = "Nazwa")
    private String name;
    @ElementList(name = "Autorzy", type = Author.class, entry = "Autor")
    private ArrayList<Author> authors;
    @Element(name = "Ostatnia-modyfikacja")
    private LastModification lastModification;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Author> getAuthors() {
        return authors;
    }

    public void setAuthors(ArrayList<Author> authors) {
        this.authors = authors;
    }

    public LastModification getLastModification() {
        return lastModification;
    }

    public void setLastModification(LastModification lastModification) {
        this.lastModification = lastModification;
    }
}
