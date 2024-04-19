package com.spring.main.service.dao;

import java.util.ArrayList;

import com.spring.main.vo.StoreVO;



public interface StoreDAO {
	
	ArrayList<StoreVO> getAllStore();
	ArrayList<StoreVO> getAllStoreCat();
	StoreVO getAllDetail (StoreVO StoreVO);
	ArrayList<StoreVO> getAreaStore(String area);

} 


