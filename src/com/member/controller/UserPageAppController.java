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

public class UserPageAppController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		MemberDao MemberDao =new MemberDao();
		MemberDto MemberDto = new MemberDto();
		MemberDto UserInfo = new MemberDto();
		ProBoardDao ProBoardDao = new ProBoardDao();
		ApplicationDao ApplicationDao= new ApplicationDao();
		ArrayList<Integer> boa_no_List = new ArrayList<Integer>();
		ArrayList<Integer> sc_list = new ArrayList<Integer>(); 
		ArrayList<ProBoardDto> app_parent_list = new ArrayList<ProBoardDto>(); 
		
		if(session.getAttribute("Member")!=null) {
			MemberDto =(MemberDto)session.getAttribute("Member");
			sc_list=ProBoardDao.getScrapListSimple(MemberDto.getMem_no());
		}
		
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int pagenum = -1;
		int total=-1;
		int ParentNum=-1;
		if(request.getParameter("page")==null) {
			pagenum = 1;
		}else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		
		ParentNum = ApplicationDao.getApplicationParentNum(mem_no);
		total=ParentNum/5;
		if(ParentNum%5>0) {
			total+=1;
		}
		 
		
		UserInfo = MemberDao.getUserInfo(mem_no);
		boa_no_List = ApplicationDao.getApplicationParent(mem_no,pagenum);
		app_parent_list = ProBoardDao.getApplicationParent(boa_no_List); 
		
		request.setAttribute("pagenum",pagenum);
		request.setAttribute("total",total);
		request.setAttribute("sc_list",sc_list);
		request.setAttribute("useinfo",UserInfo);
		request.setAttribute("app_parent_list", app_parent_list);
		forward.setRedirect(false);                
		forward.setPath("./member/UserPageApp.jsp");
		return forward;
	}

}
