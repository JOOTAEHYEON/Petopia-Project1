package com.spring.main.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.main.vo.HosListVO;

@Mapper
public interface HosListDAO { 
	
	//병원 전체 리스트
	public ArrayList<HosListVO> getHosAllList();

	//병원 상세 정보
	public HosListVO getHosListinfo(String hname);
	public ArrayList<HosListVO> getHosAreaList(String area);

	

}


