package com.sang.bok;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sang.bok.security.UserSha256;
import com.sang.bok.service.LoginService;
import com.sang.bok.vo.UserVO;
import com.sang.bok.vo.VacationVO;

@Controller
public class LoginController {
	@Autowired
	private LoginService logoinService;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public ModelAndView mainMove(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		String sabun = (String) session.getAttribute("sabun");
		
		//검토대기 조회
		int reviewNum = logoinService.getReviewCount(sabun);
		mav.addObject("reviewNum", reviewNum);
		
		//검토대기 현황 리스트
		List<VacationVO> reviewList = logoinService.getReviewList(sabun);
		mav.addObject("reviewList", reviewList);
		
		//승인대기 조회
		int approverNum = logoinService.getApproverCount(sabun);
		mav.addObject("approverNum", approverNum);
		
		//승인대기 현황 리스트
		List<VacationVO> approverList = logoinService.getApproverList(sabun);
		
		mav.addObject("approverList", approverList);
		mav.setViewName("main/main");
		return mav;
		
	}
	
	@RequestMapping(value="/logincheck.do", method = RequestMethod.GET)
	public ModelAndView login() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/login");
		return mav;
	}
	
	@RequestMapping(value="/userLoginFm.do", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,
							  HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
		System.out.println("loginController!!");
		String user_id = request.getParameter("user_sabun");
		String pwd = request.getParameter("password");
		String idsave = request.getParameter("idsave");
		
		String user_pw = UserSha256.encrypt(pwd);
		
		UserVO userVo = logoinService.loginAuth(user_id);
		
		System.out.println(idsave);
		
		if(userVo != null){
			if(userVo.getPassword().equals(user_pw)){
				if(idsave != null){
					Cookie cookie = new Cookie("user_id", java.net.URLEncoder.encode(userVo.getSabun()));
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}else{
					Cookie cookie = new Cookie("idsave", "");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("sabun", userVo.getSabun());
				session.setAttribute("user_name", userVo.getUser_nm());
				session.setAttribute("email", userVo.getEmail());
				session.setAttribute("phone_num", userVo.getPhonenum());
				session.setAttribute("user_position", userVo.getUser_position());
				session.setAttribute("team_nm", userVo.getTeam_nm());
				session.setAttribute("grade", userVo.getGrade());
				
				mav.setViewName("redirect:/main.do");
				
			}else{
				System.out.println("비번 틀림");
				mav.setViewName("redirect:/logincheck.do?ng=1");
			}
		}else{
			System.out.println("아이디 틀림");
			mav.setViewName("redirect:/logincheck.do?ng=3");
		}

		return mav;
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		//세션 끊기
		session.invalidate();
		mav.setViewName("redirect:/logincheck.do");
		return mav;
	}
	

}
