package Model;

import org.simpleframework.xml.Attribute;

public class AwardWinning {
    @Attribute(name = "nagroda")
    private Award Award;

    public Model.Award getAward() {
        return Award;
    }

    public void setAward(Model.Award award) {
        Award = award;
    }
}
