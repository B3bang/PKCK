package Model;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Text;

public class Price {
    @Attribute(name = "waluta")
    private String currency;
    @Text
    private double Price;

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }
}
