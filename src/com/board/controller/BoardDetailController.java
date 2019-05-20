package com.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ApplicationDao;
import com.board.model.ApplicationDto;
import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;
import com.member.model.MemberDto;

public class BoardDetailController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDto MemberDto = new MemberDto();
		ApplicationDao ApplicationDao = new ApplicationDao();
		ProBoardDao ProBoardDao = new ProBoardDao();
		ProBoardDto ProBoardDto = new ProBoardDto();
		ArrayList<ApplicationDto> list = new ArrayList<ApplicationDto>();
		ArrayList<ProBoardDto> re_list= new ArrayList<ProBoardDto>(); 
		ArrayList<Integer> sc_list = new ArrayList<Integer>();
		int no=0;
		no = Integer.parseInt(request.getParameter("no"));
		
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
			sc_list=ProBoardDao.getScrapListSimple(MemberDto.getMem_no());
		}
		
		ProBoardDao.AddHit(no);
		
		ProBoardDto = ProBoardDao.getDetail(no);
		list = ApplicationDao.getApplicationList(no);
		
		String re_job=ProBoardDto.getBoa_job();
		
		re_list = ProBoardDao.getRe_List(re_job,no);
		
		request.setAttribute("re_list", re_list);
		request.setAttribute("ApplicationList", list);
		request.setAttribute("Detail",ProBoardDto);
		request.setAttribute("sc_list",sc_list);
		forward.setRedirect(false); 
		forward.setPath("./project/ProjectDetail.jsp");
		return forward;  
	}
       
}  
