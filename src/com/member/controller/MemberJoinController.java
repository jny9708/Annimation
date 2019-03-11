package com.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.member.model.*;


public class MemberJoinController implements Controller{

	MemberDao MemberDao;
	
	public MemberJoinController setMemberDao(MemberDao MemberDao)	{
		this.MemberDao = MemberDao;
		return this;	
	}
	
	
	@Override
	public ControllerForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
