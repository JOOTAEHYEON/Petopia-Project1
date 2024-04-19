package com.spring.main.service;

import java.util.ArrayList;


import com.spring.main.vo.HotListVO;

public interface HotListService {
	
	public ArrayList<HotListVO> getHotAllList();
	public ArrayList<HotListVO> getHotAreaList(String area);
	public HotListVO getHotListinfo(String htname); 
	


}
