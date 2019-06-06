package Model;

import org.simpleframework.xml.Element;

class Member {
    @Element(name = "Imię-i-nazwisko")
    private String firstNameAndSurname;

    public String getFirstNameAndSurname() {
        return firstNameAndSurname;
    }

    public void setFirstNameAndSurname(String firstNameAndSurname) {
        this.firstNameAndSurname = firstNameAndSurname;
    }
}