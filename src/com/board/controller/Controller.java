package com.board.controller;

import javax.servlet.http.*;


import com.board.controller.ControllerForward;

public interface Controller {
	public ControllerForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
