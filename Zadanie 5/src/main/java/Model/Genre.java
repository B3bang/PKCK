package Model;

import org.simpleframework.xml.Element;
import org.simpleframework.xml.ElementList;

import java.util.ArrayList;

public class Genre {
    @Element(name = "Nazwa")
    private String genreName;
    @ElementList(name = "Albumy", type = Album.class, entry = "Album")
    private ArrayList<Album> albumList;

    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }

    public ArrayList<Album> getAlbumList() {
        return albumList;
    }

    public void setAlbumList(ArrayList<Album> albumList) {
        this.albumList = albumList;
    }
}
