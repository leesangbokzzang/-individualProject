package com.sang.bok.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.LoginDAO;
import com.sang.bok.vo.UserVO;
import com.sang.bok.vo.VacationVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVO loginAuth(String user_id) {
		System.out.println("LoginDAO : " + user_id);
		UserVO vo = (UserVO) sqlSession.selectOne("userLogin.loginAuths", user_id);
		return vo;
	}

	@Override
	public int getReviewCount(String sabun) {
		int reviewNum = (int) sqlSession.selectOne("userLogin.getReviewCount", sabun);
		return reviewNum;
	}

	@Override
	public int getApproverCount(String sabun) {
		int approverNum = (int) sqlSession.selectOne("userLogin.getApproverCount", sabun);
		return approverNum;
	}

	@Override
	public List<VacationVO> getReviewList(String sabun) {
		List<VacationVO> reviewList = sqlSession.selectList("userLogin.getReviewList", sabun);
		return reviewList;
	}

	@Override
	public List<VacationVO> getApproverList(String sabun) {
		List<VacationVO> approverList = sqlSession.selectList("userLogin.getApproverList", sabun);
		return approverList;
	}

}
