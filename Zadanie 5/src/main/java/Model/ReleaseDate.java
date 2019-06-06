package Model;

import org.simpleframework.xml.Attribute;

public class ReleaseDate {

    @Attribute(name = "dzień")
    private int day;
    @Attribute(name = "miesiąc")
    private Month month;
    @Attribute(name = "rok")
    private int year;

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
}
