package com.spring.main.service.dao;

import java.util.ArrayList;

import com.spring.main.vo.StrayAnimalVO;

public interface StrayAnimalDAO {
	
 ArrayList<StrayAnimalVO> getAllSA() ;
 ArrayList<StrayAnimalVO> getStrayAnimals(StrayAnimalVO StrayAnimalVO);
 StrayAnimalVO getSADetail(int asoo);
}
