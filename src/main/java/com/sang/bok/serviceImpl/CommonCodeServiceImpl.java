package com.sang.bok.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.daoImpl.CommonCodeDAOImpl;
import com.sang.bok.service.CommonCodeService;

@Service
public class CommonCodeServiceImpl implements CommonCodeService{

	@Autowired
	private CommonCodeDAOImpl CommonCodeDAO;
	
	@Override
	public List<Object> getPositionFG() {
		List<Object> list = CommonCodeDAO.getPositionFG();
		return list;
	}

	@Override
	public List<Object> getTeamFG() {
		List<Object> list = CommonCodeDAO.getTeamFG();
		return list;
	}
	
	
	
}
