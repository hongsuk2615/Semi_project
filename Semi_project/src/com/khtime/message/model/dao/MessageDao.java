package com.khtime.message.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class MessageDao {
	private Properties prop = new Properties();
	   
	   
	   public MessageDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( MessageDao.class.getResource("/sql/message/message-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
}
