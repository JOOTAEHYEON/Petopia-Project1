package com.spring.main.service;

import java.util.ArrayList;

import com.spring.main.vo.StrayAnimalVO;

public interface StrayAnimalService {
	
	ArrayList<StrayAnimalVO> getAllSA();
	ArrayList<StrayAnimalVO> getStrayAnimals(StrayAnimalVO StrayAnimalVO);
	StrayAnimalVO getSADetail(int asoo);

}
