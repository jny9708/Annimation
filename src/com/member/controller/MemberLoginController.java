package com.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.member.model.*;

import Util.SecurityUtil;

public class MemberLoginController implements Controller {

	/**MemberDao MemberDao;
	
	public MemberLoginController setMemberDao(MemberDao MemberDao)	{
		this.MemberDao = MemberDao;
		return this;	
	}
	**/
	
	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		MemberDto MemberDto = new MemberDto();
		int result=-1;
		
		MemberDto.setMem_id(request.getParameter("mem_id"));
		String salt = MemberDao.getSaltById(MemberDto);
		String mem_password =request.getParameter("mem_password");
		mem_password=SecurityUtil.getEncrypt(mem_password, salt);
		MemberDto.setMem_password(mem_password);
		System.out.println(request.getParameter("mem_id"));
		System.out.println(request.getParameter("mem_password"));
		System.out.println(session.getAttribute("id")+"?!");
		result = MemberDao.isMember(MemberDto);
		
		if(result==0) {
			//response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
	   		out.println("alert('비밀번호 혹은 아이디가 틀렸습니다.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		return null; 
		}
		else if(result==-1) {
			//response.setContentType("text/html;charset=euc-kr");
			PrintWriter out=response.getWriter();
			out.println("<script>");
	   		out.println("alert('비밀번호 혹은 아이디가 틀렸습니다.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		return null;
	   		
		}
		MemberDto=MemberDao.getMember(request.getParameter("mem_id"));
		
		
		session.setAttribute("Member", MemberDto);
		
		
		forward.setRedirect(true);
   		forward.setPath("./Main.do");
		return forward;
	}

	
}
