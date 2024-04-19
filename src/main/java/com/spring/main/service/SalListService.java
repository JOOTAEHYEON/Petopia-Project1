package com.spring.main.service;

import java.util.ArrayList;

import com.spring.main.vo.HosListVO;
import com.spring.main.vo.SalListVO;

public interface SalListService {
	
	public ArrayList<SalListVO> getSalAllList();
	public ArrayList<SalListVO> getSalAreaList(String area);
	public SalListVO getSalListinfo(String lsname); 


}
