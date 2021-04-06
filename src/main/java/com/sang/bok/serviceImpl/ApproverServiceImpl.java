package com.sang.bok.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.dao.ApproverDAO;
import com.sang.bok.service.ApproverService;
import com.sang.bok.vo.Criteria;

@Service
public class ApproverServiceImpl implements ApproverService {
	
	@Autowired
	private ApproverDAO approverDAO;
	
	@Override
	public HashMap<String, Object> getVacationView(int idx) {
		HashMap<String, Object> list = approverDAO.getVacationView(idx);
		return list;
	}

	@Override
	public void approverWaitingUpdate(String idx) {
		approverDAO.approverWaitingUpdate(idx);
		
	}

	@Override
	public void approverOkInsert(HashMap<String, Object> map) {
		approverDAO.approverOkInsert(map);
		
	}

	@Override
	public void approverWaitingNo(String idx) {
		approverDAO.approverWaitingNo(idx);
		
	}

	@Override
	public void approverNoInsert(HashMap<String, Object> map) {
		approverDAO.approverNoInsert(map);
		
	}

	@Override
	public int countboardListTotal() {
		int result = approverDAO.countboardListTotal();
		return result;
	}

	@Override
	public List<Map<String, Object>> getBoardPaging(Criteria cri) {
		List<Map<String, Object>> list = approverDAO.getBoardPaging(cri);
		return list;
	}

	@Override
	public int approverStatusListTotal() {
		int result = approverDAO.approverStatusListTotal();
		return result;
	}

	@Override
	public List<Map<String, Object>> getApproverStatusList(Criteria cri) {
		List<Map<String, Object>> list = approverDAO.getApproverStatusList(cri);
		return list;
	}

}
