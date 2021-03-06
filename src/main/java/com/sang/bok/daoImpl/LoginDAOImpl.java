package com.sang.bok.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.LoginDAO;
import com.sang.bok.vo.UserVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVO loginAuth(String user_id) {
		System.out.println("LoginDAO : " + user_id);
		UserVO vo = (UserVO) sqlSession.selectOne("userLogin.loginAuths", user_id);
		return vo;
	}

}
