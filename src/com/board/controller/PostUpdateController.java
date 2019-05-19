package com.board.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;
import com.member.model.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostUpdateController implements Controller{

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		int boa_no = Integer.parseInt(request.getParameter("boa_no"));
		ProBoardDto ProBoardDto = new ProBoardDto();
		ProBoardDao ProBoardDao = new ProBoardDao();
		int result =-1;
		System.out.println(boa_no);
		
		MemberDto MemberDto=null;
		HttpSession session=request.getSession();
		if((MemberDto)session.getAttribute("Member")==null) {
			//request.setAttribute("error", 0);
			forward.setRedirect(true);
	   		forward.setPath("./LoginForm.do");
			return forward;
		}else {   
			MemberDto=(MemberDto)session.getAttribute("Member");
			ProBoardDto.setMem_no(MemberDto.getMem_no());
		}
		
		ProBoardDto.setBoa_no(boa_no);
		String uploadPath =request.getSession().getServletContext().getRealPath("fileupload");
		int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
		
		String fileName = ""; // 파일명 
		
		try{
			MultipartRequest multi = multi=new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			if(multi.getParameter("reg_title")!=null) {
				// 타이틀
				String reg_title = multi.getParameter("reg_title");
				ProBoardDto.setBoa_title(reg_title);
				System.out.println("글제목:"+reg_title);
			}
			if(multi.getParameter("reg_team_name")!=null) {
				// 팀/ 프로젝트 이름	
				String reg_team_name = multi.getParameter("reg_team_name");
				ProBoardDto.setBoa_teamname(reg_team_name);
				System.out.println("팀이름:"+reg_team_name);
			}
			if(multi.getParameter("reg_member")!=null) {
				// 희망 구성
				String reg_member = multi.getParameter("reg_member");
				ProBoardDto.setBoa_format(reg_member);
				System.out.println("희망구성:"+reg_member);
			}
			if(multi.getParameter("reg_similar_exp")!=null) {
				// 유사경험
				String reg_similar_exp = multi.getParameter("reg_similar_exp");
				ProBoardDto.setBoa_experi(reg_similar_exp);
				System.out.println("유사경험:"+reg_similar_exp);
			}
			if(multi.getParameter("reg_contact")!=null) {
				//  연락방법
				String reg_contact = multi.getParameter("reg_contact");
				ProBoardDto.setBoa_con_method(reg_contact);
				System.out.println("연락방법:"+reg_contact);
			}
			if(multi.getParameter("reg_field")!=null) {
				// 모집분야
				String reg_field = multi.getParameter("reg_field");
				ProBoardDto.setBoa_job(reg_field);
				System.out.println("모집분야 : "+reg_field);
			}
			if(multi.getParameter("team_number")!=null) {
				// 모집인원 
				int team_number = Integer.parseInt(multi.getParameter("team_number"));
				ProBoardDto.setBoa_num(team_number);
				System.out.println("모집인원:"+team_number);
			}
			if(multi.getParameter("contact_number")!=null) {
				// 연락처
				String contact_number = multi.getParameter("contact_number");
				ProBoardDto.setBoa_con_address(contact_number);
				System.out.println("연락처:"+contact_number);
			}
			if(multi.getParameter("reg_range")!=null) {
				// 진행사항
				int reg_range = Integer.parseInt(multi.getParameter("reg_range"));
				ProBoardDto.setBoa_progress(reg_range);
				System.out.println("진행사항:"+reg_range);
			}

			if(multi.getParameter("reg_pro_size")!=null) {
				// 프로젝트 크기
				String reg_pro_size = multi.getParameter("reg_pro_size");
				ProBoardDto.setBoa_size(reg_pro_size);
				System.out.println("프로젝트 크기:"+reg_pro_size);
			}
			if(multi.getParameter("Region")!=null) {
				// 지역
				String reg_city= multi.getParameter("reg_city");
				String Region = multi.getParameter("Region");
				if(Region.contains("전체")) {
					ProBoardDto.setBoa_region(Region);
					System.out.println("지역:"+Region);
				}else {
					String boa_region = reg_city+Region;
					ProBoardDto.setBoa_region(boa_region);
					System.out.println("지역:"+boa_region);
				}
			}
			if(multi.getParameter("reg_period")!=null) {
				//  기간
				String reg_period = multi.getParameter("reg_period");
				ProBoardDto.setBoa_pro_period(reg_period);
				System.out.println("기간:"+reg_period);
			}
			if(multi.getParameter("reg_genre")!=null) {
				//  장르
				String[] Genre =multi.getParameterValues("reg_genre");
				ProBoardDto.setGenre_contents(Genre);
				for(int i=0;i<Genre.length;i++) {
					System.out.println(Genre[i]);
					}
			}
			if(multi.getParameter("reg_deadline")!=null) {
				// 마감일
				String reg_deadline = multi.getParameter("reg_deadline");
				DateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date boa_rec_deadline = transFormat.parse(reg_deadline);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(boa_rec_deadline);      
				cal.add(Calendar.DATE, 1);		//날짜 더하기
				ProBoardDto.setBoa_rec_deadline(cal.getTime());
				//java.sql.Date sqlDate = new java.sql.Date(cal.getTime().getTime());
				
				
				System.out.println(reg_deadline);
				System.out.println(boa_rec_deadline);
				System.out.println(transFormat.format(cal.getTime()));
			}
			if(multi.getParameter("reg_tag")!=null) {
				if(multi.getParameter("reg_tag").equals("")==false) {
					//태그
					String reg_tag = multi.getParameter("reg_tag");
					ArrayList<String> boa_hashtag = new ArrayList<String>();
					String[] tag=reg_tag.split(" ");
					for(int i=0;i<tag.length;i++) {
						System.out.println(tag[i]);
						boa_hashtag.add(tag[i]);
						}
					ProBoardDto.setBoa_hashtag(boa_hashtag);
				}
			}
			if(multi.getParameter("notecontents")!=null) {
				//글내용
				String notecontents = multi.getParameter("notecontents");
				System.out.println("글내용:"+notecontents);
				ProBoardDto.setBoa_contents(notecontents);
			}
			if(multi.getFilesystemName("file_selector")!=null) {
				fileName = multi.getFilesystemName("file_selector");
				System.out.println("파일이름 :"+fileName);
				ProBoardDto.setFile_name(fileName);
			}
			
			result = ProBoardDao.BoardUpdate(ProBoardDto);
		}catch(Exception e){     
			e.printStackTrace();
		} 
		forward.setRedirect(true); 
		forward.setPath("./ProDetail.bo?no="+boa_no);
		return forward;
	}      
      
}
   