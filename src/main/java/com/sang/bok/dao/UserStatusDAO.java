package com.sang.bok.dao;

import java.util.HashMap;
import java.util.List;

public interface UserStatusDAO {
	
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
}
