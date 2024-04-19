package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.service.StoreService;
import com.spring.main.service.TaxiService;
import com.spring.main.vo.TaxiVO;
import com.spring.main.service.dao.TaxiDAO;

@Service("TaxiService")


public class TaxiServiceImpl implements TaxiService {
	
	
	

	@Autowired
	private TaxiDAO TaxiDAO;
	
	
	@Override
	public void inserttaxi(TaxiVO TaxiVO) {
		// TODO Auto-generated method stub
		
		TaxiDAO.inserttaxi(TaxiVO);
		
	}


	@Override
	public ArrayList<TaxiVO> searchtaxi(String email) {
		// TODO Auto-generated method stub
		return TaxiDAO.searchtaxi(email);
	}


	@Override
	public TaxiVO search2taxi(String random) {
		// TODO Auto-generated method stub
		return TaxiDAO.search2taxi(random);
	}


	@Override
	public void deletetaxi(String random) {
		// TODO Auto-generated method stub
		
		TaxiDAO.deletetaxi(random);
		
	}


}
