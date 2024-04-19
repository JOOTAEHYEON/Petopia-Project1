package com.spring.main.service.impl;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.service.AnimalCenterService;


import com.spring.main.service.dao.AnimalCenterDAO;
import com.spring.main.vo.AnimalCenterVO;


@Service("AnimalCenterService")
public  class AnimalCenterServiceImpl implements AnimalCenterService {
	
	@Autowired
	private AnimalCenterDAO AnimalCenterDAO ;

	@Override
	public ArrayList<AnimalCenterVO> getCenterinfo() {
		// TODO Auto-generated method stub
		return AnimalCenterDAO.getCenterinfo();
	}

	

	

	
	

}
