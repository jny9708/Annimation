package com.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ApplicationDao;
import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;
import com.member.model.MemberDao;
import com.member.model.MemberDto;

public class UserPageWriController implements Controller{

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		MemberDto MemberDto = new MemberDto();
		MemberDto UserInfo = new MemberDto();
		ProBoardDao ProBoardDao = new ProBoardDao();
		ArrayList<ProBoardDto> user_boa_list = new ArrayList<ProBoardDto>();
		
		ArrayList<Integer> sc_list = new ArrayList<Integer>();
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
			sc_list=ProBoardDao.getScrapListSimple(MemberDto.getMem_no());
		}
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int pagenum = -1;
		int total=-1;
		int BoardNum=-1;
		if(request.getParameter("page")==null) {
			pagenum = 1;
		}else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		
		BoardNum = ProBoardDao.getUserProBoardNum(mem_no);
		total=BoardNum/5;
		if(BoardNum%5>0) {
			total+=1;
		}
		System.out.println("게시글 총 몇개?"+BoardNum);
		System.out.println("페이지수는"+total);
		UserInfo = MemberDao.getUserInfo(mem_no);
		user_boa_list = ProBoardDao.getUserProBoardList(mem_no, pagenum);
		
		request.setAttribute("pagenum",pagenum);
		request.setAttribute("total",total);
		request.setAttribute("sc_list",sc_list);
		request.setAttribute("useinfo",UserInfo);
		request.setAttribute("user_boa_list",user_boa_list);
		
		forward.setRedirect(false);                
		forward.setPath("./member/UserPageWri.jsp");
		return forward;
	}

}
