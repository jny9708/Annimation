package com.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDao;
import com.member.model.MemberDto;

public class MemberDeleteController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao = new MemberDao();
		MemberDto MemberDto = new MemberDto();
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
		}
		
		int result =-1;
		request.getSession().invalidate();
		
		result = MemberDao.MemberDelete(MemberDto.getMem_no());
		
		
		
		forward.setRedirect(true); 
		forward.setPath("./Main.do");
		return forward;
	}

}
