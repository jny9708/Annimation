package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ProBoardDao;
import com.member.model.MemberDto;

public class ScrapInsertController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		MemberDto MemberDto=null;
		int boa_no = Integer.parseInt(request.getParameter("boa_no"));
		
		ProBoardDao ProBoardDao = new ProBoardDao();
		if(session.getAttribute("Member")!=null) {
			MemberDto=(MemberDto)session.getAttribute("Member");
			ProBoardDao.InsertScrap(boa_no, MemberDto.getMem_no());	
		}
		
		
		
		
		return null;
	}
	

}
