package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.HosListService;
import com.spring.main.service.dao.HosListDAO;
import com.spring.main.vo.HosListVO;



@Service("hosListService")
public class HosListServiceImpl implements HosListService{

	  @Autowired 
	  private HosListDAO hoslistkaja;
	
	  @Transactional public ArrayList<HosListVO> getHosAllList() { 
	  // TODO Auto-generated method stub
	   return hoslistkaja.getHosAllList(); 
	  }
	  

	  //수정본 test
	  public HosListVO getHosListinfo(String hname) {
		  // TODO Auto-generated method stub
		  return hoslistkaja.getHosListinfo(hname); 
	  }
	  
	  @Transactional
	     public ArrayList<HosListVO> getHosAreaList(String area) {
	      // TODO Auto-generated method stub
	      return hoslistkaja.getHosAreaList(area);
	   }

}
