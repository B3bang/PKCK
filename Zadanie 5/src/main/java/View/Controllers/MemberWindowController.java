package View.Controllers;

import Model.Member;
import javafx.scene.control.TextField;

public class MemberWindowController extends SpecificController {
    public TextField nameTextField;

    @Override
    public void commitChanges() {
        Member member;
        if (abstractController.getReturnedMember() == null) {
            member = new Member();
        } else {
            member = abstractController.getReturnedMember();
        }
        member.setFirstNameAndSurname(nameTextField.getText());
        abstractController.setReturnedMember(member);
        closeWindow();
    }

    @Override
    public void refresh() {
        if (abstractController.getReturnedMember() != null) {
            nameTextField.setText(abstractController.getReturnedMember().getFirstNameAndSurname());
        }
    }
}
