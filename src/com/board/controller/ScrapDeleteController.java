package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ProBoardDao;
import com.member.model.MemberDto;

public class ScrapDeleteController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		int boa_no = Integer.parseInt(request.getParameter("boa_no"));
		ProBoardDao ProBoardDao = new ProBoardDao();
		MemberDto MemberDto=null;
		if(session.getAttribute("Member")!=null) {
			MemberDto=(MemberDto)session.getAttribute("Member");
			ProBoardDao.DeleteScrap(boa_no, MemberDto.getMem_no());
		}
		
		return null;
	}

}
