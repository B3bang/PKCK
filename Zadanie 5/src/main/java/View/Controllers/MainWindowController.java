package View.Controllers;

import Model.Album;
import Model.Genre;
import Model.Member;
import Serialization.Serialization;
import Serialization.SerializationImpl;
import View.Alert;
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
import java.util.ArrayList;
import java.util.ResourceBundle;

public class MainWindowController extends AbstractController implements Initializable {
    public Serialization serialization = new SerializationImpl();

    private String pathToXmlFile;

    public Button fileFinderButton;

    public Label pathToFileLabel;

    public TableView<Genre> genresTable;

    public TableColumn columnGenreName;

    private Genre chosenGenre;

    private ObservableList<Genre> genreObservableList;

    public TableView<Album> albumsTable;

    public TableColumn columnAlbumTitle;

    public TableColumn columnAlbumArtist;

    public TableColumn columnAlbumDate;

    public TableColumn columnAlbumAward;

    private ObservableList<Album> albumObservableList;

    private Album chosenAlbum;

    public TableView<Member> membersTable;

    public TableColumn columnFirstNameAndSurnameMember;

    private ObservableList<Member> memberObservableList;

    private Member chosenMember;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        columnGenreName.setCellValueFactory(new PropertyValueFactory<>("genreName"));
        columnAlbumTitle.setCellValueFactory(new PropertyValueFactory<>("albumName"));
        columnAlbumArtist.setCellValueFactory(new PropertyValueFactory<>("formattedBand"));
        columnAlbumDate.setCellValueFactory(new PropertyValueFactory<>("formattedDate"));
        columnAlbumAward.setCellValueFactory(new PropertyValueFactory<>("formattedAward"));
        columnFirstNameAndSurnameMember.setCellValueFactory(new PropertyValueFactory<>("firstNameAndSurname"));
    }

    public void loadXmlFile() {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setInitialDirectory(new File("src/main/resources/"));
        fileChooser.getExtensionFilters()
                .add(new FileChooser.ExtensionFilter("XML File", "*.xml"));
        File file = fileChooser.showOpenDialog(null);
        if (file != null) {
            pathToXmlFile = file.getAbsolutePath();
            pathToFileLabel.setText(pathToXmlFile);
            try {
                loadFromPath();
            } catch (Exception e) {
                Alert.alert("Błąd", "Niepoprawny plik");
            }
        }
    }

    private void loadFromPath() {
        recordCollection = serialization.Deserialize(pathToXmlFile);
        genreObservableList = FXCollections.observableArrayList(recordCollection.getGenreList());
        refreshGenreTable();
    }

    private void refreshGenreTable() {
        genreObservableList = FXCollections.observableArrayList(recordCollection.getGenreList());
        genresTable.setItems(genreObservableList);
        genresTable.refresh();
    }

    private void refreshAlbumsTable() {
        if (chosenGenre.getAlbumList() != null) {
            albumObservableList = FXCollections.observableArrayList(chosenGenre.getAlbumList());
        } else {
            albumObservableList = FXCollections.observableArrayList(new ArrayList<Album>());
        }
        albumsTable.setItems(albumObservableList);
        albumsTable.refresh();
    }

    private void refreshMemberTable() {
        if (chosenAlbum.getBand().getMemberList() != null) {
            memberObservableList = FXCollections.observableArrayList(chosenAlbum.getBand().getMemberList());
        } else {
            memberObservableList = FXCollections.observableArrayList(new ArrayList<Member>());
        }
        membersTable.setItems(memberObservableList);
        membersTable.refresh();
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
            refreshGenreTable();
        }
    }

    public void editGenre() throws IOException, CloneNotSupportedException {
        returnedGenre = genresTable.getSelectionModel().getSelectedItem();
        SpecificWindow window = new SpecificWindow("Edytuj wybrany gatunek",
                SpecificWindow.GENRE_WINDOW_TYPE, this);
        if (recordCollection != null) {
            returnedGenre = null;
            refreshGenreTable();
        }
    }

    public void showArtists() {
        chosenGenre = genresTable.getSelectionModel().getSelectedItem();
        if (chosenGenre != null) {
            refreshAlbumsTable();
        }
    }

    public void showMembers() {
        chosenAlbum = albumsTable.getSelectionModel().getSelectedItem();
        if (chosenAlbum != null) {
            refreshMemberTable();
        }
    }

    public void deleteMember() throws JAXBException, SAXException, IOException {
        if (memberObservableList != null) {
            Member member = membersTable.getSelectionModel().getSelectedItem();
            chosenAlbum.getBand().getMemberList().remove(member);
            refreshMemberTable();
        }
    }

    public void addMember() throws IOException, CloneNotSupportedException {
        SpecificWindow window = new SpecificWindow("Dodaj nowego członka",
                SpecificWindow.MEMBER_WINDOW_TYPE, this);
        if (chosenAlbum != null) {
            if (chosenAlbum.getBand().getMemberList() == null) {
                chosenAlbum.getBand().setMemberList(new ArrayList<Member>());
            }
            chosenAlbum.getBand().getMemberList().add(returnedMember);
            returnedMember = null;
            refreshMemberTable();
        }
    }

    public void editMember() throws IOException, CloneNotSupportedException {
        returnedMember = membersTable.getSelectionModel().getSelectedItem();
        SpecificWindow window = new SpecificWindow("Edytuj wybranego członka",
                SpecificWindow.MEMBER_WINDOW_TYPE, this);
        if (chosenAlbum != null) {
            returnedMember = null;
            refreshMemberTable();
        }
    }

    public void deleteAlbum() throws JAXBException, SAXException, IOException {
        if (albumObservableList != null) {
            Album album = albumsTable.getSelectionModel().getSelectedItem();
            chosenGenre.getAlbumList().remove(album);
            refreshAlbumsTable();
        }
    }

    public void addAlbum() throws IOException, CloneNotSupportedException {
        SpecificWindow window = new SpecificWindow("Dodaj nowy album",
                SpecificWindow.ALBUM_WINDOW_TYPE, this);
        if (chosenGenre != null) {
            if (chosenGenre.getAlbumList() == null) {
                chosenGenre.setAlbumList(new ArrayList<Album>());
            }
            chosenGenre.getAlbumList().add(returnAlbum);
            returnAlbum = null;
            refreshAlbumsTable();
        }
    }

    public void editAlbum() throws IOException, CloneNotSupportedException {
        returnAlbum = albumsTable.getSelectionModel().getSelectedItem();
        SpecificWindow window = new SpecificWindow("Edytuj wybrany album",
                SpecificWindow.ALBUM_WINDOW_TYPE, this);
        if (chosenGenre != null) {
            returnAlbum = null;
            refreshAlbumsTable();
        }
    }
}
