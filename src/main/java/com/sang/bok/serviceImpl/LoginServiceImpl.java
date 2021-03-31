package com.sang.bok.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.dao.LoginDAO;
import com.sang.bok.service.LoginService;
import com.sang.bok.vo.UserVO;
import com.sang.bok.vo.VacationVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public UserVO loginAuth(String user_id) {
		UserVO vo = loginDAO.loginAuth(user_id);
		return vo;
	}

	@Override
	public int getReviewCount(String sabun) {
		int reviewNum = loginDAO.getReviewCount(sabun);
		return reviewNum;
	}

	@Override
	public int getApproverCount(String sabun) {
		int approverNum = loginDAO.getApproverCount(sabun);
		return approverNum;
	}

	@Override
	public List<VacationVO> getReviewList(String sabun) {
		List<VacationVO> reviewList = loginDAO.getReviewList(sabun);
		return reviewList;
	}

	@Override
	public List<VacationVO> getApproverList(String sabun) {
		List<VacationVO> approverList = loginDAO.getApproverList(sabun);
		return approverList;
	}
	
	

}
