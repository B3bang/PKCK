package View.Controllers;

import Model.Genre;
import javafx.scene.control.TextField;

public class GenreWindowController extends SpecificController {
    public TextField nameTextField;

    @Override
    public void commitChanges() {
        Genre genre;
        if (abstractController.getReturnedGenre() == null) {
            genre = new Genre();
        } else {
            genre = abstractController.getReturnedGenre();
        }
        genre.setGenreName(nameTextField.getText());
        abstractController.setReturnedGenre(genre);
        closeWindow();
    }

    @Override
    public void refresh() {
        if(abstractController.getReturnedGenre() != null) {
            nameTextField.setText(abstractController.getReturnedGenre().getGenreName());
        }
    }
}
