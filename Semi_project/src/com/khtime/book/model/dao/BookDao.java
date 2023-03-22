package com.khtime.book.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class BookDao {
	private Properties prop = new Properties();
	   
	   
	   public BookDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( BookDao.class.getResource("/sql/book/book-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   
	   
}