package com.sang.bok.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sang.bok.vo.Criteria;

public interface ApproverDAO {

	public HashMap<String, Object> getVacationView(int idx);

	public void approverWaitingUpdate(String idx);

	public void approverOkInsert(HashMap<String, Object> map);

	public void approverWaitingNo(String idx);

	public void approverNoInsert(HashMap<String, Object> map);

	public int countboardListTotal();

	public List<Map<String, Object>> getBoardPaging(Criteria cri);

	public int approverStatusListTotal();

	public List<Map<String, Object>> getApproverStatusList(Criteria cri);
	
}
