package com.sang.bok;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.service.VacationService;
import com.sang.bok.serviceImpl.UserStatusServiceImpl;

@Controller
public class LeaveApplicationController {
	
	@Autowired
	private UserStatusServiceImpl UserStatusService;
	
	@Autowired
	private VacationService vacationService;
	
	@RequestMapping(value="/leaveApplication.do", method=RequestMethod.GET)
	public ModelAndView leaveApplication(){
		ModelAndView mav = new ModelAndView();
		
		//사용자검색 팝업창 유저리스트
		mav.addObject("getUserList", UserStatusService.getUserList());
		
		mav.setViewName("applForm/leaveApplication");
		
		return mav;
	}
	
	//휴가신청서 작성완료
	@ResponseBody
	@RequestMapping(value="/vacationSendFm.do", method=RequestMethod.POST)
	public ModelAndView vacationSendFm(@RequestBody HashMap<String, Object> hashMap){
		ModelAndView mav = new ModelAndView();
		
		System.out.println("컨트롤러 도착");
		System.out.println("Controller : " + hashMap);
		
		vacationService.vacationInsert(hashMap);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
}
