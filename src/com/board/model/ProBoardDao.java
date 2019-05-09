package com.board.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProBoardDao {
	DataSource ds;
	
	public ProBoardDao(){
		try {
			Context initialContext = new InitialContext();
			ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			
		} catch (Exception e) {
			System.out.println("커넥션오류"+e);  
		}
	}
	
	/*public int getAppCount(ProBoardDto ProBoardDto) {
		int x=0;
		String sql="select count(*) from application where boa_no=?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,);
		} catch (Exception e) {
			System.out.println("getAppCount 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		return x;
	}*/
		
	public ArrayList<ProBoardDto> getProBoradList(int sort, Map<String,Object> SearchMap){
		ArrayList<ProBoardDto> list = new ArrayList<ProBoardDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select *,TO_DAYS(boa_rec_deadline)-TO_DAYS(now())as d_day from pro_board ";
		int where =0;
		if(SearchMap.get("Project_Search")!=null) {
			if(where==0) {
				sql+="where boa_title like '%"+SearchMap.get("Project_Search")+"%'";
				where = 1;
			}else {
				sql+=" and boa_title like '%"+SearchMap.get("Project_Search")+"%'";	
			}
		}
		if(SearchMap.get("Occupation")!=null) {
			if(where==0) {
				sql+="where boa_job='"+SearchMap.get("Occupation")+"'";
				where = 1;
			}else {
				sql+=" and boa_job='"+SearchMap.get("Occupation")+"'";	
			}
		}
		if(SearchMap.get("Category")!=null) {
			if(where==0) {
				sql+="where boa_category='"+SearchMap.get("Category")+"'";
				where = 1;
			}else {
				sql+=" and boa_category='"+SearchMap.get("Category")+"'";	
			}
		}
		if(SearchMap.get("Region")!=null) {
			if(where==0) {
				sql+="where boa_region='"+SearchMap.get("Region")+"'";
				where = 1;
			}else {
				sql+=" and boa_region='"+SearchMap.get("Region")+"'";	
			}
		} 
		if(SearchMap.get("Period")!=null) {
			if(SearchMap.get("Period").equals("Period_No")==false) {
				if(where==0) {
					sql+="where boa_pro_period='"+SearchMap.get("Period")+"'";
					where=1;
				}else {
					sql+=" and boa_pro_period='"+SearchMap.get("Period")+"'";	
				}
			}
			
		}
		if(SearchMap.get("Size")!=null) {   
			if(SearchMap.get("Size").equals("Size_No")==false) {
				if(where==0) {
					sql+="where boa_size='"+SearchMap.get("Size")+"'";
					where=1;
				}else {
					sql+=" and boa_size='"+SearchMap.get("Size")+"'";	
				}
			}
		}
		if(SearchMap.get("Experience")!=null) {
			if(where==0) {
				sql+="where boa_experi='"+SearchMap.get("Experience")+"'";
				where=1;
			}else {
				sql+=" and boa_experi='"+SearchMap.get("Experience")+"'";	
			}
			
		}   
		System.out.println(sql);  
		
		if(sort==0) {
			sql=sql+" having d_day>0 or d_day=0 order by boa_no desc";
		}else if(sort==1) {
			sql=sql+" having d_day>0 or d_day=0 order by boa_hit desc,boa_no desc";
		}else if(sort==2) {
			sql=sql+" having d_day>0 or d_day=0 order by d_day asc";
		}
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProBoardDto ProBoardDto = new ProBoardDto();
				ProBoardDto.setMem_no(rs.getInt("mem_no"));
				ProBoardDto.setBoa_no(rs.getInt("boa_no"));
				ProBoardDto.setBoa_title(rs.getString("boa_title"));
				ProBoardDto.setBoa_job(rs.getString("boa_job"));
				ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
				ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
				ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
				ProBoardDto.setBoa_num(rs.getInt("boa_num"));
				ProBoardDto.setBoa_pro_period(rs.getString("boa_pro_period"));
				ProBoardDto.setBoa_region(rs.getString("boa_region"));
				list.add(ProBoardDto);
			}
			sql="select mem_nickname,mem_icon,mem_job from member where mem_no=?";
			for(int i=0; i<list.size(); i++) {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,list.get(i).getMem_no());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				list.get(i).setMem_nickname(rs.getString("mem_nickname"));
				list.get(i).setMem_icon(rs.getString("mem_icon"));
				list.get(i).setMem_job(rs.getString("mem_job"));
			}
			}
			
			sql="select count(*) from application where boa_no=?";
			for(int i=0; i<list.size(); i++) {
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1,list.get(i).getBoa_no());
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					list.get(i).setApp_number(rs.getInt(1));
				}
			}
			sql="select tag_contents from hashtag where boa_no=? limit 9";
			for(int i=0; i<list.size(); i++) {
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1,list.get(i).getBoa_no());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					list.get(i).boa_hashtag.add(rs.getString("tag_contents"));
				}
			}
		} catch (Exception e) {
			System.out.println("getProBoradList 오류: " + e);		 
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return list;
	}
	public ArrayList<String> getPopulartags(){
		ArrayList<String> Populartags = new ArrayList<String>();
		
		return Populartags;
	}
	public ArrayList<ProBoardDto> getSearchProBoradList(int sort,Map<String,Object> SearchMap){

		ArrayList<ProBoardDto> list = new ArrayList<ProBoardDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] Genre= null;
		ArrayList<Integer> GenreArray = new ArrayList<Integer>();
			
		
			if(SearchMap.get("Genre")!=null) {
				try {
					connection = ds.getConnection();
				Genre=(String[])SearchMap.get("Genre");
				sql="select boa_no from genre where genre_contents=?";
				for(int i=0;i<Genre.length-1;i++) {
					sql=sql+" or genre_contents=?";
				}
				sql=sql+" group by boa_no desc";
				pstmt = connection.prepareStatement(sql);
				for(int i=0;i<Genre.length;i++) {
				pstmt.setNString(i+1,Genre[i]);;
				}
				rs=pstmt.executeQuery();
				while(rs.next()) {
					GenreArray.add(rs.getInt(1));
				}
				System.out.println("뭐가들어있냐면 "+GenreArray);
				} catch (Exception e) {
					System.out.println("getSearchProBoradList1 오류: " + e);		
				}finally {
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					if(connection!=null) try {connection.close();} catch(Exception ex) {}
				}
				
				try {
					connection = ds.getConnection(); 
					if(GenreArray.size()!=0) {
						sql="select *,TO_DAYS(boa_rec_deadline)-TO_DAYS(now())as d_day from pro_board ";
						sql=sql+"where (boa_no="+GenreArray.get(0);
						for(int i=1;i<GenreArray.size();i++) {
							sql=sql+" or boa_no="+GenreArray.get(i);
						}
						sql=sql+")";
						System.out.println(sql);
						if(SearchMap.get("Project_Search")!=null) {
							sql=sql+" and boa_title like '%"+SearchMap.get("Project_Search")+"%'";
						}
						if(SearchMap.get("Occupation")!=null) {
							sql=sql+" and boa_job='"+SearchMap.get("Occupation")+"'";
						}
						if(SearchMap.get("Category")!=null) {
							sql=sql+" and boa_category='"+SearchMap.get("Category")+"'";
						}
						if(SearchMap.get("Period")!=null) {
							if(SearchMap.get("Period").equals("Period_No")==false) {
								sql+=" and boa_pro_period='"+SearchMap.get("Period")+"'";
							}
							
						}
						if(SearchMap.get("Size")!=null) {
							if(SearchMap.get("Size").equals("Size_No")==false) {
								sql+=" and boa_size='"+SearchMap.get("Size")+"'";
							}
							
						}
						if(SearchMap.get("Experience")!=null) {
							sql+=" and boa_experi='"+SearchMap.get("Experience")+"'";
						}
						if(SearchMap.get("Region")!=null) {
							sql+=" and boa_region='"+SearchMap.get("Region")+"'";
						}
						System.out.println(sql);
						 
						if(sort==0) {
							sql=sql+" having d_day>0 or d_day=0 order by boa_no desc";
						}else if(sort==1) {
							sql=sql+" having d_day>0 or d_day=0 order by boa_hit desc,boa_no desc";
						}else if(sort==2) {
							sql=sql+" having d_day>0 or d_day=0 order by d_day asc";
						} 
						System.out.println(sql);
						pstmt = connection.prepareStatement(sql);
						rs=pstmt.executeQuery();
						
						while(rs.next()) {
							ProBoardDto ProBoardDto = new ProBoardDto();
							ProBoardDto.setMem_no(rs.getInt("mem_no"));
							ProBoardDto.setBoa_no(rs.getInt("boa_no"));
							ProBoardDto.setBoa_title(rs.getString("boa_title"));
							ProBoardDto.setBoa_job(rs.getString("boa_job"));
							ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
							ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
							ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
							ProBoardDto.setBoa_num(rs.getInt("boa_num"));
							ProBoardDto.setBoa_pro_period(rs.getString("boa_pro_period"));
							list.add(ProBoardDto);
						}
						if(list.size()!=0) {
						sql="select mem_nickname,mem_icon,mem_job from member where mem_no=?";
						for(int i=0; i<list.size(); i++) {
						pstmt = connection.prepareStatement(sql);
						pstmt.setInt(1,list.get(i).getMem_no());
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							list.get(i).setMem_nickname(rs.getString("mem_nickname"));
							list.get(i).setMem_icon(rs.getString("mem_icon"));
							list.get(i).setMem_job(rs.getString("mem_job"));
						}
						}
						
						sql="select count(*) from application where boa_no=?";
						for(int i=0; i<list.size(); i++) {
							pstmt = connection.prepareStatement(sql);
							pstmt.setInt(1,list.get(i).getBoa_no());
							rs=pstmt.executeQuery();
							
							if(rs.next()) {
								list.get(i).setApp_number(rs.getInt(1));
							}
						}
						sql="select tag_contents from hashtag where boa_no=? limit 9";
						for(int i=0; i<list.size(); i++) {
							pstmt = connection.prepareStatement(sql);
							pstmt.setInt(1,list.get(i).getBoa_no());
							rs=pstmt.executeQuery();
							while(rs.next()) {
								list.get(i).boa_hashtag.add(rs.getString("tag_contents"));
							}
						} 
						}else {
							return list;
						}
						
					}else if(GenreArray.size()==0) {
						return list;
					}	
				} catch (Exception e) {
					System.out.println("getSearchProBoradList2 오류: " + e);		
				}finally {
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					if(connection!=null) try {connection.close();} catch(Exception ex) {}
				}
			}
		return list;
	}
	
	public ArrayList<String> getTagList(int state,ArrayList<ProBoardDto> list){
		ArrayList<String> TagList = new ArrayList<String>(); 
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		if(state==0) {
			// limit 5 해서 많이 쓰인 태그 5개만 리스트에 담으려고 함
			sql+="select tag_contents from hashtag group by tag_contents order by count(*) desc,tag_contents asc limit 5";
		}else if(state==1) {
			sql+="select tag_contents from hashtag where (boa_no="+list.get(0).getBoa_no();
			for(int i=1; i<list.size();i++) {
				sql+=" or boa_no="+list.get(i).getBoa_no();
			}
			
			sql+=") group by tag_contents order by count(*) desc,tag_contents asc limit 5";
		}
		System.out.println("tag sql은 "+sql);
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TagList.add(rs.getString("tag_contents"));
			}
			
		} catch (Exception e) {
			System.out.println("getTagList 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		return TagList;
	} 
	public ArrayList<ProBoardDto> getTagSearchList(int sort,String TagSearch){
		ArrayList<ProBoardDto> list = new ArrayList<ProBoardDto>();
		ArrayList<String> boa_no = new ArrayList<String>(); 
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select boa_no from hashtag where tag_contents='"+TagSearch+"'";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				boa_no.add(rs.getString("boa_no"));
			}
		} catch (Exception e) {
			System.out.println("getTagSearchList 오류1: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		
		  
		try {
			connection = ds.getConnection();
			if(boa_no.size()!=0) {
				sql="select *,TO_DAYS(boa_rec_deadline)-TO_DAYS(now())as d_day from pro_board ";
				sql=sql+"where (boa_no="+boa_no.get(0);
				for(int i=1;i<boa_no.size();i++) {
					sql=sql+" or boa_no="+boa_no.get(i);
				}
				sql=sql+")";
				if(sort==0) {
					sql=sql+" order by boa_no desc";
				}else if(sort==1) {
					sql=sql+" order by boa_hit desc,boa_no desc";
				}else if(sort==2) {
					sql=sql+" having d_day>0 or d_day=0 order by d_day asc";
				} 
				pstmt = connection.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ProBoardDto ProBoardDto = new ProBoardDto();
					ProBoardDto.setMem_no(rs.getInt("mem_no"));
					ProBoardDto.setBoa_no(rs.getInt("boa_no"));
					ProBoardDto.setBoa_title(rs.getString("boa_title"));
					ProBoardDto.setBoa_job(rs.getString("boa_job"));
					ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
					ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
					ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
					ProBoardDto.setBoa_num(rs.getInt("boa_num"));
					ProBoardDto.setBoa_pro_period(rs.getString("boa_pro_period"));
					list.add(ProBoardDto);
				}
				if(list.size()!=0) {
					sql="select mem_nickname,mem_icon,mem_job from member where mem_no=?";
					for(int i=0; i<list.size(); i++) {
						pstmt = connection.prepareStatement(sql);
						pstmt.setInt(1,list.get(i).getMem_no());
						rs=pstmt.executeQuery();
				
						if(rs.next()) {
							list.get(i).setMem_nickname(rs.getString("mem_nickname"));
							list.get(i).setMem_icon(rs.getString("mem_icon"));
							list.get(i).setMem_job(rs.getString("mem_job"));
						}
					}
				
					sql="select count(*) from application where boa_no=?";
					for(int i=0; i<list.size(); i++) {
						pstmt = connection.prepareStatement(sql);
						pstmt.setInt(1,list.get(i).getBoa_no());
						rs=pstmt.executeQuery();
					
						if(rs.next()) {
							list.get(i).setApp_number(rs.getInt(1));
						}
					}
					sql="select tag_contents from hashtag where boa_no=? limit 9";
					for(int i=0; i<list.size(); i++) {
						pstmt = connection.prepareStatement(sql);
						pstmt.setInt(1,list.get(i).getBoa_no());
						rs=pstmt.executeQuery();
						while(rs.next()) {
							list.get(i).boa_hashtag.add(rs.getString("tag_contents"));
						}
					} 
				}
			}
			
		} catch (Exception e) {
			System.out.println("getTagSearchList 오류2: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return list;
	}
	
public int BoardInsert(ProBoardDto ProBoardDto) {
		int result=0;
		int x=0;
		Map<String,Object> Map = new HashMap<String,Object>();
		ArrayList<String> list = new ArrayList<String>();
		String sql ="insert into pro_board (boa_title,boa_experi,boa_job,boa_num,boa_rec_deadline,boa_size,boa_pro_period,boa_region,mem_no,boa_reg_date";
		if(ProBoardDto.getBoa_format()!=null||ProBoardDto.getBoa_format().equals(null)==false) {
			sql+=",boa_format";
			++x;
			list.add("boa_format");
		}
		if(ProBoardDto.getBoa_con_method()!=null||ProBoardDto.getBoa_con_method().equals(null)==false) {
			sql+=",boa_con_method";
			++x;
			list.add("boa_con_method");
		}
		if(ProBoardDto.getBoa_progress()!=0) {
			sql+=",boa_progress";
			++x;
			list.add("boa_progress");
		}
		if(ProBoardDto.getBoa_con_address()!=null||ProBoardDto.getBoa_con_address().equals(null)==false) {
			sql+=",boa_con_address";
			++x;
			list.add("boa_con_address");
		}
		if(ProBoardDto.getBoa_contents()!=null||ProBoardDto.getBoa_contents().equals(null)==false) {
			sql+=",boa_contents";
			list.add("boa_contents");
			++x;
		}
		if(ProBoardDto.getBoa_teamname()!=null||ProBoardDto.getBoa_teamname().equals(null)==false) {
			sql+=",boa_teamname";
			list.add("boa_teamname");
			++x;
		}
		
		sql+=")  values (?,?,?,?,?,?,?,?,?,now()";
		for(int i = 0; i < x; i++) {
			sql+=",?";
		}
		sql+=")";
		int boa_no=0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			System.out.println("insert sql은 :" +sql);
			Date dead = new Date(ProBoardDto.getBoa_rec_deadline().getTime());
			System.out.println("insert dead:" +dead);
			pstmt.setString(1,ProBoardDto.getBoa_title());
			pstmt.setString(2,ProBoardDto.getBoa_experi());
			pstmt.setString(3,ProBoardDto.getBoa_job());
			pstmt.setInt(4,ProBoardDto.getBoa_num());
			pstmt.setDate(5,dead);
			pstmt.setString(6,ProBoardDto.getBoa_size());
			pstmt.setString(7,ProBoardDto.getBoa_pro_period());
			pstmt.setString(8,ProBoardDto.getBoa_region());
			pstmt.setInt(9,ProBoardDto.getMem_no());
			for(int i = 0; i < list.size(); i++) {
				switch(list.get(i)) {
					case "boa_format":
						pstmt.setString(i+10,ProBoardDto.getBoa_format());
						break;
					case "boa_con_method":
						pstmt.setString(i+10,ProBoardDto.getBoa_con_method());
						break;
					case "boa_progress":
						pstmt.setInt(i+10,ProBoardDto.getBoa_progress());
						break;
					case "boa_con_address":
						pstmt.setString(i+10,ProBoardDto.getBoa_con_address());
						break;
					case "boa_contents":
						pstmt.setString(i+10,ProBoardDto.getBoa_contents());
						break;
					case "boa_teamname":
						pstmt.setString(i+10,ProBoardDto.getBoa_teamname());
						break;
				}
				
			}
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardInsert 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		try {
			sql="select boa_no from pro_board where mem_no=? order by boa_no desc";
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			System.out.println("mem_no은"+ProBoardDto.getMem_no());
			
			pstmt.setInt(1,ProBoardDto.getMem_no());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				boa_no=rs.getInt("boa_no");
			}
			System.out.println("boa_no은"+ boa_no);
			
			sql="insert into genre (genre_contents,boa_no) values(?,?)";
			String[] genre = ProBoardDto.getGenre_contents();
			
			for(int i=0; i<genre.length; i++) {
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1,genre[i]);
				pstmt.setInt(2,boa_no);
				pstmt.executeUpdate();
			}
			
			
			if(ProBoardDto.getBoa_hashtag()!=null) {
				sql="insert into hashtag (tag_contents,boa_no) values(?,?)";
				ArrayList<String> tag = ProBoardDto.getBoa_hashtag();
				for(int i=0; i<tag.size(); i++) {
					pstmt = connection.prepareStatement(sql);
					pstmt.setString(1,tag.get(i));
					pstmt.setInt(2,boa_no);
					pstmt.executeUpdate();
				}
			}
			
			
			if(ProBoardDto.getFile_name()!=null) {
				sql="insert into boa_file (file_name,boa_no) values(?,?)";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1,ProBoardDto.getFile_name());
				pstmt.setInt(2,boa_no);
				pstmt.executeUpdate();	
			}
			
			
			return 1;
		}catch (Exception e) {
			System.out.println("BoardInsert boa_no불러오기 오류 및 태그장르파일업로드오류:" + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		return 0;
	}
	
	public ProBoardDto getDetail (int no){
		ProBoardDto ProBoardDto = new ProBoardDto();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select *,TO_DAYS(boa_rec_deadline)-TO_DAYS(now())as d_day from pro_board where boa_no=?";
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ProBoardDto.setMem_no(rs.getInt("mem_no"));
				ProBoardDto.setBoa_no(rs.getInt("boa_no"));
				ProBoardDto.setBoa_title(rs.getString("boa_title"));
				ProBoardDto.setBoa_teamname(rs.getString("boa_teamname"));
				ProBoardDto.setBoa_format(rs.getString("boa_format"));
				ProBoardDto.setBoa_experi(rs.getString("boa_experi"));
				ProBoardDto.setBoa_con_method(rs.getString("boa_con_method"));
				ProBoardDto.setBoa_job(rs.getString("boa_job"));
				ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
				ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
				ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
				ProBoardDto.setBoa_num(rs.getInt("boa_num"));
				ProBoardDto.setBoa_pro_period(rs.getString("boa_pro_period"));
				ProBoardDto.setBoa_region(rs.getString("boa_region"));
				ProBoardDto.setBoa_progress(rs.getInt("boa_progress"));
				ProBoardDto.setBoa_con_address(rs.getString("boa_con_address"));
				ProBoardDto.setBoa_size(rs.getString("boa_size"));
				ProBoardDto.setBoa_contents(rs.getString("boa_contents")); 
				ProBoardDto.setBoa_hit(rs.getInt("boa_hit"));
			}
			
		} catch (Exception e) {
			System.out.println("getDetail pro_board테이블 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		try {
			sql="select mem_nickname,mem_icon,mem_job,mem_email from member where mem_no=?";
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,ProBoardDto.getMem_no());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ProBoardDto.setMem_nickname(rs.getString("mem_nickname"));
				ProBoardDto.setMem_icon(rs.getString("mem_icon"));
				ProBoardDto.setMem_job(rs.getString("mem_job"));
				ProBoardDto.setMem_email(rs.getString("mem_email"));
			}
		
		} catch (Exception e) {
			System.out.println("getDetail member테이블 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		try {
			sql="select count(*) from application where boa_no=?";
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ProBoardDto.setApp_number(rs.getInt(1));
			}
		
		} catch (Exception e) {
			System.out.println("getDetail application테이블 count 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		try {
			sql="select tag_contents from hashtag where boa_no=? limit 9";
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProBoardDto.boa_hashtag.add(rs.getString("tag_contents"));
			}
			
		} catch (Exception e) {
			System.out.println("getDetail hashtag테이블 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		try {
			sql="select genre_contents from genre where boa_no=?";
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			rs.last();
			int row = rs.getRow();
			rs.beforeFirst();
			System.out.println("열개수"+row);
			String[] genre = new String[row];   
			for(int i=0; rs.next(); i++) {
				genre[i] = rs.getString("genre_contents");	 
				System.out.println(genre[i]);
				
			}
			ProBoardDto.setGenre_contents(genre);
			
		} catch (Exception e) {
			System.out.println("getDetail genre테이블 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		}
		
		try {
			sql="select file_name from boa_file where boa_no=?";
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ProBoardDto.setFile_name(rs.getString("file_name"));
			}
			
		} catch (Exception e) {
			System.out.println("getDetail boa_file테이블 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 

		return ProBoardDto;
	}
	
	public int AddHit(int no){
		int result = -1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="update pro_board set boa_hit=boa_hit+1 where boa_no=?";
		
		try {
			connection = ds.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,no);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("AddHit 오류: " + e);		
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(connection!=null) try {connection.close();} catch(Exception ex) {}
		} 
		
		return result;
	}
	
	

}
