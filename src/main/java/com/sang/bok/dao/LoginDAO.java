package com.sang.bok.dao;

import com.sang.bok.vo.UserVO;

public interface LoginDAO {

	public UserVO loginAuth(String user_id);
	
}
