package com.board.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AniBoardDao {
	DataSource ds;
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public AniBoardDao() {
		try {
			Context initialContext = new InitialContext();
			DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			connection = ds.getConnection();
		} catch (Exception e) {
			System.out.println("커넥션오류"+e);  
		}
	}
	
	public int getListCount() {
		int x=0;
		
		try {
			pstmt=connection.prepareStatement("select count(*) from ani_board");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				x=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount 에러 :" + e);
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException e){}
		}
		return x;
	}
	
	public ArrayList<AniBoardDto> getMainBoardList() {
		ArrayList<AniBoardDto> list = new ArrayList<AniBoardDto>();
		try {
			pstmt=connection.prepareStatement("select * from ani_board order by boa_no desc limit 6");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				AniBoardDto AniBoardDto = new AniBoardDto();
				AniBoardDto.setBoa_no(rs.getInt("boa_no"));
				AniBoardDto.setBoa_title(rs.getString("boa_title"));
				AniBoardDto.setBoa_content(rs.getString("boa_content"));
				AniBoardDto.setBoa_date(rs.getDate("boa_date"));
				AniBoardDto.setBoa_hit(rs.getInt("boa_hit"));
				AniBoardDto.setBoa_like(rs.getInt("boa_like"));
				AniBoardDto.setMem_no(rs.getInt("mem_no"));
				AniBoardDto.setBoa_thum_path(rs.getString("boa_thum_path"));
				list.add(AniBoardDto);
			}
		} catch (Exception e) {
			System.out.println("getMainBoardList 에러 :" + e);
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException e){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException e){}
		}
		return list;

	}
	
}
