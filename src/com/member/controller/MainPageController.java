package com.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.member.model.MemberDao;
import com.member.model.MemberDto;

public class MainPageController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		//AniBoardDao AniBoardDao = new AniBoardDao(); 
		
		/*
		if(session.getAttribute("id")!=null) {
			//session.getAttribute("MemberNo") 해가지고 회원 아이콘사진 path가져오기
		}
		*/
		// ArrayList<AniBoardDto> list = AniBoardDao.getMainBoardList();
		//request.setAttribute("anis", list );
		forward.setRedirect(false);
		forward.setPath("./member/main.jsp");
		return forward;
	} 

}  
