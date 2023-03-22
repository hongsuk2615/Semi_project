package com.khtime.friend.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class FriendDao {
	private Properties prop = new Properties();
	   
	   
	   public FriendDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( FriendDao.class.getResource("/sql/friend/friend-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
}
