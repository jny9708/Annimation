package com.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.ApplicationDao;

public class AppDeleteController implements Controller{

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		ApplicationDao ApplicationDao = new ApplicationDao();
		int boa_no=0;
		boa_no= Integer.parseInt(request.getParameter("boa_no"));
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		String filename= request.getParameter("filename");
		int result =-1;
		String path=request.getSession().getServletContext().getRealPath("fileupload");
		
		result = ApplicationDao.ApplicationDelete(boa_no,mem_no); 
		
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
		forward.setPath("./ProDetail.bo?no="+boa_no);
		return forward;
	}

}
  