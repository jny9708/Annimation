package com.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDao;
import com.member.model.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Util.SecurityUtil;


public class UserUpdateController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDto MemberDto = new MemberDto();
		MemberDao MemberDao = new MemberDao();
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
		}
		
		String uploadPath =request.getSession().getServletContext().getRealPath("usericon");
		int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
		int result=-1;
		String fileName = ""; // 파일명
		String no="";
		
		
		try {
			MultipartRequest multi = multi=new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			
			if(multi.getFilesystemName("usericon")!=null) {
				String usericon = multi.getFilesystemName("usericon");
				MemberDto.setMem_icon(usericon);
			}
			
			String usernickname = multi.getParameter("m_kname");
			String m_password = multi.getParameter("m_password");
			String m_year = multi.getParameter("m_year");
			String m_month = multi.getParameter("m_month");
			String m_day = multi.getParameter("m_day");
			String birthday=m_year+"-"+m_month+"-"+m_day;
			String m_job = multi.getParameter("m_job");    
			String m_email = multi.getParameter("m_email");
			String m_phone = multi.getParameter("m_phone");
			String m_introduction = multi.getParameter("m_introduction");
			
			String salt = MemberDao.getSaltById(MemberDto);
			m_password=SecurityUtil.getEncrypt(m_password,salt);
			
			
			MemberDto.setMem_nickname(usernickname);
			MemberDto.setMem_password(m_password);
			MemberDto.setMem_birthday(birthday);
			MemberDto.setMem_job(m_job);
			MemberDto.setMem_email(m_email);
			MemberDto.setMem_phone(m_phone);
			MemberDto.setMem_profile_content(m_introduction);
			
			result = MemberDao.isMember(MemberDto);
			if(result==-1) {
				PrintWriter out=response.getWriter();
				out.println("<script>");
		   		out.println("alert('비밀번호가 틀렸습니다.');");
		   		out.println("history.back();");
		   		out.println("</script>");
		   		return null;
			}
			
			result = MemberDao.MemberUpdate(MemberDto);
			if(result==0) {
				PrintWriter out=response.getWriter();
				out.println("<script>");
		   		out.println("alert('수정에러');");
		   		out.println("history.back();");
		   		out.println("</script>");
		   		return null;
			}  
			
			  
		}catch(Exception e){     
			e.printStackTrace();
		} 
		
		
		                
		request.setAttribute("Member", MemberDto);
		forward.setRedirect(true); 
		forward.setPath("./UserPageApp.do?mem_no="+MemberDto.getMem_no());
		return forward;
	}

}
