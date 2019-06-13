package View.Controllers;

import Model.Album;
import Model.Award;
import Model.Month;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;

public class AlbumWindowController  extends SpecificController {
    public TextField nameTextField;
    public TextField bandTextField;
    public TextField PLNTextField;
    public TextField USDTextField;
    public TextField dayTextField;
    public TextField yearTextField;
    public ComboBox<Award> awardComboBox;
    public ComboBox<Month> monthComboBox;

    @Override
    public void commitChanges() {
        Album album;
        if (abstractController.getReturnAlbum() == null) {
            album = new Album();
        } else {
            album = abstractController.getReturnAlbum();
        }


        abstractController.setReturnAlbum(album);
        closeWindow();
    }

    @Override
    public void refresh() {
        if(abstractController.getReturnAlbum() != null) {
            //nameTextField.setText(abstractController.getReturnedMember().getGenreName());
        }
    }
}
