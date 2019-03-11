package com.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.member.model.*;

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
		MemberDto.setMem_password(request.getParameter("mem_password"));
		System.out.println("221");
		System.out.println(request.getParameter("mem_id"));
		System.out.println(request.getParameter("mem_password"));
		result = MemberDao.isMember(MemberDto);
		
		if(result==0) {
			//response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('알수없는 오휴');");
	   		out.println("location.href='./MemberLogin.do';");
	   		out.println("</script>");
	   		out.close();
	   		return forward;
		}
		else if(result==-1) {
			response.setContentType("text/html;charset=euc-kr");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('비밀번호 틀림');");
	   		out.println("location.href='./MemberLogin.do';");
	   		out.println("</script>");
	   		out.close();
	   		return forward;
		}
		int no = MemberDao.getMemberNo(MemberDto);
		session.setAttribute("id", MemberDto.getMem_id());
		session.setAttribute("MemberNo",no);
		forward.setRedirect(true);
   		forward.setPath("./member/main.jsp");
		return forward;
	}

	
}
