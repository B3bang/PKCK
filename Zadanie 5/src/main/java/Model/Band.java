package Model;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.ElementList;

import java.util.ArrayList;

public class Band {
    @Attribute(name = "Wykonawca")
    private String Performer;
    @ElementList(name = "Członkowie", type = Member.class, entry = "Członek", required = false)
    private ArrayList<Member> memberList;

    public ArrayList<Member> getMemberList() {
        return memberList;
    }

    public void setMemberList(ArrayList<Member> memberList) {
        this.memberList = memberList;
    }

    public String getPerformer() {
        return Performer;
    }

    public void setPerformer(String performer) {
        Performer = performer;
    }
}
