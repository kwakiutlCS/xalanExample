package pt.uc.dei.aor.paj;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.jms.ConnectionFactory;
import javax.jms.JMSConsumer;
import javax.jms.JMSContext;
import javax.jms.JMSRuntimeException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.naming.InitialContext;
import javax.naming.NamingException;



//import javax.swing.text.Document;
import org.w3c.dom.Document;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Node;
import org.xml.sax.InputSource;


public class Subscriber implements MessageListener {
	private ConnectionFactory cf;
	private Topic topic;

	public Subscriber() throws NamingException {
		this.cf = InitialContext.doLookup("jms/RemoteConnectionFactory");
		topic = InitialContext.doLookup("jms/topic/testTopic");
	}
	

	@Override
	public void onMessage(Message msg) {
		TextMessage tmsg = (TextMessage) msg;
		System.out.println("detecta mensagem");
		try {
			loadXMLFromString(tmsg.getText());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	private static void loadXMLFromString(String xml) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = (Document) builder.parse(new InputSource(new StringReader(xml)));

		// Write the parsed document to an xml file
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		DOMSource source = new DOMSource((Node) doc);

		StreamResult result =  new StreamResult(new File("jornal.xml"));
		transformer.transform(source, result);
		generateHTML();
	}

	private void launch_and_wait() {
		try (JMSContext jcontext = cf.createContext("mr", "mr2015");) {
			jcontext.setClientID("mr");
			JMSConsumer consumer = jcontext.createDurableConsumer(topic,"mr");
			consumer.setMessageListener(this);
			System.out.println("Press enter to finish...");
			System.in.read();

		} catch (JMSRuntimeException | IOException re) {
			re.printStackTrace();
		}
	}
	
	private static void generateHTML(){
		  StreamSource xlsStreamSource = new StreamSource(Paths
		            .get("jornal.xslt")
		            .toAbsolutePath().toFile());

		    StreamSource xmlStreamSource = new StreamSource(Paths
		            .get("jornal.xml")
		            .toAbsolutePath().toFile());

		    TransformerFactory transformerFactory = TransformerFactory.newInstance(
		            "org.apache.xalan.processor.TransformerFactoryImpl", null);

		    Path pathToHtmlFile = Paths.get("jornal.html");
		    StreamResult result = new StreamResult(pathToHtmlFile.toFile());

		    Transformer transformer = null;
			try {
				transformer = transformerFactory.newTransformer(xlsStreamSource);
			} catch (TransformerConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		    transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
		    try {
				transformer.transform(xmlStreamSource, result);
			} catch (TransformerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
	
	public static void main(String[] args) throws NamingException {
		Subscriber r = new Subscriber();
		r.launch_and_wait();
	}




}