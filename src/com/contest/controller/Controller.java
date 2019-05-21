package com.contest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contest.controller.ControllerForward;

public interface Controller {
	public ControllerForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
