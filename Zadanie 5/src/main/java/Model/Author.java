package Model;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;

class Author {
    @Attribute(name = "id")
    private String id;
    @Element(name = "Imię-i-nazwisko")
    private String firstNameAndSurname;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstNameAndSurname() {
        return firstNameAndSurname;
    }

    public void setFirstNameAndSurname(String firstNameAndSurname) {
        this.firstNameAndSurname = firstNameAndSurname;
    }
}