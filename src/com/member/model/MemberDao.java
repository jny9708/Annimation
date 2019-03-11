package com.member.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;
import com.member.model.MemberDto;

public class MemberDao {

	DataSource ds;
	
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDao() {
		try {
			Context initialContext = new InitialContext();
			DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			connection = ds.getConnection();
		} catch (Exception e) {
			System.out.println("커넥션오류");  
		}
		
	}
	
	public void setDataSource(DataSource ds) {
		this.ds=ds;
	}
    
	public boolean joinmember(MemberDto MemberDto) {
		int result=0;
		try {
		 
		 pstmt = connection.prepareStatement(
	          "insert into member (mem_id,mem_email,mem_password,mem_username,mem_nickname,mem_homepage,mem_phone,mem_job,mem_register_datetime)"
	              + " values (?,?,?,?,?,?,?,?,now());");
		 pstmt.setString(1, MemberDto.getMem_id());
		 pstmt.setString(2, MemberDto.getMem_email());
		 pstmt.setString(3, MemberDto.getMem_password());
		 pstmt.setString(4, MemberDto.getMem_username());
		 pstmt.setString(5, MemberDto.getMem_homepage());
		 pstmt.setString(6, MemberDto.getMem_phone());
		 pstmt.setString(7, MemberDto.getMem_job());		 
		 result=pstmt.executeUpdate();
		 
		 if(result!=0){
				return true;
		 }	
	    } catch(Exception ex){
				System.out.println("joinMember : " + ex);			
		}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
			
		return false;
	}
	
	public int isMember(MemberDto MemberDto) {
		int result=-1;
		try {
			
			System.out.println("ss3");
			pstmt = connection.prepareStatement("select mem_password from member where mem_id=?");
			System.out.println("ss2");
			pstmt.setString(1, MemberDto.getMem_id());
			System.out.println("ss1");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if (rs.getString("mem_password").equals(MemberDto.getMem_password())) {
					result=1;
				}
				else {
					result=-1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("isMember 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		 return result;
	}
	
	public int getMemberNo(MemberDto MemberDto) {
		int no = 0;
		try {
			
			pstmt = connection.prepareStatement("select * from member where mem_id=?");
			pstmt.setString(1, MemberDto.getMem_id());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				no=rs.getInt("mem_no");	
			}
		} catch (Exception e) {
			System.out.println("getMember 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return no;
	}
	    
		
}
	

