package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public int ApplicationInset(ApplicationDto ApplicationDto) {
		int result =-1;
		boolean file=false;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="insert into application (boa_app_contents,boa_no,mem_no";
		if(ApplicationDto.getApp_file()!=null) {
			sql+=",app_file";
			file=true;
		}
		sql+=") values (?,?,?";
		if(file) {
			sql+=",?";
		}
		sql+=")";
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,ApplicationDto.getBoa_app_contents());
			pstmt.setInt(2,ApplicationDto.getBoa_no());
			pstmt.setInt(3,ApplicationDto.getMem_no());
			if(file) {
				pstmt.setString(4,ApplicationDto.getApp_file());
			}
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ApplicationInset 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		return result;
	}
	
	
}
