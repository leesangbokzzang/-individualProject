package com.sang.bok;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @RequestMapping(value="/interceptorTest")
	    public ModelAndView interceptorTest() throws Exception{
	         
	        ModelAndView mv = new ModelAndView("");
	        log.debug("인터셉터 테스트입니다!");
	         
	        return mv;
	    }
	    
	 }

