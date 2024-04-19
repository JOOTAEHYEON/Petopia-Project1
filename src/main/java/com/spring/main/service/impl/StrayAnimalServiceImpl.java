package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.dao.StrayAnimalDAO;
import com.spring.main.vo.StrayAnimalVO;
import com.spring.main.service.StrayAnimalService;



@Service("StrayAnimalService")
public  class StrayAnimalServiceImpl implements StrayAnimalService {
	
	@Autowired
	private StrayAnimalDAO  StrayAnimalDAO;

	@Override
	public ArrayList<StrayAnimalVO> getAllSA() {
		// TODO Auto-generated method stub
		return StrayAnimalDAO.getAllSA();
	}

	@Override
	public ArrayList<StrayAnimalVO> getStrayAnimals(StrayAnimalVO StrayAnimalVO) {
		// TODO Auto-generated method stub
		return StrayAnimalDAO.getStrayAnimals(StrayAnimalVO);
	}

	@Override
	public StrayAnimalVO getSADetail(int asoo) {
		// TODO Auto-generated method stub
		return StrayAnimalDAO.getSADetail(asoo);
	}


	
	
	

}
