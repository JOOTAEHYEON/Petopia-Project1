package com.spring.main.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.main.vo.AnimalCenterVO;
@Mapper
public interface AnimalCenterDAO {
	ArrayList<AnimalCenterVO> getCenterinfo();
}
