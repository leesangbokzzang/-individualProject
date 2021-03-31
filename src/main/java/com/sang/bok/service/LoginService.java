package com.sang.bok.service;

import java.util.List;

import com.sang.bok.vo.UserVO;
import com.sang.bok.vo.VacationVO;

public interface LoginService {
	//로그인 
	public UserVO loginAuth(String user_id);
	
	//검토대기 조회
	public int getReviewCount(String sabun);
	
	//승인대기 조회
	public int getApproverCount(String sabun);
	
	//검토대기 리스트 조회
	public List<VacationVO> getReviewList(String sabun);
	
	//승인대기 리스트 조회
	public List<VacationVO> getApproverList(String sabun);
	
}
