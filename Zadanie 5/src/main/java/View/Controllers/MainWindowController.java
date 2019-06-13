package View.Controllers;

import Model.Genre;
import Model.RecordCollection;
import Serialization.Serialization;
import Serialization.SerializationImpl;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.FileChooser;

import javax.xml.bind.JAXBException;
import java.io.File;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

public class MainWindowController implements Initializable {
    public Serialization serialization = new SerializationImpl();

    public RecordCollection recordCollection;

    private String pathToXmlFile;

    public Button fileFinderButton;

    public Label pathToFileLabel;

    public TableView<Genre> genresTable;

    public TableColumn columnGenreName;

    private ObservableList<Genre> genreObservableList;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        columnGenreName.setCellValueFactory(new PropertyValueFactory<>("genreName"));
    }

    public void loadXmlFile() throws JAXBException {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setInitialDirectory(new File("src/main/resources/"));
        fileChooser.getExtensionFilters()
                .add(new FileChooser.ExtensionFilter("XML File", "*.xml"));
        File file = fileChooser.showOpenDialog(null);
        if (file != null) {
            pathToXmlFile = file.getAbsolutePath();
            pathToFileLabel.setText(pathToXmlFile);
            loadFromPath();
        }
    }

    private void loadFromPath() throws JAXBException {
        recordCollection = serialization.Deserialize(pathToXmlFile);
        genreObservableList = FXCollections.observableArrayList(recordCollection.getGenreList());
        genresTable.setItems(genreObservableList);
    }

    private void saveRecordCollection() throws  JAXBException {
        serialization.Serialize(recordCollection, pathToXmlFile);
    }
}
