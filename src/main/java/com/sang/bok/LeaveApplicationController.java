package com.sang.bok;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LeaveApplicationController {
	
	@RequestMapping(value="/leaveApplication.do", method=RequestMethod.GET)
	public ModelAndView leaveApplication(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("applForm/leaveApplication");
		
		return mav;
	}
}
