/**
 * 
 */
package org.kpmg.ergows.eligibility.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObject;

import net.sf.flora2.API.FloraObject;
import net.sf.flora2.API.FloraSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.kpmg.ergows.eligibility.model.Person;

/**
 * @author jcouk
 *
 */
public class ErgoCalculations {

	private static String basicMod = "basic_mod";

	public static Person determineEligibility(Person person, File rulesFile) {

		//System.setProperty("PROLOGDIR", "C:\\Users\\kanwaryuvrajsingh\\Flora-2\\XSB\\config\\x64-pc-windows\\bin");
		//System.setProperty("FLORADIR", "C:\\Users\\kanwaryuvrajsingh\\Flora-2\\flora2");
		
		System.setProperty("PROLOGDIR", Constants.PROLOG_DIRECTORY);
		System.setProperty("FLORADIR", Constants.FLORA_DIRECTORY);
		
		// create a new session for a running instance of the engine
		FloraSession session = new FloraSession();
		System.out.println("Engine session started");
		
		// Assume that Java was called with -DINPUT_FILE=the-file-name
		
		String fileName = null;
		//System.out.println(rulesFile.getURL().getPath());
		try {
			if(System.getProperty("os.name").contains("Windows")) {
				fileName = rulesFile.toURI().toURL().toString().substring(6);
            }else if(System.getProperty("os.name").contains("Linux")){
    			fileName = rulesFile.toURI().toURL().toString().substring(5);
            }
			System.out.println("fileName: " + fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		if(fileName == null || fileName.trim().length() == 0) 
		{
			System.out.println("Invalid path to example file!");
			System.exit(0);
		}
		// load the program into module basic_mod
		if (session.loadFile(fileName,basicMod)){
			System.out.println("Example loaded successfully!");
			
			// add person information Note: Name is included in the other inserts.
			// Not need for a specific command for that.
			 

			// Age
			// No insert is the same as false
			if (person.getHhMemberOlderThanSixtyFive()) {
				Boolean addAge = session.ExecuteCommand(person
						.getErgoHhMemberOlderThanSixtyFive());
				System.out.println(person.getErgoHhMemberOlderThanSixtyFive());
				if (!addAge)
					System.out.println("Error Adding Age to Ergo!");
			}

			// Income
			Boolean addIncome = session.ExecuteCommand(person.getErgoIncome());
			System.out.println(person.getErgoIncome());
			if (!addIncome)
				System.out.println("Error Adding Income to Ergo!");

			// hhSize
			Boolean addHHSize = session.ExecuteCommand(person.getErgoHhSize());
			System.out.println(person.getErgoHhSize());
			if (!addHHSize)
				System.out.println("Error Adding hhSIze to Ergo!");

			
			//get responses starting here
			 

			// get TANF Eligible Boolean
			Boolean isTanfEligible = returnBooleanValue(session,
					person.getErgoTanfEligible(), person.getName());
			person.setTanfEligible(isTanfEligible);

			// get SNAP Eligible Boolean
			Boolean isSnapEligible = returnBooleanValue(session,
					person.getErgoSnapEligible(), person.getName());
			person.setSnapEligible(isSnapEligible);

			// get TANF Eligible Boolean
			Boolean isMedEligible = returnBooleanValue(session,
					person.getErgoMedicaidEligible(), person.getName());
			person.setMedicaidEligible(isMedEligible);

			// get HH Income limits have been calculated
			Boolean incomeLimitsCalculated = returnBooleanValue(session,
					person.getErgoQueryIncomeLimitsCalculated(), person.getName());
			person.setIncomeLimitsCalculated(incomeLimitsCalculated);
		} else {
			System.out.println("Error loading the example!");
		}
		
		// quit the system
		session.close();
		return person;

	}
	
	public static JSONObject diffXML(InputStream preXML, InputStream postXML, File rulesFile) {

		//System.setProperty("PROLOGDIR", "C:\\Users\\kanwaryuvrajsingh\\Flora-2\\XSB\\config\\x64-pc-windows\\bin");
		//System.setProperty("FLORADIR", "C:\\Users\\kanwaryuvrajsingh\\Flora-2\\flora2");
		
		System.setProperty("PROLOGDIR", Constants.PROLOG_DIRECTORY);
		System.setProperty("FLORADIR", Constants.FLORA_DIRECTORY);
		
		// create a new session for a running instance of the engine
		FloraSession session = new FloraSession();
		System.out.println("Engine session started");
		
		File preXMLFile = null;
		File postXMLFile = null;
		
		if(System.getProperty("os.name").contains("Windows")) {
			preXMLFile = saveFile(preXML, Constants.DIFF_XML_FILES_DIRECTORY+"\\prexml.xml");
			postXMLFile = saveFile(postXML, Constants.DIFF_XML_FILES_DIRECTORY+"\\postxml.xml");
        }else if(System.getProperty("os.name").contains("Linux")){
        	preXMLFile = saveFile(preXML, Constants.DIFF_XML_FILES_DIRECTORY+"/prexml.xml");
        	postXMLFile = saveFile(postXML, Constants.DIFF_XML_FILES_DIRECTORY+"/postxml.xml");
        }
				
		String fileName = null;
		//System.out.println(rulesFile.getURL().getPath());
		try {
			if(System.getProperty("os.name").contains("Windows")) {
				fileName = rulesFile.toURI().toURL().toString().substring(6);
            }else if(System.getProperty("os.name").contains("Linux")){
    			fileName = rulesFile.toURI().toURL().toString().substring(5);
            }
			System.out.println("fileName: " + fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		if(fileName == null || fileName.trim().length() == 0) 
		{
			System.out.println("Invalid path to example file!");
			System.exit(0);
		}
		JSONObject obj = null;
		// load the program into module basic_mod
		if (session.loadFile(fileName,basicMod)){
			System.out.println(fileName+" Rules file loaded successfully!");
			
			String preXMLCMD = null;
			String postXMLCMD = null;
				try {
					if(System.getProperty("os.name").contains("Windows")) {
						preXMLCMD = "\'"+preXMLFile.toURI().toURL().toString().substring(6) +"\'[load_xml(pre) -> ?W]@\\xml.";
						System.out.println("Pre XML Cmd: " + preXMLCMD);
						postXMLCMD = "\'"+postXMLFile.toURI().toURL().toString().substring(6)+"\'[load_xml(post) -> ?W]@\\xml.";
						System.out.println("Post XML Cmd: " + postXMLCMD);
		            }else if(System.getProperty("os.name").contains("Linux")){
		    			preXMLCMD = "\'"+preXMLFile.toURI().toURL().toString().substring(5) +"\'[load_xml(pre) -> ?W]@\\xml.";
		    			System.out.println("Pre XML Cmd: " + preXMLCMD);
						postXMLCMD = "\'"+postXMLFile.toURI().toURL().toString().substring(5)+"\'[load_xml(post) -> ?W]@\\xml.";
						System.out.println("Post XML Cmd: " + postXMLCMD);
		            }
					
					//preXMLCMD = "\'"+ getStringFromInputStream(preXML) +"\'[load_xml(pre) -> ?W]@\\xml.";
					//preXMLCMD = "\'"+ "insert{"+getStringFromInputStream(preXML)+"[pre -> ?W]@\\xml.";
					//postXMLCMD = "\'"+ getStringFromInputStream(postXML) +"\'[load_xml(post) -> ?W]@\\xml.";
					//postXMLCMD = "\'"+ "insert{"+getStringFromInputStream(postXML) +"\'[post -> ?W]@\\xml.";
					
					System.out.println("fileName: " + fileName);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Boolean preXMLLoaded = session.ExecuteCommand(preXMLCMD);
				Boolean postXMLLoaded = session.ExecuteCommand(postXMLCMD);
				Boolean compareResult = null;
				if (!preXMLLoaded || !postXMLLoaded){
					System.out.println("Error occured while adding either of the xmls!");
				}else{
					Vector<String> vars = new Vector<String>();
					vars.add("?iteration");
					vars.add("?instance");
					vars.add("?entityType");
					vars.add("?publicName");
					vars.add("?attrValue");
					Iterator<HashMap<String, FloraObject>> personObjs = session.ExecuteQuery("compare(?iteration, ?instance, ?entityType, ?publicName, ?attrValue, pre, post )@basic_mod.",vars);

					/* Identifying the person in the Iterator */
					//JSONArray jsonArray = new JSONArray();
					obj = new JSONObject();
					while (personObjs.hasNext()) {
						HashMap<String,FloraObject> personObj = personObjs.next();
						 
						Object iterationObj = personObj.get("?iteration");
						Object instanceObj = personObj.get("?instance");
						Object entityTypeObj = personObj.get("?entityType");
						Object publicNameObj = personObj.get("?publicName");
						Object attrValueObj = personObj.get("?attrValue");
						
						if(iterationObj.toString().equalsIgnoreCase("pre")){
							obj.accumulate("Instance - "+instanceObj.toString()+ ", Entity Type - " + entityTypeObj.toString()+ ", Public Name - " + publicNameObj.toString(), "Pre Value - "+ attrValueObj);
						}else if(iterationObj.toString().equalsIgnoreCase("post")){
							obj.accumulate("Instance - "+instanceObj.toString()+ ", Entity Type - " + entityTypeObj.toString()+ ", Public Name - " + publicNameObj.toString(), "Post Value - " + attrValueObj);
						}
						
						System.out.println(iterationObj+", "+instanceObj+", "+entityTypeObj+", "+publicNameObj+", "+attrValueObj);
						//System.out.println("Person name:" + personObj);
						//jsonArray.put(obj);
					}
					System.out.println("obj:" + obj);
				}
		} else {
			System.out.println("Error loading the example!");
		}
		
		// quit the system
		session.close();
		return obj;

	}

	private static Boolean returnBooleanValue(FloraSession session,
			String query, String name) {
		
		String ergoQuery = query + "@" + basicMod + ".";
		System.out.println("ergoQuery: "+ergoQuery);
		Iterator<FloraObject> personObjs = session.ExecuteQuery(ergoQuery);

		/* Identifying the person in the Iterator */
		while (personObjs.hasNext()) {
			FloraObject personObj = personObjs.next();
			System.out.println("Person name:" + personObj);
			if (personObj.toString().equals(name)) {
				System.out.println(query
						+ " result: Person Name found in Query!");
				return Boolean.TRUE;
			}
		}

		System.out.println(query + " result: Person Name NOT found!");
		return Boolean.FALSE;
	}
	
	// save uploaded file to a defined location on the server

	private static File saveFile(InputStream uploadedInputStream, String serverLocation) {
		
		System.out.println("Server Location: "+ serverLocation);
		File file = null;
		try {
			file = new File(serverLocation);
			OutputStream outpuStream = new FileOutputStream(file);
			int read = 0;
			byte[] bytes = new byte[1024];
			
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				outpuStream.write(bytes, 0, read);
			}
			outpuStream.flush();
			outpuStream.close();
			uploadedInputStream.close();
			file.setExecutable(true);
		    file.setReadable(true);
		    file.setWritable(true);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}
	
	// convert InputStream to String
	private static String getStringFromInputStream(InputStream is) {

		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();

		String line;
		try {

			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();

	}
}
