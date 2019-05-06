package com.board.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImageUploadController implements Controller {

	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		  // 이미지 업로드할 경로
		System.out.println("업로드 경로는 : " + request.getSession().getServletContext().getRealPath("image/imgupload"));
		
		String uploadPath =request.getSession().getServletContext().getRealPath("image/imgupload");  
		
	      
		int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
		
		String fileName = ""; // 파일명
		
		try{
	        // 파일업로드 및 업로드 후 파일명 가져옴
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			System.out.println(files);
			String file = (String)files.nextElement();
			System.out.println(file);
			fileName = multi.getFilesystemName(file);
			System.out.println(fileName);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		   
	    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
		uploadPath = "image/imgupload/" + fileName;
		System.out.println(uploadPath);
	    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
		JSONObject jobj = new JSONObject();
		jobj.put("url", uploadPath);
		
		response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
		response.getWriter().print(jobj);
		System.out.println(jobj.toJSONString());
	
		return null;   
	}  

}
