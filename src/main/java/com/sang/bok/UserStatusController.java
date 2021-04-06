package com.sang.bok;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.security.UserSha256;
import com.sang.bok.serviceImpl.CommonCodeServiceImpl;
import com.sang.bok.serviceImpl.UserStatusServiceImpl;
import com.sang.bok.util.PageMaker;
import com.sang.bok.vo.Criteria;

@Controller
public class UserStatusController {
	
	@Autowired
	private CommonCodeServiceImpl CommonCodeService;
	
	@Autowired
	private UserStatusServiceImpl UserStatusService;
	
	@RequestMapping(value="/topage.do", method=RequestMethod.GET)
	public ModelAndView topage(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		int grade = (int) session.getAttribute("grade");
		if(grade == 1){
			mav.setViewName("redirect:/userStatus.do");
		}else if(grade == 0){
			mav.setViewName("redirect:/userStatusDef.do");
		}
		
		return mav;
	}
	
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
		
		String getPwd = (String) hashMap.get("password");
		System.out.println("controller : "+getPwd);
		
		String encryPassword = UserSha256.encrypt(getPwd);
		hashMap.put("password", encryPassword);
		
		System.out.println("비번 암호화 : "+ encryPassword);
		
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
		
		String changePwd = UserSha256.encrypt((String)hashMap.get("password"));
		hashMap.put("password", changePwd);
		
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
	
	@RequestMapping(value="/userStatusDef.do", method=RequestMethod.GET)
	public ModelAndView userStatusDef(Criteria cri){
		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(UserStatusService.userStatusListTotal());
		
		List<Map<String, Object>> userList = UserStatusService.getUserStatusList(cri);
		
		mav.addObject("userStatusList2", userList);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("system_mgm/userStatusDef");
		return mav;
	}
	
	@RequestMapping(value="/userStatusSearch.do", method=RequestMethod.POST)
	public ModelAndView userStatusSearch(HttpServletRequest request, Criteria cri){
		ModelAndView mav = new ModelAndView();
		
		String user_nm = request.getParameter("sear_nm");
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		
		System.out.println(user_nm);
		HashMap<String, Object> list = new HashMap<String, Object>();
		
		list.put("pageStart", pageStart);
		list.put("perPageNum", perPageNum);
		list.put("user_nm", user_nm);
		
		List<Map<String, Object>> userList = UserStatusService.getuserStatusList(list);
		

		mav.addObject("userStatusList", userList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
}
