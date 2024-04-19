package com.spring.main.service;

import java.util.ArrayList;


import com.spring.main.vo.StoreVO;

public interface StoreService {
	
	ArrayList<StoreVO> getAllStore();
	ArrayList<StoreVO> getAllStoreCat();
	StoreVO getAllDetail (StoreVO StoreVO);
	ArrayList<StoreVO> getAreaStore(String area);
}
