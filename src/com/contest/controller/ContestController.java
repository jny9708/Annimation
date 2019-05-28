package com.contest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.contest.controller.ControllerForward;
import com.contest.model.ContestDao;
import com.contest.model.ContestDto;

public class ContestController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		ContestDao ContestDao = new ContestDao();
		ArrayList<ContestDto> con_list = new ArrayList<ContestDto>();
		ArrayList<ContestDto> pop_list = new ArrayList<ContestDto>();
		int pagenum = -1;
		int total=-1;
		int ContestNum = -1;
		
		if(request.getParameter("page")==null) {
			pagenum = 1;
		}else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		
		ContestNum = ContestDao.getContestNum();
		total=ContestNum/10;
		if(ContestNum%10>0) {
			total+=1;
		}
		System.out.println("컨테스트개수"+ContestNum);
		con_list = ContestDao.getContestList(pagenum);
		pop_list = ContestDao.getPopList();
		
		request.setAttribute("con_list", con_list);
		request.setAttribute("pop_list", pop_list);
		request.setAttribute("pagenum",pagenum);
		request.setAttribute("total",total);
		
		forward.setRedirect(false);                
		forward.setPath("./contest/Contest.jsp");
		return forward;
	}

}
