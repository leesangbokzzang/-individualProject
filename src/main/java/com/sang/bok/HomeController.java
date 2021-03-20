package com.sang.bok;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
//	@RequestMapping(value = "main.do", method = RequestMethod.GET)
//	public ModelAndView mainMove(){
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("main/main");
//		return mav;
//		
//	}
	
	 @RequestMapping(value="webMode.do", method=RequestMethod.POST)
    public ModelAndView webMode(HttpServletRequest request, HttpServletResponse response){
    	ModelAndView mav  = null;
    	String webmode = request.getParameter("webmode");
    	
    	if(webmode != null){
    		Cookie cookie = new Cookie("mode_dark", java.net.URLEncoder.encode(webmode));
			cookie.setMaxAge(60*60*24*1);
			response.addCookie(cookie);
    	}else{
    		Cookie cookie = new Cookie("mode_dark", "");
			cookie.setMaxAge(60*60*24*0);
			response.addCookie(cookie);
    	}
    	
    	System.out.println("controller: "+webmode);
		return mav;
    	
    }
	
}
