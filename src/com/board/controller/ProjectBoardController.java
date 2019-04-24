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
		String TagSearch = null;
		ArrayList<ProBoardDto> list = new ArrayList<ProBoardDto>();
		ArrayList<String> TagList = new ArrayList<String>();
		Map<String,Object> SearchMap = new HashMap<String,Object>();
		if(request.getParameter("TagSearch")!=null) {
			if(request.getParameter("TagSearch").equals("")==false) {
			TagSearch = request.getParameter("TagSearch");
			}
		}  
		int sort = 0; 
		if(request.getParameter("sort")!=null) {
		sort = Integer.parseInt(request.getParameter("sort"));
		}
		if(request.getParameter("Project_Search")!=null) {
			if(request.getParameter("Project_Search").equals("")==false) {
			SearchMap.put("Project_Search", request.getParameter("Project_Search"));
			}
		} 
		if(request.getParameter("Occupation")!=null) {
			if(request.getParameter("Occupation").equals("모집분야")==false) {
			SearchMap.put("Occupation", request.getParameter("Occupation"));
			}
		} 
		if(request.getParameter("Category")!=null) {
			if(request.getParameter("Category").equals("분류")==false) {
			SearchMap.put("Category", request.getParameter("Category"));
			}
		} 
		if(request.getParameter("Region")!=null) {
			SearchMap.put("Region", request.getParameter("Region"));
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
		request.setAttribute("SearchMap",SearchMap);
		if(SearchMap.size()==0||SearchMap.get("Genre")==null) {
			list = ProBoardDao.getProBoradList(sort, SearchMap);
		}else if(SearchMap.get("Genre")!=null) {
			list =ProBoardDao.getSearchProBoradList(sort, SearchMap);
		}
		//태그 검식시        
		if(TagSearch!=null) {
			list=ProBoardDao.getTagSearchList(sort, TagSearch);
		}
		//System.out.println("태그 검색 이후 리스트는 "+list);
		//System.out.println("검색어가 있나요 : "+TagSearch);
		if(SearchMap.size()==0&&TagSearch==null) {	//검색내용이 없음
			if(list.size()!=0) { //가져오는 list가 없으면 tag가져오는 dao도 실행되지 않음
				int state=0; //전체글내용에 따른 인기 tag를 가져옴
				TagList = ProBoardDao.getTagList(state,list);
			} 
		}else if(SearchMap.size()!=0||TagSearch!=null) { //검색내용이 있음.
			if(list.size()!=0) {
				int state=1;	//검색 내용에 따른 게시글의 인기 tag를 가져옴
				TagList = ProBoardDao.getTagList(state,list);
			}   
		}    
		 
		
		request.setAttribute("projectlist", list);
		request.setAttribute("TagList", TagList);
		System.out.println(SearchMap.size());
		System.out.println("잘되고있는겨?");
		forward.setRedirect(false); 
		forward.setPath("./project/Project.jsp");
		return forward;
	} 

}
