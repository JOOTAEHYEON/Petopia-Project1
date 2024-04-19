package com.spring.main.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.main.vo.HosListVO;
import com.spring.main.vo.SalListVO;

@Mapper
public interface SalListDAO { 
	
	//미용실 전체 리스트
	public ArrayList<SalListVO> getSalAllList();
	public ArrayList<SalListVO> getSalAreaList(String area);

	//미용실 상세 정보
	public SalListVO getSalListinfo(String lsname);
	

}


