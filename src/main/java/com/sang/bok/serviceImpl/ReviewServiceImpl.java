package com.sang.bok.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.dao.ReviewDAO;
import com.sang.bok.service.ReviewService;
import com.sang.bok.vo.Criteria;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public HashMap<String, Object> getVacationView(int idx) {
		HashMap<String, Object> vo = reviewDAO.getVacationView(idx);
		return vo;
	}
	
	@Override
	public void reviewOkInsert(HashMap<String, Object> map) {
		reviewDAO.reviewOkInsert(map);
		
	}

	@Override
	public void reviewaitingUpdate(String idx) {
		reviewDAO.reviewaitingUpdate(idx);
		
	}

	@Override
	public void reviewaitingNo(String idx) {
		reviewDAO.reviewaitingNo(idx);
	}

	@Override
	public void reviewNoInsert(HashMap<String, Object> map) {
		reviewDAO.reviewNoInsert(map);
		
	}

	@Override
	public Object getReviewList() {
		Object vo = reviewDAO.getReviewList();
		return vo;
	}

	@Override
	public List<Map<String, Object>> getBoardPaging(Criteria cri) {
		List<Map<String, Object>> list = reviewDAO.getBoardPaging(cri);
		return list;
	}

	@Override
	public int countboardListTotal() {
		int result = reviewDAO.countboardListTotal();
		return result;
	}

	@Override
	public List<Map<String, Object>> getReviewStatusList(Criteria cri) {
		List<Map<String, Object>> list = reviewDAO.getReviewStatusList(cri);
		return list;
	}

	@Override
	public int reviewStatusListTotal() {
		int result = reviewDAO.reviewStatusListTotal();
		return result;
	}

	




	

}
