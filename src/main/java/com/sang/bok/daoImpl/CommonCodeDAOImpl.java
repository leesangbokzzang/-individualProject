package com.sang.bok.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.CommonCodeDAO;

@Repository
public class CommonCodeDAOImpl implements CommonCodeDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Object> getPositionFG() {
		List<Object> list = sqlSession.selectList("codeSql.getPositionFG");
		return list;
	}

	@Override
	public List<Object> getTeamFG() {
		List<Object> list = sqlSession.selectList("codeSql.getTeamFG");
		return list;
	}
	
	
	
}
