package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class MemberFrontController
 */
//@SuppressWarnings("serial")
@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
		
	 @Override
	  protected void service(
	      HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/");
		String command = requestURI.substring(cmdIdx);
		
		System.out.println("11111");
		System.out.println(requestURI);
		System.out.println(command);
		
		ControllerForward forward = null;
		Controller controller = null;
	    
	    try {
	    	//ServletContext sc = this.getServletContext();
	    	//Controller pageController = (Controller) sc.getAttribute(command);
	    	
	    	if(command.equals("/LoginForm.do")) {
	    		 forward=new ControllerForward();
				 forward.setRedirect(false);
				 forward.setPath("./member/LoginForm.jsp");
	    	}
	    	
	    	else if (command.equals("/MemberLogin.do")) {
	    		controller = new MemberLoginController();
	    		forward=controller.execute(request, response);			
	    	}
	    	
	    	 if(forward.isRedirect()){
				   response.sendRedirect(forward.getPath());
			   }else{
				   RequestDispatcher dispatcher=
					   request.getRequestDispatcher(forward.getPath());
				   dispatcher.forward(request, response);
			   }
	    	
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
	    }
}
