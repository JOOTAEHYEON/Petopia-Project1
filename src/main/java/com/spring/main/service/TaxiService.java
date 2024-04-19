package com.spring.main.service;

import java.util.ArrayList;

import com.spring.main.vo.TaxiVO;

public interface TaxiService {
	
	
	
	void inserttaxi (TaxiVO TaxiVO);
	
	
	ArrayList<TaxiVO>searchtaxi(String email);
	
	
	TaxiVO search2taxi(String random);
	
	
	void deletetaxi (String random);
	
	

}
