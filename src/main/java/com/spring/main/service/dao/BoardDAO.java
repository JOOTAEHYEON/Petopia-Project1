package com.spring.main.service.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.main.vo.BoardVO;
import com.spring.main.vo.ReplyVO;

@Mapper
public interface BoardDAO {

	ArrayList<BoardVO> getAllBoard();
    
    void insertBoard(BoardVO boardVO);
    
    public BoardVO getBoardDetail(int bbsid);
    
    void deleteBoard(int bbsid);
    
    void updateBoard(BoardVO boardVO);
    
	/*
	 * // 댓글 작성 void writeReply(ReplyVO vo);
	 * 
	 * // 댓글 리스트 조회 List<ReplyVO> readReply(int bbsid);
	 */
}
