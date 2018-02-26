package org.kpmg.ergows.eligibility.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;

public class Constants {
	
	public static DateFormat dateFormat = new SimpleDateFormat("MMddyy");
	public static DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm:ss a");
	public static String ConfigurationFile = "config.properties";
	
	public static String ErgoFilesDirectory;
	public static Level logLevel;
	public static String PROLOG_DIRECTORY;
	public static String FLORA_DIRECTORY;
	public static String DIFF_XML_FILES_DIRECTORY;
}
