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
	
	
	public MemberDao() {
		try {
			Context initialContext = new InitialContext();
			ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			
		} catch (Exception e) {
			System.out.println("커넥션오류"+e);  
		}
		
	}
	

	public boolean joinmember(MemberDto MemberDto) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result=0;
		try {
			connection = ds.getConnection();
		 pstmt = connection.prepareStatement(
	          "insert into member (mem_id,mem_email,mem_password,mem_username,mem_nickname,mem_phone,mem_job,salt,mem_birthday,mem_register_datetime)"
	              + " values (?,?,?,?,?,?,?,?,str_to_date(?,'%Y%m%d'),now());");
		 pstmt.setString(1, MemberDto.getMem_id());
		 pstmt.setString(2, MemberDto.getMem_email());
		 pstmt.setString(3, MemberDto.getMem_password());
		 pstmt.setString(4, MemberDto.getMem_username());
		 pstmt.setString(5, MemberDto.getMem_nickname());
		 pstmt.setString(6, MemberDto.getMem_phone());
		 pstmt.setString(7, MemberDto.getMem_job());
		 pstmt.setString(8, MemberDto.getSalt());
		 pstmt.setString(9, MemberDto.getMem_birthday());
		 result=pstmt.executeUpdate();
		 
		 if(result!=0){
				return true;
		 }	
	    } catch(Exception ex){
				System.out.println("joinMember : " + ex);			
		}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
			
		return false;
	}
	
	
	
	public int isMember(MemberDto MemberDto) {
		int result=-1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement("select mem_password from member where mem_id=?");
			pstmt.setString(1, MemberDto.getMem_id());
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
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		 return result;
	}
	public boolean idcheck(MemberDto MemberDto) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement("select * from member where mem_id=?");
			pstmt.setString(1, MemberDto.getMem_id());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return false;
			}
			
		} catch (Exception e) {
			System.out.println("idcheck 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
			return true;
	}
	/*
	public int getMemberNo(MemberDto MemberDto) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int no = 0;
		try {
			connection = ds.getConnection();
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
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return no;
	}*/
	
	public MemberDto getMember(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto MemberDto = null;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement("select * from member where mem_id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//String birthday = rs.getDate("mem_birthday").toString();
				//String year = birthday.substring(0, 4);
				//String month = birthday.substring(5, 7);
				//String day = birthday.substring(8, 10);
				MemberDto = new MemberDto();
				MemberDto.setMem_no(rs.getInt("mem_no"));
				MemberDto.setMem_id(rs.getString("mem_id"));
				MemberDto.setMem_email(rs.getString("mem_email"));
				MemberDto.setMem_password(rs.getString("mem_password"));
				MemberDto.setMem_username(rs.getString("mem_username"));
				MemberDto.setMem_nickname(rs.getString("mem_nickname"));
				MemberDto.setMem_phone(rs.getString("mem_phone"));
				MemberDto.setMem_job(rs.getString("mem_job"));
				MemberDto.setMem_profile_content(rs.getString("mem_profile_content"));
				MemberDto.setMem_icon(rs.getString("mem_icon"));
				MemberDto.setMem_birthday(rs.getString("mem_birthday"));
			}
		} catch (Exception e) {
			System.out.println("getMember 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return MemberDto;	
	}
	
	public String getSaltById(MemberDto MemberDto) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String salt=null;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement("select salt from member where mem_id=?");
			pstmt.setString(1, MemberDto.getMem_id());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				salt=rs.getString("salt");	
			}
		} catch (Exception e) {
			System.out.println("getsalt 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return salt;
	}
	    
		
}
	

