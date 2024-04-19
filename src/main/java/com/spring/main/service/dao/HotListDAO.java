package com.spring.main.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.main.vo.HosListVO;
import com.spring.main.vo.HotListVO;

@Mapper
public interface HotListDAO { 
	
	//병원 전체 리스트
	public ArrayList<HotListVO> getHotAllList();
	 public ArrayList<HotListVO> getHotAreaList(String area);

	//병원 상세 정보
	public HotListVO getHotListinfo(String htname);
	

}


