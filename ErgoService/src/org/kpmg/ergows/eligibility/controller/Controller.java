package org.kpmg.ergows.eligibility.controller;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.logging.Level;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.Consumes;
import javax.ws.rs.Encoded;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.json.JSONObject;
import org.kpmg.ergows.eligibility.model.Person;
import org.kpmg.ergows.eligibility.service.ErgoService;
import org.kpmg.ergows.eligibility.util.Constants;

@Path("/ws")
public class Controller extends Application {
	
	private static LocalDateTime dateTime;
	
	public Controller() {
		if(Constants.ErgoFilesDirectory == null || Constants.ErgoFilesDirectory.equals("")){
			LoadProperties();
		}
	}
	
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String sayHello(){
		String response ="<?xml version='1.0'?>" +
						"<hello>Hello XML</hello>";
		return response;
	}*/
	
	@GET
	@Produces(MediaType.TEXT_XML)
	public String newHello(){
		System.out.println("newHello()");
		String response ="<?xml version='1.0'?>" +
						"<hello>Hello XML</hello>";					
		return response;
	}
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String sayHelloHTML(){
		System.out.println("sayHelloHTML()");
		String response ="<h1>Hello HTML</h1>";
		return response;
	}
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	@Path("{name}")
	public String sayHelloInput(@PathParam("name") String name){
		System.out.println("sayHelloInput()");
		String response ="<?xml version='1.0'?>" +
				"<hello>Hello "+ name+"</hello>";
		return response;
	}
	
	@POST
	@Path("/personEligibility")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Person getPersonEligibility(@FormParam("name") String name, @FormParam("income") Double income, @FormParam("age") int age, @FormParam("hhSize") int hhSize, @FormParam("hhMemberOlderThanSixtyFive") Boolean hhMemberOlderThanSixtyFive, 
			@FormParam("interestedInMedicaid") Boolean interestedInMedicaid, @FormParam("interestedInTANF") Boolean interestedInTANF, @FormParam("interestedInSNAP") Boolean interestedInSNAP){
		System.out.println("in getPersonEligibility");
		ErgoService ergoService = new ErgoService();
		Person personResponse = ergoService.getPersonEligibility(name, income, age, hhSize, hhMemberOlderThanSixtyFive, interestedInMedicaid, interestedInTANF, interestedInSNAP);
		return personResponse;
	}
	
	@POST
	@Path("/comparexml")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	public Response getDiff(@FormDataParam("pre") InputStream preFileInputStream, @FormDataParam("pre") FormDataContentDisposition preContentDispositionHeader,
						  @FormDataParam("post") InputStream postFileInputStream, @FormDataParam("post") FormDataContentDisposition postContentDispositionHeader){
		System.out.println("in getDiff");
		ErgoService ergoService = new ErgoService();
		JSONObject jobj = ergoService.getDiffXML(preFileInputStream, postFileInputStream);
		return Response.ok(jobj.toString()).build();
	}
	
	/*
	 * Loads the properties from the properties file
	 * The properties file should go in webapps folder for now.
	 * Ideally it should be changed to sit in tomcat/conf folder or an application related conf folder 
	 */
	 @SuppressWarnings("unused")
	 public static void LoadProperties() {
		
		Properties prop = new Properties();
    	InputStreamReader input = null;
    	String dir = null;

    	try {
    		dir = System.getProperty("user.dir");
    		System.out.println("directory:" + dir);
            String propFile = null;
            if(System.getProperty("os.name").contains("Windows")) {
	    		propFile = dir + "\\" + Constants.ConfigurationFile;
            }else if(System.getProperty("os.name").contains("Linux")){
            	propFile = dir + "/../webapps/" + Constants.ConfigurationFile;
            	System.out.println("Properties file to be found at: " + propFile);
            }
    		input = new InputStreamReader(new FileInputStream(propFile), "UTF-8"); 
    		if(input != null){
    			prop.load(input);
    		}else{
    			//throw new FileNotFoundException("Property File '" + propFile + "' not found in the classpath" );
    			//logger.severe("Sorry, unable to find '" + propFile + "' at '" + directory +"'");
    			dateTime = LocalDateTime.now();
    		    System.out.println("[" + Constants.dateFormatter.format(dateTime) + "] " +"Sorry, unable to find '" + propFile + "' at '" + dir +"'");
    		    System.exit(0);
    		    //MyLogging.log(Level.SEVERE, "Sorry, unable to find '" + Constants.ConfigurationFile + "' at '" + directory +"'");
    		}
    		
            //get the property value and set it 
    		setProperties(prop);

    	} catch (IOException ex) {
    		//logger.severe("Sorry, unable to find '" + Constants.ConfigurationFile + "' at '" + directory +"'");
    		dateTime = LocalDateTime.now();
		    System.out.println("[" + Constants.dateFormatter.format(dateTime) + "] " + "Sorry, unable to find '" + Constants.ConfigurationFile + "' at '" + dir +"'");
		    System.out.println(ex.toString());
		    //LOGGER.log( Level.SEVERE, ex.toString(), ex );
		    //MyLogging.log(Level.SEVERE, "Sorry, unable to find '" + Constants.ConfigurationFile + "' at '" + directory +"'");
        } finally{
        	if(input!=null){
        		try {
				input.close();
        		} catch (IOException e) {
				dateTime = LocalDateTime.now();
			    System.out.println("[" + Constants.dateFormatter.format(dateTime) + "] " + "*** Error *** : An error occured while closing the input reader of configuration file loader. Please contact your system administrator");
			    System.out.println("[" + Constants.dateFormatter.format(dateTime) + "] " + e.toString());
				//e.printStackTrace();
				//MyLogging.log(Level.SEVERE, e.getMessage());
        		}
        	}
        }
	 }
	 
	 private static void setProperties(Properties prop) {
			
			if(null != prop.getProperty("ergo.file.directory")){
				String directory = prop.getProperty("ergo.file.directory");
				File file = new File(directory);
				if(file.isDirectory()){
					Constants.ErgoFilesDirectory = directory;
					System.out.println("ErgoFilesDirectory: "+ Constants.ErgoFilesDirectory);
				}else{
					dateTime = LocalDateTime.now();
					System.out.println("[" + Constants.dateFormatter.format(dateTime) + "] " + "'" + directory + "'" +"is not a valid directory. Please try again with a valid directory path");
					System.exit(0);
				}
			}
			if(null != prop.getProperty("prolog.directory")){
				Constants.PROLOG_DIRECTORY = prop.getProperty("prolog.directory");
				System.out.println("PROLOG_DIRECTORY: "+ Constants.PROLOG_DIRECTORY);
			}
			if(null != prop.getProperty("flora.directory")){
				Constants.FLORA_DIRECTORY = prop.getProperty("flora.directory");
				System.out.println("FLORA_DIRECTORY: "+ Constants.FLORA_DIRECTORY);
			}
			if(null != prop.getProperty("diff.xml.files.directory")){
				String directory = prop.getProperty("diff.xml.files.directory");
				File file = new File(directory);
				if(file.isDirectory()){
					Constants.DIFF_XML_FILES_DIRECTORY = directory;
					System.out.println("DIFF_XML_FILES_DIRECTORY: "+ Constants.DIFF_XML_FILES_DIRECTORY);
				}else{
					dateTime = LocalDateTime.now();
					System.out.println("[" + Constants.dateFormatter.format(dateTime) + "] " + "'" + directory + "'" +"is not a valid directory. Please try again with a valid directory path");
					System.exit(0);
				}
			}
			if(null != prop.getProperty("log.level")){
				String logLevel = prop.getProperty("log.level");
				if(logLevel.equalsIgnoreCase("OFF")){
					Constants.logLevel = Level.OFF;
				}else if(logLevel.equalsIgnoreCase("SEVERE")){
					Constants.logLevel = Level.SEVERE;
				}else if(logLevel.equalsIgnoreCase("WARNING")){
					Constants.logLevel = Level.WARNING;
				}else if(logLevel.equalsIgnoreCase("INFO")){
					Constants.logLevel = Level.INFO;
				}else if(logLevel.equalsIgnoreCase("FINE")){
					Constants.logLevel = Level.FINE;
				}else if(logLevel.equalsIgnoreCase("FINER")){
					Constants.logLevel = Level.FINER;
				}
				System.out.println("LogLevel: "+ Constants.logLevel);
			}
		}
}
