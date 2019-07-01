package Serialization;

import net.sf.saxon.Transform;


public class TransformationImpl implements Transformation{
    @Override
    public void transform(String xmlPath, String xsltPath, String outputPath) {
        String[] arglist = {"-o:" + outputPath, xmlPath, xsltPath};

        Transform.main(arglist);
    }
}
