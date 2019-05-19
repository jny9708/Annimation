package com.board.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDto;

//import com.board.controller.ControllerForward;



/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
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
			if(command.equals("/Project.bo")) {
				controller = new ProjectBoardController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/ImageUpload.bo")) {
				controller = new ImageUploadController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/PostInsert.bo")) {
				controller = new PostInsertController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/PostDelete.bo")) {
				controller = new PostDeleteController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/PostUpdateForm.bo")) {
				controller = new PostUpdateFormController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/PostUpdate.bo")) {
				controller = new PostUpdateController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/ProDetail.bo")) {
				controller = new BoardDetailController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/ProjectAddForm.bo")) {
				forward=new ControllerForward();
				if((MemberDto)session.getAttribute("Member")==null) {
					//int error=0;
					//request.setAttribute("error", error);
					forward.setRedirect(true);
			   		forward.setPath("./LoginForm.do");
				}else {
					forward.setRedirect(false);
					 forward.setPath("./project/ProjectAddForm.jsp");
				}
			}
			else if(command.equals("/FileDownload.bo")) {
				controller = new FileDownloadController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/AppInsert.bo")) {
				controller = new AppInsertController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/AppUpdate.bo")) {
				controller = new AppUpdateController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/AppDelete.bo")) {
				controller = new AppDeleteController();
				forward=controller.execute(request, response);
			}
			else if(command.equals("/YesOrNo.bo")) {
				controller = new YesOrNoController();
				forward=controller.execute(request, response);
			}else if(command.equals("/ScrapInsert.bo")) {
				controller = new ScrapInsertController();
				forward=controller.execute(request, response);
			}else if(command.equals("/ScrapDelete.bo")) {
				controller = new ScrapDeleteController();
				forward=controller.execute(request, response);
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
