package com.spring.main.service.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.main.vo.ReplyVO;

@Mapper
public interface ReplyDAO { 
	
	//댓글 조회
	public List<ReplyVO> readReply(int bbsid) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyVO ReplyVO) throws Exception;


}


