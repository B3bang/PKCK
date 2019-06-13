package View.Controllers;

import javafx.scene.control.Button;
import javafx.stage.Stage;

public abstract class SpecificController extends AbstractController {

    protected AbstractController abstractController;

    public Button commitButton;

    public Button cancelButton;

    public void setAbstractController(AbstractController abstractController) {
        this.abstractController = abstractController;
    }

    public void closeWindow() {
        Stage stage = (Stage) cancelButton.getScene().getWindow();
        stage.close();
    }

    public void cancelChanges() {
        abstractController.setReturnedGenre(null);
        closeWindow();
    }

    public abstract void commitChanges();

    public abstract void refresh() throws CloneNotSupportedException;
}
