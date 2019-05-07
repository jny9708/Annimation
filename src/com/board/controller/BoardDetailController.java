package com.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;

public class BoardDetailController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		ProBoardDao ProBoardDao = new ProBoardDao();
		ProBoardDto ProBoardDto = new ProBoardDto();
		ArrayList<ProBoardDto> list = new ArrayList<ProBoardDto>();
		int no=0;
		
		no = Integer.parseInt(request.getParameter("no"));
		
		ProBoardDto = ProBoardDao.getDetail(no);
		
		request.setAttribute("Detail",ProBoardDto);
		forward.setRedirect(false); 
		forward.setPath("./project/ProjectDetail.jsp");
		return forward;
	}
       
}
