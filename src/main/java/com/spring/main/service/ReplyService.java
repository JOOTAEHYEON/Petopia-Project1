package com.spring.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.main.vo.ReplyVO;

@Service
public interface ReplyService {
	
	//댓글 조회
	public List<ReplyVO> readReply(int bbsid) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	

}
