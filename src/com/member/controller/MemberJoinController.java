package com.member.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.*;

import Util.SecurityUtil;


public class MemberJoinController implements Controller{

	MemberDao MemberDao;
	
	public MemberJoinController setMemberDao(MemberDao MemberDao)	{
		this.MemberDao = MemberDao;
		return this;	
	}
	
	
	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		MemberDto MemberDto = new MemberDto();
		boolean result=false;
		String mem_id = request.getParameter("mem_id");
		String mem_password = request.getParameter("mem_password");
		String mem_username = request.getParameter("mem_username");
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_bir_year = request.getParameter("mem_bir_year");
		String mem_bir_month = request.getParameter("mem_bir_month");
		String mem_bir_day = request.getParameter("mem_bir_day");
		String mem_job = request.getParameter("mem_job");
		String mem_email = request.getParameter("mem_email");
		String mem_phone = request.getParameter("mem_phone");
		
		if(mem_id==""||mem_password==""||mem_username==""||mem_bir_year==""|| mem_bir_month.equals("월")||mem_bir_day.equals("일")||
			mem_job==""||mem_email==""||mem_phone==""||mem_nickname==""	) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
	   		out.println("alert('내용을 모두 입력해주세요.');");
	   		out.println("location.href='./SignUpForm.do';");
	   		out.println("</script>");
	   		return null;
		}
		String birthday=request.getParameter("mem_bir_year")+request.getParameter("mem_bir_month")+request.getParameter("mem_bir_day");
		//SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd");
		//Date mem_birthday = transFormat.parse(birthday);
		//System.out.println("1 :"+mem_birthday);
		//System.out.println("2 :"+birthday);
		
		String salt = SecurityUtil.generateSalt();
		MemberDto.setSalt(salt);
		mem_password=SecurityUtil.getEncrypt(mem_password,salt);
		
		
		
		MemberDto.setMem_id(mem_id);
		MemberDto.setMem_password(mem_password);
		MemberDto.setMem_username(mem_username);
		MemberDto.setMem_nickname(mem_nickname);
		MemberDto.setMem_birthday(birthday);
		MemberDto.setMem_job(mem_job);
		MemberDto.setMem_email(mem_email);
		MemberDto.setMem_phone(mem_phone);
		System.out.println("바꼈?");
		
		result=MemberDao.idcheck(MemberDto);
		
		if(result==false) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='./SignUpForm.do';");
	   		out.println("alert('이미 존재하는 아이디입니다.');");
	   		out.println("</script>");
	   		return null;  
		}
		
		result=MemberDao.joinmember(MemberDto);
		
		System.out.println("회원가입결과:"+result);
		if(result==true) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
	   		out.println("location.href='./LoginForm.do';");
	   		out.println("alert('회원가입 성공');");
	   		out.println("</script>");
	   		return null;
		}
		else if(result==false) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
	   		out.println("location.href='./LoginForm.do';");
	   		out.println("alert('회원가입 실패');");
	   		out.println("</script>");
	   		return null;
		}
		
		
		forward.setRedirect(true);
   		forward.setPath("./LoginForm.do");
		return forward;
	}

}
