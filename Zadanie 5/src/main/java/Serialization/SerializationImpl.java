package Serialization;

import Model.Band;
import Model.RecordCollection;
import org.simpleframework.xml.Serializer;
import org.simpleframework.xml.core.Persister;
import org.simpleframework.xml.strategy.CycleStrategy;
import org.simpleframework.xml.strategy.Strategy;
import org.simpleframework.xml.stream.Format;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SerializationImpl implements Serialization {
    @Override
    public void Serialize(RecordCollection obj, String path) {
        try {
            Strategy strategy = new CycleStrategy("zid","refzid", "Zespół");
            Serializer serializer = new Persister(strategy,new Format("<?xml version='1.0' encoding='utf-8'?>"));

            File file = new File(path);
            serializer.write(obj, file);
            Charset charset = StandardCharsets.UTF_8;
            Path pathFromPath = Paths.get(path);
            String content = new String(Files.readAllBytes(pathFromPath), charset);
            content = content.replaceAll("zid=\"", "zid=\"_");
            Files.write(pathFromPath, content.getBytes(charset));
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
