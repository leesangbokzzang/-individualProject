package com.sang.bok.service;

import com.sang.bok.vo.UserVO;

public interface LoginService {
	//로그인 
	public UserVO loginAuth(String user_id);
}
