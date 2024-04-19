package com.spring.main.service;

import java.util.ArrayList;

import com.spring.main.vo.HosListVO;

public interface HosListService {
	
	public ArrayList<HosListVO> getHosAllList();
	public ArrayList<HosListVO> getHosAreaList(String area);
	public HosListVO getHosListinfo(String hname); 
	

}
