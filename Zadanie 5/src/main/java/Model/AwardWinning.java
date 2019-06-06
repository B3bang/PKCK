package Model;

import org.simpleframework.xml.Attribute;

public class AwardWinning {
    @Attribute(name = "nagroda")
    private String Award;

    public String getAward() {
        return Award;
    }

    public void setAward(String award) {
        Award = award;
    }
}
