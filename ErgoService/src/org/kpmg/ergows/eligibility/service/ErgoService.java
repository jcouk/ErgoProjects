package org.kpmg.ergows.eligibility.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.FileSystemException;

import org.apache.commons.vfs2.FileObject;
import org.apache.commons.vfs2.FileSystemManager;
import org.apache.commons.vfs2.VFS;
import org.apache.commons.vfs2.impl.StandardFileSystemManager;
import org.json.JSONObject;
import org.kpmg.ergows.eligibility.model.Person;
import org.kpmg.ergows.eligibility.util.Constants;
import org.kpmg.ergows.eligibility.util.ErgoCalculations;


public class ErgoService {
	
	public Person getPersonEligibility(String name, Double income, int age, int hhSize, Boolean hhMemberOlderThanSixtyFive, Boolean interestedInMedicaid, Boolean interestedInTANF, Boolean interestedInSNAP){
		boolean isValidInput = true;
		String errorMessage;
		
		//Validations for input fields. Not returning the error message to the user right now.
		// TODO Return the error message to the user
		
		Person person = new Person();
		if(name != null && !name.equals("")){
			person.setName(name);
		}else{
			isValidInput = false;
			errorMessage = "Please enter a valid Name";
		}
		
		if(income != null && income != 0){
			person.setIncome(income);
		}else{
			isValidInput = false;
			errorMessage = "Please enter valid Income";
		}

		if(age != 0){
			person.setAge(age);
		}else{
			isValidInput = false;
			errorMessage = "Please enter valid Age";
		}
		
		if(hhSize != 0){
			person.setHhSize(hhSize);
		}else{
			isValidInput = false;
			errorMessage = "Please enter valid Household Size";
		}
		
		if(hhMemberOlderThanSixtyFive != null){
			person.setHhMemberOlderThanSixtyFive(hhMemberOlderThanSixtyFive);
		}else{
			isValidInput = false;
			errorMessage = "Please provide the hhMemberOlderThanSixtyFive value";
		}
		
		if((interestedInMedicaid != null && interestedInMedicaid) || (interestedInTANF != null && interestedInTANF) || (interestedInSNAP != null && interestedInSNAP)){
			if(interestedInMedicaid != null && interestedInMedicaid){
				person.setInterestedInMedicaid(interestedInMedicaid);
			}
			if(interestedInTANF != null && interestedInTANF){
				person.setInterestedInTANF(interestedInTANF);			
			}
			if(interestedInSNAP != null && interestedInSNAP){
				person.setInterestedInSNAP(interestedInSNAP);
			}
		}else{
			isValidInput = false;
			errorMessage = "Please provide one of the inputs: interestedInMedicaid or interestedInTANF or interestedInSNAP";
		}
				
        File rulesFile = null;
		try {
			rulesFile = listErgoFiles();
			System.out.println("rulesFile: "+rulesFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
        if(rulesFile!=null){
        	person = ErgoCalculations.determineEligibility(person, rulesFile);
        }

		return person;
		
	}
	
	public JSONObject getDiffXML(InputStream preXML, InputStream postXML){
		
		File fileToBeReturned = null;
		File folder = null;
		
		folder = new File(Constants.ErgoFilesDirectory);
		if(folder.isDirectory()){
			File[] files = folder.listFiles(new FilenameFilter() {

				@Override
				public boolean accept(File dir, String name) {
					return name.toLowerCase().endsWith("ergo") || name.toLowerCase().endsWith("flr");
				}
			});
			
			if(files.length == 0){
				System.out.println("No Flora/Ergo rule files found");
			}
	
			for(File file : files){
				if(file.getName().startsWith("testHarness_flora")){
					fileToBeReturned = file;
					break;
				}
			}
		}
		return ErgoCalculations.diffXML(preXML, postXML, fileToBeReturned);
		
	}
	
	public File listErgoFiles(){
		
		File fileToBeReturned = null;
		File folder = null;
		
		folder = new File(Constants.ErgoFilesDirectory);
		if(folder.isDirectory()){
			File[] files = folder.listFiles(new FilenameFilter() {

				@Override
				public boolean accept(File dir, String name) {
					return name.toLowerCase().endsWith("ergo") || name.toLowerCase().endsWith("flr");
				}
			});
	
			for(File file : files){
				if(file.getName().startsWith("rules")){
					fileToBeReturned = file;
					break;
				}
			}
		}

		return fileToBeReturned;
	}
	
}
