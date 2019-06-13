package Serialization;

import Model.RecordCollection;
import org.simpleframework.xml.Serializer;
import org.simpleframework.xml.core.Persister;
import org.simpleframework.xml.strategy.CycleStrategy;
import org.simpleframework.xml.strategy.Strategy;
import org.simpleframework.xml.stream.Format;

import java.io.File;

public class SerializationImpl implements Serialization {
    @Override
    public void Serialize(RecordCollection obj, String path) {
        try {
            Serializer serializer = new Persister(new Format("<?xml version='1.0' encoding='utf-8'?>"));

            File file = new File(path);
            serializer.write(obj, file);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public RecordCollection Deserialize(String path) {
        try {
            Strategy strategy = new CycleStrategy("zid","refzid");
            Serializer serializer = new Persister(strategy);
            File file = new File(path);
            return serializer.read(RecordCollection.class, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
