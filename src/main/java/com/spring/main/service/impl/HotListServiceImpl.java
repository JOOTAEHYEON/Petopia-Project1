package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.HotListService;

import com.spring.main.service.dao.HotListDAO;
import com.spring.main.vo.HotListVO;



@Service("HotlistService")
public class HotListServiceImpl implements HotListService{

	  @Autowired 
	  private HotListDAO hotlistkaja;
	
	  @Transactional public ArrayList<HotListVO> getHotAllList() { 
	  // TODO Auto-generated method stub
	   return hotlistkaja.getHotAllList(); 
	  }
	  

	  //수정본 test
	  public HotListVO getHotListinfo(String htname) {
		  // TODO Auto-generated method stub
		  return hotlistkaja.getHotListinfo(htname); 
	  }

	  @Override
	   public ArrayList<HotListVO> getHotAreaList(String area) {
	      // TODO Auto-generated method stub
	      return hotlistkaja.getHotAreaList(area);
	   }

}
