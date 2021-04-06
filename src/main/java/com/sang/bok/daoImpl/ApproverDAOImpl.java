package com.sang.bok.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.ApproverDAO;
import com.sang.bok.vo.Criteria;

@Repository
public class ApproverDAOImpl implements ApproverDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public HashMap<String, Object> getVacationView(int idx) {
		HashMap<String, Object> list = sqlSession.selectOne("approver.getVacationView", idx);
		return list;
	}

	@Override
	public void approverWaitingUpdate(String idx) {
		sqlSession.update("approver.approverWaitingUpdate", idx);
	}

	@Override
	public void approverOkInsert(HashMap<String, Object> map) {
		sqlSession.insert("approver.approverOkInsert", map);
	}

	@Override
	public void approverWaitingNo(String idx) {
		sqlSession.update("approver.approverWaitingNo", idx);
	}

	@Override
	public void approverNoInsert(HashMap<String, Object> map) {
		sqlSession.insert("approver.approverNoInsert", map);
	}

	@Override
	public int countboardListTotal() {
		int result = sqlSession.selectOne("approver.countboardListTotal");
		return result;
	}

	@Override
	public List<Map<String, Object>> getBoardPaging(Criteria cri) {
		List<Map<String, Object>> list = sqlSession.selectList("approver.getBoardPaging", cri);
		return list;
	}

	@Override
	public int approverStatusListTotal() {
		int result = sqlSession.selectOne("approver.approverStatusListTotal");
		return result;
	}

	@Override
	public List<Map<String, Object>> getApproverStatusList(Criteria cri) {
		List<Map<String, Object>> list = sqlSession.selectList("approver.getApproverStatusList", cri);
		return list;
	}

}
