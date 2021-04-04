package com.sang.bok.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sang.bok.vo.Criteria;
import com.sang.bok.vo.VacationVO;

public interface ReviewDAO {

	public HashMap<String, Object> getVacationView(int idx);
	
	//검토승인여부(결재)
	public void reviewaitingUpdate(String idx);
	
	//검토결재
	public void reviewOkInsert(HashMap<String, Object> map);
	
	//검토승인여부(반려)
	public void reviewaitingNo(String idx);
	
	//검토반려
	public void reviewNoInsert(HashMap<String, Object> map);
	
	//검토대기 리스트
	public Object getReviewList();
	
	//게시글 페이징 처리
	public List<Map<String, Object>> getBoardPaging(Criteria cri);
	
	//게시글 총 갯수 불러오기
	public int countboardListTotal();
	

	
}
