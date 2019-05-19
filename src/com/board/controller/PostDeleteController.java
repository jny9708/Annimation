package com.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.ProBoardDao;

public class PostDeleteController implements Controller{

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		ProBoardDao ProBoardDao = new ProBoardDao();
		int boa_no= Integer.parseInt(request.getParameter("boa_no"));
		String filename= request.getParameter("filename");
		int result=-1;
		String path=request.getSession().getServletContext().getRealPath("fileupload");
		result = ProBoardDao.BoardDelete(boa_no);
		
		 File file = new File(path+"/"+filename);
         
	        if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공"); 
	            }else{
	                System.out.println("파일삭제 실패");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않습니다.");
	        }
	             
		forward.setRedirect(true);
		forward.setPath("./Project.bo");  
		return forward;
	}

}
   