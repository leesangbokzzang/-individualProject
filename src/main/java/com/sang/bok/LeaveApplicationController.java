package com.sang.bok;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.serviceImpl.UserStatusServiceImpl;

@Controller
public class LeaveApplicationController {
	
	@Autowired
	private UserStatusServiceImpl UserStatusService;
	
	@RequestMapping(value="/leaveApplication.do", method=RequestMethod.GET)
	public ModelAndView leaveApplication(){
		ModelAndView mav = new ModelAndView();
		
		//사용자검색 팝업창 유저리스트
		mav.addObject("getUserList", UserStatusService.getUserList());
		
		mav.setViewName("applForm/leaveApplication");
		
		return mav;
	}
}
