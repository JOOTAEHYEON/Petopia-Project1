package com.spring.main.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.HotListService;
import com.spring.main.service.ReplyService;
import com.spring.main.service.dao.HotListDAO;
import com.spring.main.service.dao.ReplyDAO;
import com.spring.main.vo.BoardVO;
import com.spring.main.vo.HosListVO;
import com.spring.main.vo.HotListVO;
import com.spring.main.vo.ReplyVO;


@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{
	
	
	  @Inject 
	  private ReplyDAO rdao;
	 
	  
	  @Override
	  public List<ReplyVO> readReply(int bbsid) throws Exception { 
	 
		  return rdao.readReply(bbsid); 
	  }
	  
	  @Override
	  public void writeReply(ReplyVO ReplyVO) throws Exception { 
	 
		  rdao.writeReply(ReplyVO); 
	  }
	  
	
}
