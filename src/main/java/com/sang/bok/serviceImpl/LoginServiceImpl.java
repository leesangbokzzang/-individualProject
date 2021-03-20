package com.sang.bok.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.dao.LoginDAO;
import com.sang.bok.service.LoginService;
import com.sang.bok.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public UserVO loginAuth(String user_id) {
		UserVO vo = loginDAO.loginAuth(user_id);
		return vo;
	}
	
	

}
