package com.contest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contest.model.ContestDao;
import com.contest.model.ContestDto;

public class ContestDetailController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		int con_no = Integer.parseInt(request.getParameter("con_no"));
		ContestDto Detail = new ContestDto();
		ContestDao ContestDao = new ContestDao();
		ContestDao.AddContestHit(con_no);
		Detail = ContestDao.getContestDetail(con_no);
		
		request.setAttribute("Detail", Detail);
		forward.setRedirect(false);                
		forward.setPath("./contest/ContestDetail.jsp");
		return forward;   
	}

}
