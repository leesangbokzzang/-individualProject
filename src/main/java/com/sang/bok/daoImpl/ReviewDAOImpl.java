package com.sang.bok.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.ReviewDAO;
import com.sang.bok.vo.Criteria;
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

	@Override
	public void reviewaitingNo(String idx) {
		sqlSession.update("review.reviewaitingNo", idx);
		
	}

	@Override
	public void reviewNoInsert(HashMap<String, Object> map) {
		sqlSession.insert("review.reviewNoInsert", map);
	}

	@Override
	public Object getReviewList() {
		Object vo = sqlSession.selectList("review.getReviewList");
		return vo;
	}

	@Override
	public List<Map<String, Object>> getBoardPaging(Criteria cri) {
		List<Map<String, Object>> list = sqlSession.selectList("review.getBoardPaging", cri);
		return list;
	}

	@Override
	public int countboardListTotal() {
		int result = sqlSession.selectOne("review.countboardListTotal");
		return result;
	}

	@Override
	public List<Map<String, Object>> getReviewStatusList(Criteria cri) {
		List<Map<String, Object>> list = sqlSession.selectList("review.getReviewStatusList", cri);
		return list;
	}

	@Override
	public int reviewStatusListTotal() {
		int result = sqlSession.selectOne("review.reviewStatusListTotal");
		return result;
	}

	


}
