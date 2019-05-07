package com.board.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ApplicationDao {
	DataSource ds;
	
	public ApplicationDao() {
		try {
			Context initialContext = new InitialContext();
			ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			
		} catch (Exception e) {
			System.out.println("커넥션오류"+e);  
		}
	}
	
	public ApplicationDto getApplicationList() {
		
		return null;
	}
	
}
