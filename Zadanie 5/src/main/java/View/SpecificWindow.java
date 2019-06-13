package View;

import View.Controllers.AbstractController;
import View.Controllers.SpecificController;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class SpecificWindow {

    public static final String GENRE_WINDOW_TYPE = "/fxml/genreWindow.fxml";
    public static final String MEMBER_WINDOW_TYPE = "/fxml/memberWindow.fxml";

    public SpecificWindow(String title, String windowType, AbstractController abstractController)
            throws IOException, CloneNotSupportedException {
        try {
            Stage stage = new Stage();
            FXMLLoader loader = new FXMLLoader();
            Parent parent = loader.load(getClass().getResourceAsStream(windowType));
            SpecificController controller = loader.getController();
            controller.setAbstractController(abstractController);
            controller.refresh();
            Scene scene = new Scene(parent);
            stage.setTitle(title);
            stage.setScene(scene);
            stage.showAndWait();
        } catch (Exception e) {
            System.out.println( "Napotkano błąd, spróbuj jeszcze raz");
        }
    }
}
