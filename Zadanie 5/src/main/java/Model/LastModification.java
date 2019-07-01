package Model;

import org.simpleframework.xml.Attribute;

public class LastModification {
    @Attribute(name = "dzień")
    private int day;
    @Attribute(name = "miesiąc")
    private Month month;
    @Attribute(name = "rok")
    private int year;
    @Attribute(name = "Autor")
    private String author;

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public Month getMonth() {
        return month;
    }

    public void setMonth(Month month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}