package com.sang.bok.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.dao.ReviewDAO;
import com.sang.bok.service.ReviewService;
import com.sang.bok.vo.VacationVO;

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

	

}
