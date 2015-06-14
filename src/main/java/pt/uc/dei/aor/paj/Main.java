package pt.uc.dei.aor.paj;

import java.nio.file.Path;
import java.nio.file.Paths;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Main {
	public static void main(String[] args) throws TransformerException {

	    StreamSource xlsStreamSource = new StreamSource(Paths
	            .get("books.xslt")
	            .toAbsolutePath().toFile());

	    StreamSource xmlStreamSource = new StreamSource(Paths
	            .get("books.xml")
	            .toAbsolutePath().toFile());

	    TransformerFactory transformerFactory = TransformerFactory.newInstance(
	            "org.apache.xalan.processor.TransformerFactoryImpl", null);

	    Path pathToHtmlFile = Paths.get("myfile.html");
	    StreamResult result = new StreamResult(pathToHtmlFile.toFile());

	    Transformer transformer = transformerFactory.newTransformer(xlsStreamSource);
	    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
	    transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
	    transformer.transform(xmlStreamSource, result);

	}
}
