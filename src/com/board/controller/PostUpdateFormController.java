package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;

public class PostUpdateFormController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		int boa_no = Integer.parseInt(request.getParameter("boa_no"));
		ProBoardDao ProBoardDao = new ProBoardDao();
		ProBoardDto ProBoardDto = new ProBoardDto();
		
		ProBoardDto = ProBoardDao.getDetail(boa_no);
		
	  
		request.setAttribute("OrgDto", ProBoardDto);
		
		forward.setRedirect(false);                
		forward.setPath("./project/ProjectAddForm.jsp");
		return forward;
	}
  
}
