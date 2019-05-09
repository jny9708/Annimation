package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.ApplicationDao;
import com.board.model.ApplicationDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class AppInsertController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ControllerForward forward = new ControllerForward();
		ApplicationDto ApplicationDto = new ApplicationDto();
		ApplicationDao ApplicationDao = new ApplicationDao();
		
		String uploadPath =request.getSession().getServletContext().getRealPath("fileupload");
		int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
		int result=-1;
		String fileName = ""; // 파일명
		String no="";
		
		try {
			MultipartRequest multi = multi=new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			no = multi.getParameter("boa_no");
			ApplicationDto.setBoa_no(Integer.parseInt(no));
			ApplicationDto.setMem_no(Integer.parseInt(multi.getParameter("mem_no").trim()));
			if(multi.getParameter("notecontents")!=null) {
				//글내용
				String notecontents = multi.getParameter("notecontents");
				System.out.println("글내용:"+notecontents);
				ApplicationDto.setBoa_app_contents(notecontents);
			}
			if(multi.getFilesystemName("file_selector")!=null) {
				fileName = multi.getFilesystemName("file_selector");
				System.out.println("파일이름 :"+fileName);
				ApplicationDto.setApp_file(fileName);
			}  
			
			result=ApplicationDao.ApplicationInset(ApplicationDto);
			
			  
		}catch(Exception e){     
			e.printStackTrace();
		} 
		
		
		request.setAttribute("InsertResult", result);
		forward.setRedirect(true); 
		forward.setPath("./ProDetail.bo?no="+no);
		return forward;
  
	}

}
