package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.ApplicationDao;
import com.board.model.ApplicationDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AppUpdateController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ControllerForward forward = new ControllerForward();
		int result =-1;
		int boa_app_no = Integer.parseInt(request.getParameter("app_no"));
		System.out.println("넘버는"+boa_app_no);
		int boa_no=Integer.parseInt(request.getParameter("boa_no"));
		ApplicationDao ApplicationDao = new ApplicationDao();
		ApplicationDto ApplicationDto = new ApplicationDto(); 
		
		ApplicationDto.setBoa_app_no(boa_app_no);
		
		String uploadPath =request.getSession().getServletContext().getRealPath("fileupload");
		int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
		
		String fileName = ""; // 파일명
		
		try{
			MultipartRequest multi = multi=new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			
			
			if(multi.getParameter("notecontents")!=null) {
				// 글내용
				String boa_app_contents = multi.getParameter("notecontents");
				ApplicationDto.setBoa_app_contents(boa_app_contents);
				System.out.println("글제목:"+boa_app_contents);  
			}
			if(multi.getParameter("file_modify")!=null) {
				// 파일이름
				String app_file = multi.getParameter("file_modify");
				ApplicationDto.setApp_file(app_file);
				System.out.println("글제목:"+app_file);  
			}
			System.out.println("파일은"+ApplicationDto.getApp_file());
			result = ApplicationDao.ApplicationUpdate(ApplicationDto);
			          
		}catch(Exception e){       
			e.printStackTrace();   
		} 
		forward.setRedirect(true); 
		forward.setPath("./ProDetail.bo?no="+boa_no);
		return forward;
	}

}
