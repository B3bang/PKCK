package Serialization;

import Model.RecordCollection;

public interface Serialization {
    void Serialize(RecordCollection obj, String path);

    RecordCollection Deserialize(String path);
}

