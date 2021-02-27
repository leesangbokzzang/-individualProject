package com.sang.bok;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.serviceImpl.CommonCodeServiceImpl;
import com.sang.bok.serviceImpl.UserStatusServiceImpl;

@Controller
public class UserStatusController {
	
	@Autowired
	private CommonCodeServiceImpl CommonCodeService;
	
	@Autowired
	private UserStatusServiceImpl UserStatusService;
	
	@RequestMapping(value="/userStatus.do", method=RequestMethod.GET)
	public ModelAndView userStatus(){
		ModelAndView mav = new ModelAndView();
		
		//직위 셀렉트 박스
		mav.addObject("getPositionFG" , CommonCodeService.getPositionFG());
		
		//부서셀렉트 박스
		mav.addObject("getTeamFG" , CommonCodeService.getTeamFG());
		
		//사용자검색 팝업창 유저리스트
		mav.addObject("getUserList", UserStatusService.getUserList());
		
		mav.setViewName("system_mgm/userStatus");
		
		return mav;
	}
	
	//사용자 등록
	@ResponseBody
	@RequestMapping(value="userInsertfm.do", method=RequestMethod.POST)
	public ModelAndView userInsertfm(@RequestBody HashMap<String, Object> hashMap){
		
		ModelAndView map = new ModelAndView();
		
		map.addObject("result", UserStatusService.UserInsertFm(hashMap));
		map.setViewName("jsonView");
		
		return map;
	}
	
	//사용자현황정보
	@ResponseBody
	@RequestMapping(value="userSabunfm.do", method = RequestMethod.POST)
	public ModelAndView userSabunfm(@RequestBody HashMap<String,Object> hashMap){
		ModelAndView map = new ModelAndView();
		
		map.addObject("result", UserStatusService.UserSabunFm(hashMap));
		map.setViewName("jsonView");
		
		return map;
		
	}
	
	//사용자정보 수정
	@ResponseBody
	@RequestMapping(value="userUpdatefm.do", method = RequestMethod.POST)
	public ModelAndView userUpdatefm(@RequestBody HashMap<String, Object> hashMap){
		ModelAndView map = new ModelAndView();
		
		map.addObject("result", UserStatusService.UserUpdateFm(hashMap));
		map.setViewName("jsonView");
		return map;
	}
	
	//사용자 삭제
	@ResponseBody
	@RequestMapping(value="userDeletefm.do", method = RequestMethod.POST)
	public ModelAndView userDeletefm(@RequestBody HashMap<String, Object> hashMap){
		ModelAndView map = new ModelAndView();
		
		map.addObject("result", UserStatusService.UserDeleteFm(hashMap));
		map.setViewName("jsonView");
		
		return map;
	}
	
	//사용자 암호초기화
	@ResponseBody
	@RequestMapping(value="userPwdResetfm.do", method = RequestMethod.POST)
	public ModelAndView userPwdResetfm(@RequestBody HashMap<String, Object> hashMap){
		ModelAndView map = new ModelAndView();
		map.addObject("result", UserStatusService.UserPwdResetFm(hashMap));
		map.setViewName("jsonView");
		
		return map;
	}
	
	
	
	
	
	
}
