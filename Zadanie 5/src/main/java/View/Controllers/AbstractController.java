package View.Controllers;

import Model.Genre;
import Model.RecordCollection;

public abstract class AbstractController {
    protected RecordCollection recordCollection;

    protected Genre returnedGenre;

    public RecordCollection getRecordCollection() {
        return recordCollection;
    }

    public void setRecordCollection(RecordCollection recordCollection) {
        this.recordCollection = recordCollection;
    }

    public Genre getReturnedGenre() {
        return returnedGenre;
    }

    public void setReturnedGenre(Genre returnedGenre) {
        this.returnedGenre = returnedGenre;
    }
}
