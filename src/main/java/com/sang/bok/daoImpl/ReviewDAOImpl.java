package com.sang.bok.daoImpl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.ReviewDAO;
import com.sang.bok.vo.VacationVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public HashMap<String, Object> getVacationView(int idx) {
		HashMap<String, Object> vo = sqlSession.selectOne("review.getReviewOne", idx);
		return vo;
	}
	
	@Override
	public void reviewaitingUpdate(String idx) {
		sqlSession.update("review.reviewaitingUpdate",idx);
		
	}
	
	@Override
	public void reviewOkInsert(HashMap<String, Object> map) {
		sqlSession.insert("review.reviewOkInsert", map);
	}


}
