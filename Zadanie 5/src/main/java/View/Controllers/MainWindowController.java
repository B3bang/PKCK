package View.Controllers;

import Model.Genre;
import Model.RecordCollection;
import Serialization.Serialization;
import Serialization.SerializationImpl;
import View.SpecificWindow;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.FileChooser;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXBException;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class MainWindowController extends AbstractController implements Initializable {
    public Serialization serialization = new SerializationImpl();

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
        refreshGenreTable();
    }

    private void refreshGenreTable() {
        genreObservableList = FXCollections.observableArrayList(recordCollection.getGenreList());
        genresTable.setItems(genreObservableList);
        genresTable.refresh();
    }

    public void saveRecordCollection() throws JAXBException {
        serialization.Serialize(recordCollection, pathToXmlFile);
    }

    public void deleteGenre() throws JAXBException, SAXException, IOException {
        if (recordCollection != null) {
            Genre genre = genresTable.getSelectionModel().getSelectedItem();
            recordCollection.getGenreList().remove(genre);
            refreshGenreTable();
        }
    }

    public void addGenre() throws IOException, CloneNotSupportedException {
        SpecificWindow window = new SpecificWindow("Dodaj nowy gatunek",
                SpecificWindow.GENRE_WINDOW_TYPE, this);
        if (recordCollection != null) {
            recordCollection.getGenreList().add(returnedGenre);
            returnedGenre = null;
            genresTable.refresh();
        }
    }

    public void editGenre() throws IOException, CloneNotSupportedException {
        returnedGenre = genresTable.getSelectionModel().getSelectedItem();
        SpecificWindow window = new SpecificWindow("Edytuj wybrany gatunek",
                SpecificWindow.GENRE_WINDOW_TYPE, this);
        if (recordCollection != null) {
            returnedGenre = null;
            genresTable.refresh();
        }
    }
}
