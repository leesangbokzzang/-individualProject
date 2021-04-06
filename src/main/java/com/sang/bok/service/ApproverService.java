package com.sang.bok.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sang.bok.vo.Criteria;

public interface ApproverService {
	
	//승인대기(상세) 
	public HashMap<String, Object> getVacationView(int idx);
	
	public void approverWaitingUpdate(String idx);
	
	//승인결재 처리
	public void approverOkInsert(HashMap<String, Object> map);
	
	public void approverWaitingNo(String idx);
	
	//승인반려 처리
	public void approverNoInsert(HashMap<String, Object> map);

	public int countboardListTotal();
	
	//승인대기 페이지
	public List<Map<String, Object>> getBoardPaging(Criteria cri);

	public int approverStatusListTotal();

	public List<Map<String, Object>> getApproverStatusList(Criteria cri);
	
}
