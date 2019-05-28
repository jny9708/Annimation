package com.contest.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public int getContestNum() {
		int ContestNum = -1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select count(*) from contest where TO_DAYS(con_end_date)-TO_DAYS(now())>0";
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ContestNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getContestNum 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		return ContestNum;
	}
	
	public ArrayList<ContestDto> getContestList(int pagenum){
		ArrayList<ContestDto> con_list = new ArrayList<ContestDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (pagenum-1)*10;
		String sql="select con_no,con_title,con_host,con_start_date,con_end_date,con_img,con_hit,TO_DAYS(con_end_date)-TO_DAYS(now())as d_day from contest having d_day >0 order by con_no desc limit ?,10";
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,startrow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ContestDto ContestDto = new ContestDto();
				ContestDto.setCon_no(rs.getInt("con_no"));
				ContestDto.setCon_title(rs.getString("con_title"));
				ContestDto.setCon_host(rs.getString("con_host"));
				ContestDto.setCon_start_date(rs.getString("con_start_date"));
				ContestDto.setCon_end_date(rs.getString("con_end_date"));
				ContestDto.setD_day(rs.getInt("d_day"));
				ContestDto.setCon_img(rs.getString("con_img"));
				ContestDto.setCon_hit(rs.getInt("con_hit"));  
				con_list.add(ContestDto);
			}
			
		} catch (Exception e) {
			System.out.println("getContestList 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		return con_list;
	}
	
	public ArrayList<ContestDto> getPopList(){
		ArrayList<ContestDto> pop_list = new ArrayList<ContestDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select con_no,con_title,con_host,con_img,con_hit,TO_DAYS(con_end_date)-TO_DAYS(now())as d_day from contest having d_day >0 order by con_hit desc limit 5";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ContestDto ContestDto = new ContestDto();
				ContestDto.setCon_no(rs.getInt("con_no"));
				ContestDto.setCon_title(rs.getString("con_title"));
				ContestDto.setCon_host(rs.getString("con_host"));
				ContestDto.setD_day(rs.getInt("d_day"));
				ContestDto.setCon_img(rs.getString("con_img"));
				ContestDto.setCon_hit(rs.getInt("con_hit"));
				pop_list.add(ContestDto);
			}
			
		} catch (Exception e) {
			System.out.println("getPopList 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return pop_list;
	}
	
	public ContestDto getContestDetail(int con_no) {
		ContestDto ContestDto = new ContestDto();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select *,TO_DAYS(con_end_date)-TO_DAYS(now())as d_day from contest where con_no=?";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,con_no);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ContestDto.setCon_no(rs.getInt("con_no"));
				ContestDto.setCon_url(rs.getString("con_url"));
				ContestDto.setCon_title(rs.getString("con_title"));
				ContestDto.setCon_field(rs.getString("con_field"));
				ContestDto.setCon_target(rs.getString("con_target"));
				ContestDto.setCon_host(rs.getString("con_host"));
				ContestDto.setCon_support(rs.getString("con_support"));
				ContestDto.setCon_start_date(rs.getString("con_start_date"));
				ContestDto.setCon_end_date(rs.getString("con_end_date"));
				ContestDto.setD_day(rs.getInt("d_day"));
				ContestDto.setCon_reward_total(rs.getString("con_reward_total"));
				ContestDto.setCon_reward_win(rs.getString("con_reward_win"));
				ContestDto.setCon_homepage(rs.getString("con_homepage"));
				ContestDto.setCon_img(rs.getString("con_img"));
				ContestDto.setCon_contents(rs.getString("con_contents"));
				ContestDto.setCon_hit(rs.getInt("con_hit"));
			}
			
		} catch (Exception e) {
			System.out.println("getContestDetail 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return ContestDto;
	}
	public int AddContestHit(int con_no) {
		int result=-1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="update contest set con_hit = con_hit+1 where con_no=?";
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,con_no);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("AddContestHit 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		
		return result;
	}
}
