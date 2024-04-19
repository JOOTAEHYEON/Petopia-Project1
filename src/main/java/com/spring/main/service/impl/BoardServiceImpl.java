package com.spring.main.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.main.service.BoardService;
import com.spring.main.service.dao.BoardDAO;
import com.spring.main.vo.BoardVO;


@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	// private String uploadPath = "c:/temp/";

	// 게시글 전체 리스트
	@Override
	public ArrayList<BoardVO> getAllBoard() {
		// TODO Auto-generated method stub
		return boardDAO.getAllBoard();
	}

	// 게시물 작성
	@Override
	public boolean insertBoard(BoardVO boardVO) {
		// 파일 저장
		
		  MultipartFile uploadFile = boardVO.getFile();
		  
		  // 이미지 파일만 업로드
		  
		  if (!Objects.requireNonNull(uploadFile.getContentType()).startsWith("image"))
		  { System.out.println("this file is not image type"); return false; }
		  
		  
		  // 실제 파일 이름 IE나 Edge는 전체 경로가 들어오므로 => 바뀐 듯 .. 
		  String orginalName = uploadFile.getOriginalFilename(); // full path 
		  
		  String fileName =
		  orginalName.substring(orginalName.lastIndexOf("\\") + 1); // file name only
		  
		  System.out.println("fileName: "+fileName);
		  
		  String uuid = UUID.randomUUID().toString();
		  
		  // 저장할 파일 이름 중간에 "_"를 이용해서 구현 
		  String uploadPath = "C:\\Temp";
		  String saveName = uploadPath + File.separator + uuid + "_" + fileName;
		  
		  File savePath = new File(saveName);
		  
		  try { 
			  uploadFile.transferTo(savePath); // 실제 이미지 저장
		  	  boardVO.setBbsavailable(uuid + "_" + fileName);
		  
		  } catch (IOException e) { e.printStackTrace(); }
		 

		boardDAO.insertBoard(boardVO);
		return true;

	}

	// 게시물 상세조회
	@Override
	public BoardVO getBoardDetail(int bbsid) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardDetail(bbsid);
	}

	// 게시물 삭제
	@Override
	public void deleteBoard(int bbsid) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(bbsid);
	}

	// 게시물 수정
	@Override
	public void updateBoard(BoardVO boardVO) {

		boardDAO.updateBoard(boardVO);
	}

	/*
	 * //댓글 작성
	 * 
	 * @Override public void writeReply(ReplyVO vo) { boardDAO.writeReply(vo); }
	 * 
	 * 
	 * //댓글 리스트
	 * 
	 * @Override public List<ReplyVO> readReply(int bbsid) { return
	 * boardDAO.readReply(bbsid); }
	 */

}
