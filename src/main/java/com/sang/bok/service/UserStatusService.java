package com.sang.bok.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sang.bok.vo.Criteria;

public interface UserStatusService {
	
	//사용자 등록
	public int UserInsertFm(HashMap<String, Object> map);
	
	//사용자검색 리스트
	public List<Object> getUserList();
	
	//사용자현황
	public List<Object> UserSabunFm(HashMap<String, Object> map);
	
	//사용자 수정
	public int UserUpdateFm(HashMap<String, Object> map);
	
	//사용자 삭제
	public int UserDeleteFm(HashMap<String, Object> map);
	
	//암호초기화
	public int UserPwdResetFm(HashMap<String, Object> map);
	
	//사용자현황 count
	public int userStatusListTotal();
	
	//사용자현황 리스트
	public List<Map<String, Object>> getUserStatusList(Criteria cri);
	
	
}
