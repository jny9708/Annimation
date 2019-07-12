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
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/");
		String command = requestURI.substring(cmdIdx);
		System.out.println(requestURI);
		System.out.println(command);
		
		ControllerForward forward = null;
		Controller controller = null;
	    
	    try {
	    	//ServletContext sc = this.getServletContext();
	    	//Controller pageController = (Controller) sc.getAttribute(command);
	    	
	    	if(command.equals("/Main.do")) {
	    		controller = new MainPageController();
	    		forward=controller.execute(request, response);		
	    	}
	    	else if (command.equals("/MemberLogin.do")) {
	    		controller = new MemberLoginController();
	    		forward=controller.execute(request, response);			
	    	}
	    	else if(command.equals("/MemberJoin.do")) {
	    		controller = new MemberJoinController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/MemberLogout.do")) {
	    		controller = new MemberLogoutController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/UserPageApp.do")) {
	    		controller = new UserPageAppController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/UserPageWri.do")) {
	    		controller = new UserPageWriController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/UserPageScr.do")) {
	    		controller = new UserPageScrController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/UserUpdate.do")) {
	    		controller = new UserUpdateController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/MemberDelete.do")) {
	    		controller = new MemberDeleteController();
	    		forward=controller.execute(request, response);
	    	}
	    	else if(command.equals("/UserUpdateForm.do")) {
	    		forward=new ControllerForward();
				 forward.setRedirect(false);
				 forward.setPath("./member/UserUpdate.jsp");
	    	}
	    	else if(command.equals("/SignUpForm.do")) {
	    		forward=new ControllerForward();
				 forward.setRedirect(false);
				 forward.setPath("./member/SignUpForm.jsp");
	    	}
	    	else if(command.equals("/LoginForm.do")) {
	    		 forward=new ControllerForward();
				 forward.setRedirect(false);
				 forward.setPath("./member/LoginForm.jsp");
	    	}
	    	else if(command.equals("/Guide.do")) {
	    		forward=new ControllerForward();
				 forward.setRedirect(false);
				 forward.setPath("./member/Guide.jsp");
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
	    	
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
	    }
}
