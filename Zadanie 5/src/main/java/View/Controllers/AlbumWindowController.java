package View.Controllers;

import Model.*;
import View.Alert;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;

import java.util.ArrayList;

public class AlbumWindowController extends SpecificController {
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
        try {
            if (abstractController.getReturnAlbum() == null) {
                album = new Album();
            } else {
                album = abstractController.getReturnAlbum();
            }
            album.setAlbumName(nameTextField.getText());

            if (album.getBand() == null) {
                album.setBand(new Band());
            }
            album.getBand().setPerformer(bandTextField.getText());

            if (album.getPrices() == null) {
                album.setPrices(new ArrayList<Price>());
                album.getPrices().add(new Price());
                album.getPrices().add(new Price());
                album.getPrices().get(0).setCurrency("PLN");
                album.getPrices().get(1).setCurrency("USD");
            }

            album.getPrices().get(0).setPrice(Double.parseDouble(PLNTextField.getText()));
            album.getPrices().get(1).setPrice(Double.parseDouble(USDTextField.getText()));
            if (album.getReleaseDate() == null) {
                album.setReleaseDate(new ReleaseDate());
            }
            album.getReleaseDate().setDay(Integer.parseInt(dayTextField.getText()));
            album.getReleaseDate().setYear(Integer.parseInt(yearTextField.getText()));
            album.getReleaseDate().setMonth(monthComboBox.getValue());
            if(album.getAwardWinning() == null) {
                album.setAwardWinning(new AwardWinning());
            }
            album.getAwardWinning().setAward(awardComboBox.getValue());

            abstractController.setReturnAlbum(album);
            closeWindow();
        }
       catch (Exception e) {
           Alert.alert("Błąd", "Niepoprawne dane");
       }
    }

    @Override
    public void refresh() {
        awardComboBox.getItems().setAll(Award.values());
        monthComboBox.getItems().setAll(Month.values());
        if (abstractController.getReturnAlbum() != null) {
            nameTextField.setText(abstractController.getReturnAlbum().getAlbumName());
            bandTextField.setText(abstractController.getReturnAlbum().getBand().getPerformer());
            PLNTextField.setText(Double.toString(abstractController.getReturnAlbum().getPrices().get(0).getPrice()));
            USDTextField.setText(Double.toString(abstractController.getReturnAlbum().getPrices().get(1).getPrice()));
            dayTextField.setText(Integer.toString(abstractController.getReturnAlbum().getReleaseDate().getDay()));
            yearTextField.setText(Integer.toString(abstractController.getReturnAlbum().getReleaseDate().getYear()));
            monthComboBox.getSelectionModel().select(abstractController.getReturnAlbum().getReleaseDate().getMonth());
            awardComboBox.getSelectionModel().select(abstractController.getReturnAlbum().getAwardWinning().getAward());
        }
    }
}
