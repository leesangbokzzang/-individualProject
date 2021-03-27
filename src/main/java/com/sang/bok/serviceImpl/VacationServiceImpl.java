package com.sang.bok.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sang.bok.dao.VacationDAO;
import com.sang.bok.service.VacationService;
import com.sang.bok.vo.VacationVO;

@Service
public class VacationServiceImpl implements VacationService {
	
	@Autowired
	private VacationDAO vacationDao;
	
	@Override
	public void vacationInsert(HashMap<String, Object> hashMap) {
		vacationDao.vacationInsert(hashMap);
	}
	

	

	
}
