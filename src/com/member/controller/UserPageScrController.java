package com.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;
import com.member.model.MemberDao;
import com.member.model.MemberDto;

public class UserPageScrController implements Controller{

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		MemberDto MemberDto = new MemberDto();
		MemberDto UserInfo = new MemberDto();
		ProBoardDao ProBoardDao = new ProBoardDao();
		ArrayList<ProBoardDto> sc_boa_list = new ArrayList<ProBoardDto>();
		ArrayList<Integer> sc_list = new ArrayList<Integer>();
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
			sc_list=ProBoardDao.getScrapListSimple(MemberDto.getMem_no());
		}
		
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int pagenum = -1;
		int total=-1;
		int ScrapNum =-1;
		if(request.getParameter("page")==null) {
			pagenum = 1;
		}else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		
		ScrapNum = sc_list.size();
		
		total=ScrapNum/5;
		if(ScrapNum%5>0) {
			total+=1;
		}

		UserInfo = MemberDao.getUserInfo(mem_no);
		sc_boa_list = ProBoardDao.getScrapList(mem_no, pagenum, sc_list);
		
		
		request.setAttribute("sc_boa_list",sc_boa_list);
		request.setAttribute("useinfo",UserInfo);
		request.setAttribute("pagenum",pagenum);
		request.setAttribute("sc_list",sc_list);
		request.setAttribute("total",total);
		
		
		   
		
		  
		forward.setRedirect(false);                
		forward.setPath("./member/UserPageScr.jsp");
		return forward;
	}

}
