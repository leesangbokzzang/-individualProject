package com.sang.bok;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/waitingReview.do", method = RequestMethod.GET)
	public ModelAndView waitingReview(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println(idx);
		
		HashMap<String, Object> vo = reviewService.getVacationView(idx);
		
		mav.addObject("reviewVO", vo);
		mav.setViewName("/waitingreview/waitingReview");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/reviewOkFm.do", method=RequestMethod.POST)
	public ModelAndView reviewOkFm(@RequestBody HashMap<String, Object> map){
		ModelAndView mav = new ModelAndView();
		
		//휴가테이블에 먼저 검토승인결재여부의 컬럼값을 'Y'로 변경
		String idx = (String) map.get("idx");
		reviewService.reviewaitingUpdate(idx);
		
		//검토승인된 값 insert
	
		System.out.println(map.get("user_name"));
		//map.remove("user_position");
	
		reviewService.reviewOkInsert(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
}
