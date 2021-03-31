package com.sang.bok.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.sang.bok.vo.VacationVO;

public interface ReviewDAO {

	public HashMap<String, Object> getVacationView(int idx);
	
	//검토승인여부
	public void reviewaitingUpdate(String idx);
	
	//검토결재
	public void reviewOkInsert(HashMap<String, Object> map);

	
}
