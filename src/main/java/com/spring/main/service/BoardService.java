package com.spring.main.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.main.vo.BoardVO;
import com.spring.main.vo.ReplyVO;

public interface BoardService {
	
	//게시글 전체 리스트
	ArrayList<BoardVO> getAllBoard();
	
	//게시물 상세 조회
	BoardVO getBoardDetail(int bbsid);

	//게시물 작성
	boolean insertBoard(BoardVO BoardVO);
	
	//게시물 수정
	void updateBoard(BoardVO boardVO);
	
	//게시물 삭제
	void deleteBoard(int bbsid);
	
	/*
	 * //댓글 리스트 List<ReplyVO> readReply(int bbsid);
	 * 
	 * //댓글 작성 void writeReply(ReplyVO vo);
	 */
	
}
