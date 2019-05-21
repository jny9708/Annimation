package com.contest.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ContestDao {
	
	DataSource ds;
	
	public ContestDao() {
		try {
			Context initialContext = new InitialContext();
			ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			
		} catch (Exception e) {
			System.out.println("커넥션오류"+e);  
		}
	}
	
	public String getRecentlyUrl() {
		String con_url ="";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select con_url from contest order by con_no desc limit 1";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				con_url=rs.getString("con_url");
			}
		 
		 	
	    } catch(Exception ex){
				System.out.println("getRecentlyUrl : " + ex);			
		}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		
		return con_url;
	}
	
	public int InsertContest(ContestDto ContestDto) {
		int result =-1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="insert into contest" 
					+" (con_url,con_title,con_field,con_target,con_host,con_support,con_start_date,con_end_date,con_reward_total,con_reward_win,con_homepage,con_img,con_contents)" 
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, ContestDto.getCon_url());
			pstmt.setString(2, ContestDto.getCon_title());
			pstmt.setString(3, ContestDto.getCon_field());
			pstmt.setString(4, ContestDto.getCon_target());
			pstmt.setString(5, ContestDto.getCon_host());
			pstmt.setString(6, ContestDto.getCon_support());
			pstmt.setString(7, ContestDto.getCon_start_date());
			pstmt.setString(8, ContestDto.getCon_end_date());
			pstmt.setString(9, ContestDto.getCon_reward_total());
			pstmt.setString(10, ContestDto.getCon_reward_win());
			pstmt.setString(11, ContestDto.getCon_homepage());
			pstmt.setString(12, ContestDto.getCon_img());
			pstmt.setString(13, ContestDto.getCon_contents());
			result = pstmt.executeUpdate();
		 	
	    } catch(Exception ex){
				System.out.println("InsertContest : " + ex);			
		}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return result;
	}
}
