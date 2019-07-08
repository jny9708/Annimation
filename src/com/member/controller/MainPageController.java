package com.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;
import com.member.model.MemberDao;
import com.member.model.MemberDto;

public class MainPageController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDto MemberDto = new MemberDto();
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		ProBoardDao ProBoardDao = new ProBoardDao();
		ArrayList<ProBoardDto> newly_list = new ArrayList<ProBoardDto>();
		ArrayList<Integer> sc_list = new ArrayList<Integer>();
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
			sc_list=ProBoardDao.getScrapListSimple(MemberDto.getMem_no());
		}
		
		newly_list = ProBoardDao.getNew_list();
		
		request.setAttribute("newly_list", newly_list);
		request.setAttribute("sc_list",sc_list);
		forward.setRedirect(false);
		forward.setPath("./member/main.jsp");
		return forward;
	} 

}  
  