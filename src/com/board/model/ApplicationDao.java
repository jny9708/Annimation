package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public ArrayList<ApplicationDto> getApplicationList(int no) {
		ArrayList<ApplicationDto> list =new ArrayList<ApplicationDto>(); 
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from application where boa_no=?";
		
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ApplicationDto ApplicationDto = new ApplicationDto();
				ApplicationDto.setBoa_app_no(rs.getInt("boa_app_no"));
				ApplicationDto.setBoa_app_contents(rs.getString("boa_app_contents"));
				ApplicationDto.setBoa_app_date(rs.getString("boa_app_date"));
				ApplicationDto.setBoa_app_state(rs.getString("boa_app_state"));
				ApplicationDto.setBoa_no(rs.getInt("boa_no"));
				ApplicationDto.setMem_no(rs.getInt("mem_no"));
				ApplicationDto.setApp_file(rs.getString("app_file"));
				list.add(ApplicationDto);
			}
		} catch (Exception e) {
			System.out.println("getApplicationList 첫번째 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		try {
			connection = ds.getConnection();
			sql="select mem_nickname,mem_icon,mem_job,mem_email from member where mem_no=?";
			for(int i=0; i<list.size(); i++) {
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1,list.get(i).getMem_no());
				rs=pstmt.executeQuery();
				while(rs.next()) {
				list.get(i).setMem_nickname(rs.getString("mem_nickname"));
				list.get(i).setMem_icon(rs.getString("mem_icon"));
				list.get(i).setMem_job(rs.getString("mem_job"));
				list.get(i).setMem_email(rs.getString("mem_email"));
				
				}
			
			}
		} catch (Exception e) {
			System.out.println("getApplicationList 두번째 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
	
		return list;
	}
	
	public int ApplicationInsert(ApplicationDto ApplicationDto) {
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
	  
	public int YesOrNo(int mem_no, int boa_no, String state) {
		int result = -1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="update application set boa_app_state=? where boa_no=? and mem_no=?";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,state);
			pstmt.setInt(2,boa_no);
			pstmt.setInt(3,mem_no);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("YesOrNo 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		return result;
		
	}
	
	public int ApplicationDelete(int boa_no,int mem_no) {
		int result =-1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="delete from application where boa_no=? and mem_no=?";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,boa_no);
			pstmt.setInt(2,mem_no);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ApplicationDelete 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		
		return result;
		
	}
	
	public int ApplicationUpdate(ApplicationDto ApplicationDto) {
		int result=-1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="update application set boa_app_contents=?";
		if(ApplicationDto.getApp_file()!=null) {
			sql+=",app_file=?";
		}
		sql+=" where boa_app_no=?";
				
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,ApplicationDto.getBoa_app_contents());
			if(ApplicationDto.getApp_file()!=null) {
				pstmt.setString(2,ApplicationDto.getApp_file());
				pstmt.setInt(3,ApplicationDto.getBoa_app_no());
			}else if(ApplicationDto.getApp_file()==null) {
				pstmt.setInt(2,ApplicationDto.getBoa_app_no());
			}
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ApplicationUpdate 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		return result;
	}
	
}
