package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.StoreService;

import com.spring.main.service.dao.StoreDAO;
import com.spring.main.vo.StoreVO;

@Service("storeService")
public  class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO  storeDAO;

	@Override
	@Transactional
	public ArrayList<StoreVO> getAllStore() {
		// TODO Auto-generated method stub
		return storeDAO.getAllStore();
		
	}

	@Override
	public ArrayList<StoreVO> getAllStoreCat() {
		// TODO Auto-generated method stub
		return storeDAO.getAllStoreCat();
	}

	@Override
	public StoreVO getAllDetail(StoreVO StoreVO) {
		// TODO Auto-generated method stub
		return storeDAO.getAllDetail(StoreVO);
	}

	   @Override
	   public ArrayList<StoreVO> getAreaStore(String area) {
	      // TODO Auto-generated method stub
	      return storeDAO.getAreaStore(area);
	   }

	

}
