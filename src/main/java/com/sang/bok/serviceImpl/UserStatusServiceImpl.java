package com.sang.bok.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.daoImpl.UserStatusDAOImpl;
import com.sang.bok.service.UserStatusService;

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

	
	
	
	
}
