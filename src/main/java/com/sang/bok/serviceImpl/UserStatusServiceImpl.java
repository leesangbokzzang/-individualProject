package com.sang.bok.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.daoImpl.UserStatusDAOImpl;
import com.sang.bok.service.UserStatusService;
import com.sang.bok.vo.Criteria;

@Service
public class UserStatusServiceImpl implements UserStatusService{

	@Autowired
	private UserStatusDAOImpl UserStatusDAO;
	
	@Override
	public int UserInsertFm(HashMap<String, Object> map) {
		int result = UserStatusDAO.UserInsertFm(map);
		return result;
	}

	@Override
	public List<Object> getUserList() {
		List<Object> list = UserStatusDAO.getUserList();
		return list;
	}

	@Override
	public List<Object> UserSabunFm(HashMap<String, Object> map) {
		List<Object> result = UserStatusDAO.UserSabunFm(map);
		return result;
	}

	@Override
	public int UserUpdateFm(HashMap<String, Object> map) {
		int result = UserStatusDAO.UserUpdateFm(map);
		return result;
	}

	@Override
	public int UserDeleteFm(HashMap<String, Object> map) {
		int result = UserStatusDAO.UserDeleteFm(map);
		return result;
	}

	@Override
	public int UserPwdResetFm(HashMap<String, Object> map) {
		int result = UserStatusDAO.UserPwdResetFm(map);
		return result;
	}

	@Override
	public int userStatusListTotal() {
		int result = UserStatusDAO.userStatusListTotal();
		return result;
	}

	@Override
	public List<Map<String, Object>> getUserStatusList(Criteria cri) {
		List<Map<String, Object>> list = UserStatusDAO.getUserStatusList(cri);
		return list;
	}

	public List<Map<String, Object>> getuserStatusList(HashMap<String, Object> list) {
		List<Map<String, Object>> userList = UserStatusDAO.getuserStatusList(list);
		return userList;
	}

	public int getPwdCheck(HashMap<String, Object> map) {
		int result = UserStatusDAO.getPwdCheck(map);
		return result;
	}

	public void pwdChange(HashMap<String, Object> map) {
		UserStatusDAO.pwdChange(map);
	}

	public int userCount(String searchName) {
		int userCount = UserStatusDAO.userCount(searchName);
		return userCount;
	}

	public List<Map<String, Object>> listPage(int displayPost, int postNum, String searchName) {
		List<Map<String, Object>> listPage = UserStatusDAO.listPage(displayPost, postNum, searchName);
		return listPage;
	}

	
	
	
	
}
