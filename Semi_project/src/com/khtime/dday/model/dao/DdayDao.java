package com.khtime.dday.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class DdayDao {
	private Properties prop = new Properties();
	   
	   
	   public DdayDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( DdayDao.class.getResource("/sql/dday/dday-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
}
