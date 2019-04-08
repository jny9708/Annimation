package com.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.ControllerForward;
import com.board.model.ProBoardDao;
import com.board.model.ProBoardDto;
import com.member.model.MemberDao;

public class ProjectBoardController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ControllerForward forward = new ControllerForward();
		HttpSession session=request.getSession();
		//MemberDao MemberDao =new MemberDao();
		ProBoardDao ProBoardDao = new ProBoardDao(); 
		int sort = 0;
		if(request.getParameter("sort")!=null) {
		sort = Integer.parseInt(request.getParameter("sort"));
		}
		
		if(request.getParameter("Project_Search")!=null) {
			
		}
		Map<String,Object> SearchMap = new HashMap<String,Object>();
		
		
		if(request.getParameter("Project_Search")!=null) {
			if(request.getParameter("Project_Search").equals("")==false) {
			SearchMap.put("Project_Search", request.getParameter("Project_Search"));
			}
		}
		if(request.getParameter("Occupation")!=null) {
			if(request.getParameter("Occupation").equals("직군")==false) {
			SearchMap.put("Occupation", request.getParameter("Occupation"));
			}
		}
		if(request.getParameter("Category")!=null) {
			if(request.getParameter("Category").equals("분류")==false) {
			SearchMap.put("Category", request.getParameter("Category"));
			}
		} 
		if(request.getParameter("Genre")!=null) {
			String[] Genre =request.getParameterValues("Genre");
			SearchMap.put("Genre",Genre);
		}
		if(request.getParameter("Period")!=null) {
			SearchMap.put("Period", request.getParameter("Period"));
		}
		if(request.getParameter("Size")!=null) {
			SearchMap.put("Size", request.getParameter("Size"));
		}
		if(request.getParameter("Experience")!=null) {
			SearchMap.put("Experience", request.getParameter("Experience"));
		}
		System.out.println(request.getParameter("Experience"));
		request.setAttribute("SearchMap",SearchMap);
		ArrayList<ProBoardDto> list = new ArrayList<ProBoardDto>();
		if(SearchMap.size()==0||SearchMap.get("Genre")==null) {
			list = ProBoardDao.getProBoradList(sort, SearchMap);
		}else if(SearchMap.get("Genre")!=null) {
			list =ProBoardDao.getSearchProBoradList(sort, SearchMap);
		}
		
		request.setAttribute("projectlist", list);
		System.out.println(SearchMap.size());
		System.out.println("잘되고있는겨?");
		forward.setRedirect(false); 
		forward.setPath("./project/Project.jsp");
		return forward;
	} 

}
