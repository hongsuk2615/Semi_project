package com.khtime.todolist.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class TodolistDao {
	private Properties prop = new Properties();
	   
	   
	   public TodolistDao() {
	      try {
	         prop.loadFromXML(new FileInputStream( TodolistDao.class.getResource("/sql/todolist/todolist-mapper.xml").getPath()   ));
	      } catch (InvalidPropertiesFormatException e) {
	         e.printStackTrace();
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
}
