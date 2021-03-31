package com.sang.bok.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.sang.bok.vo.VacationVO;

public interface ReviewService {
	
	public HashMap<String, Object> getVacationView(int idx);
	
	//검토결재승인여부
	public void reviewaitingUpdate(String idx);
	
	//검토결재
	public void reviewOkInsert(HashMap<String, Object> map);

	
}
