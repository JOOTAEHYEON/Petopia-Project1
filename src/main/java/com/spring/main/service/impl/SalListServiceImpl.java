package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.HosListService;
import com.spring.main.service.SalListService;
import com.spring.main.service.dao.HosListDAO;

import com.spring.main.service.dao.SalListDAO;
import com.spring.main.vo.HosListVO;

import com.spring.main.vo.SalListVO;


@Service("SallistService")
public class SalListServiceImpl implements SalListService{

	  @Autowired 
	  private SalListDAO sallistkaja;
	
	  @Transactional public ArrayList<SalListVO> getSalAllList() { 
	  // TODO Auto-generated method stub
	   return sallistkaja.getSalAllList(); 
	  }
	  

	  //수정본 test
	  public SalListVO getSalListinfo(String lsname) {
		  // TODO Auto-generated method stub
		  return sallistkaja.getSalListinfo(lsname); 
	  }
	  
	  @Override
	   public ArrayList<SalListVO> getSalAreaList(String area) {
	      // TODO Auto-generated method stub
	      return sallistkaja.getSalAreaList(area);
	   }

}
