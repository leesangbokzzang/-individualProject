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
import org.springframework.web.bind.annotation.RequestParam;
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
		
		//String changePwd = UserSha256.encrypt((String)hashMap.get("password"));
		//hashMap.put("password", changePwd);
		
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
		
		String changePwd = UserSha256.encrypt((String)hashMap.get("password"));
		hashMap.put("password", changePwd);
		
		map.addObject("result", UserStatusService.UserPwdResetFm(hashMap));
		map.setViewName("jsonView");
		
		return map;
	}
	
	@RequestMapping(value="/userStatusDef.do", method=RequestMethod.GET)
	public ModelAndView userStatusDef(Criteria cri){
		ModelAndView mav = new ModelAndView();
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(UserStatusService.userStatusListTotal());
//		
//		List<Map<String, Object>> userList = UserStatusService.getUserStatusList(cri);
//		
//		mav.addObject("userStatusList2", userList);
//		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("system_mgm/userStatusDef");
		return mav;
	}
	
	@RequestMapping(value="/userStatusSearch.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView userStatusSearch(@RequestParam(value="num", defaultValue="1") int num, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String searchName = request.getParameter("sear_nm");
		
		//검색한 총 유저 수
		int userCount = UserStatusService.userCount(searchName);
		
		//한페이지에 출력할 유저 갯수
		//int postNum = Integer.parseInt(viewNum);
		int postNum = 5;
		
		//하단 페이지 번호
		int pageNum = (int)Math.ceil((double)userCount/postNum);
		
		int displayPost = (num - 1)*postNum;
		
		List<Map<String, Object>> list = UserStatusService.listPage(displayPost, postNum, searchName);
		
		
		mav.addObject("userStatusList", list);
		mav.addObject("pageNum", pageNum);
		mav.addObject("num", num);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/userInfoUpdateFm.do", method=RequestMethod.GET)
	public ModelAndView userInfoUpdateFm(Criteria cri){
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> userList = UserStatusService.getUserStatusList(cri);
		
		mav.setViewName("system_mgm/userInfoUpdateFm");
		return mav;
	}
	
	@RequestMapping(value="/pwdInspection.do", method=RequestMethod.POST)
	public ModelAndView pwdInspection(@RequestParam HashMap<String, Object> map){
		ModelAndView mav = new ModelAndView();
		String sabun = (String) map.get("sabun");
		String pwd   = (String) map.get("pwd");
		
		String changePwd = UserSha256.encrypt((String)map.get("pwd"));
		map.put("pwd", changePwd);
		
		System.out.println(sabun);
		System.out.println(changePwd);
		
		int result  = UserStatusService.getPwdCheck(map);
		
		mav.addObject("result", result);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/pwdChange.do", method=RequestMethod.POST)
	public ModelAndView pwdChange(@RequestParam HashMap<String, Object> map) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String pwd   = (String) map.get("pwd");
		
		String changePwd = UserSha256.encrypt((String)map.get("pwd"));
		map.put("pwd", changePwd);
		
		UserStatusService.pwdChange(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//jqGrid 활용해서 게시판 만들기
	@RequestMapping(value="/jqgridFm.do", method=RequestMethod.GET)
	public String jqgridFm() throws Exception {
		
		return "system_mgm/userInfoUpdateFm2";
	}
	
	@RequestMapping(value="/jqGridList.do", method=RequestMethod.POST)
	public ModelAndView jqGridList(HttpServletRequest req) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String userNm = req.getParameter("userNm");
		
		System.out.println("Parameter : "+userNm);
		
		return mav;
	}
	
}
