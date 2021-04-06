package com.sang.bok;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.service.ApproverService;
import com.sang.bok.util.PageMaker;
import com.sang.bok.vo.Criteria;

@Controller
public class ApproverController {
	
	@Autowired
	private ApproverService approverService;
	
	//승인대기(상세)페이지 이동
	@RequestMapping(value = "/waitingApprover.do", method = RequestMethod.GET)
	public ModelAndView waitingReview(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println(idx);
		
		HashMap<String, Object> vo = approverService.getVacationView(idx);
		
		mav.addObject("approverVO", vo);
		mav.setViewName("/waitingapprover/waitingApprover");
		return mav;
	}
	
	//휴가신청승인 결재
	@RequestMapping(value="/approverOkFm.do", method=RequestMethod.POST)
	public ModelAndView approverOkFm(@RequestBody HashMap<String, Object> map){
		ModelAndView mav = new ModelAndView();
		
		//휴가테이블에 먼저 검토승인결재여부의 컬럼값을 'Y'로 변경
		String idx = (String) map.get("idx");
		approverService.approverWaitingUpdate(idx);
		
		//검토승인된 값 insert
	
		System.out.println(map.get("user_name"));
	
		approverService.approverOkInsert(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//휴가신청승인 반려
	@RequestMapping(value="/approverNoFm.do", method=RequestMethod.POST)
	public ModelAndView approverNoFm(@RequestBody HashMap<String, Object> map){
		ModelAndView mav = new ModelAndView();
		
		//휴가테이블에 먼저 승인결재여부의 컬럼값을 'D'로 변경
		String idx = (String) map.get("idx");
		approverService.approverWaitingNo(idx);
		
		approverService.approverNoInsert(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//승인대기 페이지 이동
	@RequestMapping(value = "/approverWaitinglist.do", method = RequestMethod.GET)
	public ModelAndView approverWaitinglist(Criteria cri){
		ModelAndView mav = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(approverService.countboardListTotal());
		
		List<Map<String, Object>> list = approverService.getBoardPaging(cri);
		
		mav.addObject("approverList", list);
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("/waitingapprover/approverWaitinglist");
		return mav;
	}
	
	//승인대기 페이지 이동
	@RequestMapping(value = "/approverStatus.do", method = RequestMethod.GET)
	public ModelAndView approverStatus(Criteria cri){
		ModelAndView mav = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(approverService.approverStatusListTotal());
		
		List<Map<String, Object>> list = approverService.getApproverStatusList(cri);
		
		mav.addObject("approverList", list);
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("/waitingapprover/approverStatus");
		return mav;
	}
}
