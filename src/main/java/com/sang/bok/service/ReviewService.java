package com.sang.bok.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sang.bok.vo.Criteria;

public interface ReviewService {
	
	public HashMap<String, Object> getVacationView(int idx);
	
	//검토결재승인여부(결재)
	public void reviewaitingUpdate(String idx);
	
	//검토결재
	public void reviewOkInsert(HashMap<String, Object> map);
	
	//검토결재승인여부(반려)
	public void reviewaitingNo(String idx);
	
	//검토반려
	public void reviewNoInsert(HashMap<String, Object> map);

	//검토대기 리스트
	public Object getReviewList();
	
	//검토대기 페이징 처리
	public List<Map<String, Object>> getBoardPaging(Criteria cri);
	
	//게시글 총갯수 불러오기
	public int countboardListTotal();
	
	//검토현황 리스트 
	public List<Map<String, Object>> getReviewStatusList(Criteria cri);
	
	//검토현황리스트 총개수
	public int reviewStatusListTotal();

	

	
}
