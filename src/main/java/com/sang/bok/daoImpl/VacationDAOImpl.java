package com.sang.bok.daoImpl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.VacationDAO;
import com.sang.bok.vo.VacationVO;

@Repository
public class VacationDAOImpl implements VacationDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void vacationInsert(HashMap<String, Object> hashMap) {
		sqlSession.insert("leaveVacation.vacationInsert",hashMap);
	}
}
