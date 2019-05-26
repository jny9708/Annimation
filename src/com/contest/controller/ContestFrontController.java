package com.contest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.contest.controller.Controller;
import com.contest.controller.ControllerForward;

/**
 * Servlet implementation class ContestFrontController
 */
@WebServlet("*.co")
public class ContestFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void service(
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=UTF-8");
	    String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/");
		String command = requestURI.substring(cmdIdx);
		System.out.println(requestURI);
		System.out.println(command);
		
		ControllerForward forward = null;
		Controller controller = null;
		HttpSession session=request.getSession();
		try {
			
			if(command.equals("/Contest.co")) {
				controller = new ContestController();
				forward = controller.execute(request, response);
			}else if(command.equals("/ConDetail.co")) {
				controller = new ContestDetailController();
				forward = controller.execute(request, response);
			}
			
			
			if(forward != null){
		    	 if(forward.isRedirect()){
					   response.sendRedirect(forward.getPath());
				   }else{
					   RequestDispatcher dispatcher=
						   request.getRequestDispatcher(forward.getPath());
					   dispatcher.forward(request, response);
				   }
		    	}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
  

}
