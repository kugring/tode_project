package com.ezen.backend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ezen.backend.VO.UserVO;
import org.springframework.web.servlet.HandlerInterceptor;


public class LoginSessionInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect(request.getContextPath() + "/user/login.do");
			return false;
		}else {
			return true;
		}
	}
	
}
