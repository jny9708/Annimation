package com.member.controller;

import javax.servlet.http.*;

import com.member.controller.ControllerForward;;

public interface Controller {
	public ControllerForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
}
