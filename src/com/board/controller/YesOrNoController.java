package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.ApplicationDao;

public class YesOrNoController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ControllerForward forward = new ControllerForward();
		ApplicationDao ApplicationDao = new ApplicationDao();
		
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		int boa_no= Integer.parseInt(request.getParameter("boa_no"));
		String state =request.getParameter("state");
		int result =-1;
		
		result = ApplicationDao.YesOrNo(mem_no,boa_no,state);
		
		
		forward.setRedirect(true); 
		forward.setPath("./ProDetail.bo?no="+boa_no);
		return forward;  
	} 

}
