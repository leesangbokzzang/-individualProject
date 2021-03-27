package com.sang.bok.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session == null){
			response.sendRedirect("/logincheck.do");
			return false;
		}
		
		String user_id = (String) session.getAttribute("sabun");
		
		if(user_id == null){
			response.sendRedirect("/logincheck.do");
			return false;
		}
		
		return true;
	}
	

}
