package com.sang.bok.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sang.bok.dao.UserStatusDAO;
import com.sang.bok.vo.Criteria;

@Repository
public class UserStatusDAOImpl implements UserStatusDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int UserInsertFm(HashMap<String, Object> map) {
		int result = sqlSession.insert("userStatusSql.userStatusInsert", map);
		return result;
	}

	@Override
	public List<Object> getUserList() {
		List<Object> list = sqlSession.selectList("userStatusSql.getUserListSelect");
		return list;
	}

	@Override
	public List<Object> UserSabunFm(HashMap<String, Object> map) {
		List<Object> result = sqlSession.selectList("userStatusSql.getUserSabun", map);
		System.out.println(result);
		return result;
	}

	@Override
	public int UserUpdateFm(HashMap<String, Object> map) {
		int result = sqlSession.update("userStatusSql.userUpdate", map);
		return result;
	}

	@Override
	public int UserDeleteFm(HashMap<String, Object> map) {
		int result = sqlSession.update("userStatusSql.userDelete", map);
		return result;
	}

	@Override
	public int UserPwdResetFm(HashMap<String, Object> map) {
		int result = sqlSession.update("userStatusSql.userPwdReset", map);
		return result;
	}

	public int userStatusListTotal() {
		int result = sqlSession.selectOne("userStatusSql.userStatusListTotal");
		return result;
	}

	public List<Map<String, Object>> getUserStatusList(Criteria cri) {
		List<Map<String, Object>> list = sqlSession.selectList("userStatusSql.getUserStatusList", cri);
		return list;
	}

	public List<Map<String, Object>> getuserStatusList(HashMap<String, Object> list) {
		List<Map<String, Object>> userList = sqlSession.selectList("userStatusSql.getuserStatusList", list);
		return userList;
	}
	

}
