package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
		
		if(SearchMap.get("Project_Search")!=null) {
			if(SearchMap.get("Occupation")==null&&SearchMap.get("Category")==null
					&&SearchMap.get("Period")==null&&SearchMap.get("Size")==null
					&&SearchMap.get("Experience")==null) {
				sql+="where boa_title like '%"+SearchMap.get("Project_Search")+"%'";
			}else {
				sql+=" and boa_title like '%"+SearchMap.get("Project_Search")+"%'";	
			}
		}
		if(SearchMap.get("Occupation")!=null) {
			if(SearchMap.get("Project_Search")==null&&SearchMap.get("Category")==null
					&&SearchMap.get("Period")==null&&SearchMap.get("Size")==null
					&&SearchMap.get("Experience")==null) {
				sql+="where boa_job='"+SearchMap.get("Occupation")+"'";
			}else {
				sql+=" and boa_job='"+SearchMap.get("Occupation")+"'";	
			}
		}
		if(SearchMap.get("Category")!=null) {
			if(SearchMap.get("Project_Search")==null&&SearchMap.get("Occupation")==null
					&&SearchMap.get("Period")==null&&SearchMap.get("Size")==null
					&&SearchMap.get("Experience")==null) {
				sql+="where boa_category='"+SearchMap.get("Category")+"'";
			}else {
				sql+=" and boa_category='"+SearchMap.get("Category")+"'";	
			}
		}
		if(SearchMap.get("Period")!=null) {
			if(SearchMap.get("Project_Search")==null&&SearchMap.get("Occupation")==null
					&&SearchMap.get("Category")==null&&SearchMap.get("Size")==null
					&&SearchMap.get("Experience")==null) {
				sql+="where boa_pro_period='"+SearchMap.get("Period")+"'";
			}else {
				sql+=" and boa_pro_period='"+SearchMap.get("Period")+"'";	
			}
		}
		if(SearchMap.get("Size")!=null) {
			if(SearchMap.get("Project_Search")==null&&SearchMap.get("Occupation")==null
					&&SearchMap.get("Category")==null&&SearchMap.get("Period")==null
					&&SearchMap.get("Experience")==null) {
				sql+="where boa_size='"+SearchMap.get("Size")+"'";
			}else {
				sql+=" and boa_size='"+SearchMap.get("Size")+"'";	
			}			
		}
		if(SearchMap.get("Experience")!=null) {
			if(SearchMap.get("Project_Search")==null&&SearchMap.get("Occupation")==null
					&&SearchMap.get("Category")==null&&SearchMap.get("Period")==null
					&&SearchMap.get("Size")==null) {
				sql+="where boa_experi='"+SearchMap.get("Experience")+"'";
			}else {
				sql+=" and boa_experi='"+SearchMap.get("Experience")+"'";	
			}
			
		}
		System.out.println(sql);
		
		if(sort==0) {
			sql=sql+"order by boa_no desc";
		}else if(sort==1) {
			sql=sql+"order by boa_hit desc,boa_no desc";
		}else if(sort==2) {
			sql=sql+"having d_day>0 or d_day=0 order by d_day asc";
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
				ProBoardDto.setBoa_category(rs.getString("boa_category"));
				ProBoardDto.setBoa_job(rs.getString("boa_job"));
				ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
				ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
				ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
				list.add(ProBoardDto);
			}
			sql="select mem_nickname,mem_icon from member where mem_no=?";
			for(int i=0; i<list.size(); i++) {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,list.get(i).getMem_no());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				list.get(i).setMem_nickname(rs.getString("mem_nickname"));
				list.get(i).setMem_icon(rs.getString("mem_icon"));
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
			sql="select tag_contents from hashtag where boa_no=? limit 4";
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
							sql+=" and boa_pro_period='"+SearchMap.get("Period")+"'";
						}
						if(SearchMap.get("Size")!=null) {
							sql+=" and boa_size='"+SearchMap.get("Size")+"'";
						}
						if(SearchMap.get("Experience")!=null) {
							sql+=" and boa_experi='"+SearchMap.get("Experience")+"'";
						}
						System.out.println(sql);
						 
						if(sort==0) {
							sql=sql+" order by boa_no desc";
						}else if(sort==1) {
							sql=sql+" order by boa_hit desc,boa_no desc";
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
							ProBoardDto.setBoa_category(rs.getString("boa_category"));
							ProBoardDto.setBoa_job(rs.getString("boa_job"));
							ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
							ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
							ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
							list.add(ProBoardDto);
						}
						if(list.size()!=0) {
						sql="select mem_nickname,mem_icon from member where mem_no=?";
						for(int i=0; i<list.size(); i++) {
						pstmt = connection.prepareStatement(sql);
						pstmt.setInt(1,list.get(i).getMem_no());
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							list.get(i).setMem_nickname(rs.getString("mem_nickname"));
							list.get(i).setMem_icon(rs.getString("mem_icon"));
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
						sql="select tag_contents from hashtag where boa_no=? limit 4";
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
					ProBoardDto.setBoa_category(rs.getString("boa_category"));
					ProBoardDto.setBoa_job(rs.getString("boa_job"));
					ProBoardDto.setBoa_rec_deadline(rs.getDate("boa_rec_deadline"));
					ProBoardDto.setBoa_reg_date(rs.getDate("boa_reg_date"));
					ProBoardDto.setBoa_d_day(rs.getInt("d_day"));
					list.add(ProBoardDto);
				}
				if(list.size()!=0) {
					sql="select mem_nickname,mem_icon from member where mem_no=?";
					for(int i=0; i<list.size(); i++) {
						pstmt = connection.prepareStatement(sql);
						pstmt.setInt(1,list.get(i).getMem_no());
						rs=pstmt.executeQuery();
				
						if(rs.next()) {
							list.get(i).setMem_nickname(rs.getString("mem_nickname"));
							list.get(i).setMem_icon(rs.getString("mem_icon"));
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
					sql="select tag_contents from hashtag where boa_no=? limit 4";
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

}
